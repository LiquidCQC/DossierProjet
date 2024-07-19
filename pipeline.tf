# Creation role IAM
resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-role-${var.pipeline_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline-policy-${var.pipeline_name}"
  role = aws_iam_role.codepipeline_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetBucketLocation",
          "s3:DeleteObject"
        ]
        Resource = [
          aws_s3_bucket.codepipeline_artifact_bucket.arn,
          "${aws_s3_bucket.codepipeline_artifact_bucket.arn}/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "codedeploy:CreateDeployment",
          "codedeploy:GetApplication",
          "codedeploy:GetDeploymentGroup"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-role-${var.pipeline_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name = "codebuild-policy-${var.pipeline_name}"
  role = aws_iam_role.codebuild_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "*"
      }
    ]
  })
}

# Creation bucket 
resource "aws_s3_bucket" "codepipeline_artifact_bucket" {
  bucket = "${var.pipeline_name}-artifact-bucket"

  tags = {
    Name        = "My bucket for codepipeline artifacts"
    Environment = "Dev"
  }
}

# CodeBuild
resource "aws_codebuild_project" "codebuild_project" {
  name         = "${var.pipeline_name}-build"
  service_role = aws_iam_role.codebuild_role.arn
  source {
    type            = "GITHUB"
    location        = "https://github.com/${var.repo_owner}/${var.repo_name}.git"
    git_clone_depth = 1
    buildspec       = "buildspec.yml"
  }

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
    type         = "LINUX_CONTAINER"
  }
}

# CodePipeline
resource "aws_codepipeline" "codepipeline" {
  name     = var.pipeline_name
  role_arn = aws_iam_role.codepipeline_role.id

  artifact_store {
    location = "${var.pipeline_name}-artifact-bucket"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      run_order        = 1
      output_artifacts = ["SourceArtifact"]

      configuration = {
        ConnectionArn        = var.codestar_connection_arn
        FullRepositoryId     = "${var.repo_owner}/${var.repo_name}"
        BranchName           = var.branch_name
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"
      run_order        = 1

      configuration = {
        ProjectName = "codebuild-${var.pipeline_name}"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "rp-pipe-deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["BuildArtifact"]
      version         = "1"

      configuration = {
        BucketName = "rp-react-app-eu"
        Extract    = "false"
        ObjectKey  = "/react-app.zip"
      }
    }
  }

  stage {
    name = "app"

    action {
      name            = "deploytoinstances"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      version         = "1"
      run_order       = 1
      input_artifacts = ["BuildArtifact"]
      configuration = {
        ApplicationName     = "app-${var.pipeline_name}"
        DeploymentGroupName = "app-${var.pipeline_name}"
      }
    }
  }
}
