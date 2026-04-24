module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0.0"

  name    = "ks-alb"
  vpc_id  = var.lb_vpc_id
  subnets = var.lb_vpc_public_subnet_ids

  # Security Group
  security_group_ingress_rules = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "HTTP web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "HTTPS web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  #   access_logs = {
  #     bucket = "my-alb-logs"
  #   }

  listeners = {
    ks-http = {
      port     = 80
      protocol = "HTTP"

      forward = {
        target_group_key = "ks-instance"
      }
    }
    # ks-https = {
    #   port            = 443
    #   protocol        = "HTTPS"

    #   forward = {
    #     target_group_key = "ks-instance"
    #   }
    # }
  }

  target_groups = {
    ks-instance = {
      name_prefix       = "ks"
      protocol          = "HTTP"
      port              = 8080
      target_type       = "instance"
      create_attachment = false ### This option shoould only be set to true if we us static instance so that we can provide target instane id. 
      # With asg we dont know the targetid (i.e instance id) hence if we are using ASG then keep it false.
    }
  }

  tags = {
    Environment = var.stage
    Terraform   = "true"
  }
}
