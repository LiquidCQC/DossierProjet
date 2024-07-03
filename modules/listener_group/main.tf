resource "aws_lb_listener" "lg" {
  load_balancer_arn = var.lb_arn
  port              = var.port
  protocol          = var.protocol


  default_action {
    type             = "forward"
    target_group_arn = var.tg_arn
  }
}