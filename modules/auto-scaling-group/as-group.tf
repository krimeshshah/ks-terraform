module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "8.1.0"

  # Autoscaling group
  name = "asg-${var.stage}"

  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = var.vpc_zone_identifier


  #   initial_lifecycle_hooks = [
  #     {
  #       name                  = "KSStartupLifeCycleHook"
  #       default_result        = "CONTINUE"
  #       heartbeat_timeout     = 60
  #       lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
  #       notification_metadata = jsonencode({ "hello" = "world" })
  #     },
  #     {
  #       name                  = "KSTerminationLifeCycleHook"
  #       default_result        = "CONTINUE"
  #       heartbeat_timeout     = 180
  #       lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
  #       notification_metadata = jsonencode({ "goodbye" = "world" })
  #     }
  #   ]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      checkpoint_delay       = 600
      checkpoint_percentages = [35, 70, 100]
      instance_warmup        = 300
      min_healthy_percentage = 50
      max_healthy_percentage = 100
    }
    triggers = ["tag"]
  }

  # Launch template
  launch_template_name        = "${var.stage}-asg"
  launch_template_description = "Launch template ks"
  key_name                    = aws_key_pair.ks_ssh_pub_key.key_name
  update_default_version      = true

  image_id          = "ami-0360c520857e3138f"
  instance_type     = "t2.micro"
  ebs_optimized     = true
  enable_monitoring = true

  # IAM role & instance profile
  create_iam_instance_profile = true
  iam_role_name               = "${var.stage}-asg"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM role ks"
  iam_role_tags = {
    CustomIamRole = "Yes"
  }
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]

  capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }

  ## Uncomment this if you are using t3 or more with t2 instances aws doesnt allow cpu_options to be configure with custom values
  # cpu_options = {
  #   core_count       = 1
  #   threads_per_core = 1
  # }

  credit_specification = {
    cpu_credits = "standard"
  }

  instance_market_options = {
    market_type = "spot"
  }

  # This will ensure imdsv2 is enabled, required, and a single hop which is aws security
  # best practices
  # See https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-4
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      security_groups       = var.asg_security_group
    }
    #   {
    #     delete_on_termination = true
    #     description           = "eth1"
    #     device_index          = 1
    #     security_groups       = ["sg-12345678"]
    #   }
  ]

  placement = {
    availability_zone = "us-east-1a"
  }

  traffic_source_attachments = [
    {
      type                      = "elbv2"
      traffic_source_identifier = var.target_group_arns
    }
  ]


  # tag_specifications = [
  #   {
  #     resource_type = "instance"
  #     tags          = { WhatAmI = "Instance" }
  #   },
  #   {
  #     resource_type = "volume"
  #     tags          = { WhatAmI = "Volume" }
  #   },
  #   {
  #     resource_type = "spot-instances-request"
  #     tags          = { WhatAmI = "SpotInstanceRequest" }
  #   }
  # ]

  tags = {
    Environment = "dev",
    Terraform   = "true"
  }
}