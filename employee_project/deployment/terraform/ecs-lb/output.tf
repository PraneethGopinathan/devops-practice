output "load_balancer_dns" {
  value = aws_lb.ecs_alb.dns_name
}