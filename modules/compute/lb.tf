resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "attachment_tg" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.host-wp[count.index].id
  port             = 80
  count            = length(data.aws_subnet.public-subnet)
}

resource "aws_lb" "lb" {
  name               = "lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.lb-sg.id]
  subnets            = [for subnet in data.aws_subnet.public-subnet : subnet.id]
}

resource "aws_lb_listener" "ls" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_listener_rule" "lsr" {
  listener_arn = aws_lb_listener.ls.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
  condition {
    path_pattern {
      values = ["/"]
    }
  }
}

