
resource "aws_ecs_task_definition" "jenkins" {
  family             = local.jenkins_name
  task_role_arn      = data.terraform_remote_state.jenkins_base_infrastructure.outputs.jenkins_role
  execution_role_arn = data.terraform_remote_state.jenkins_base_infrastructure.outputs.jenkins_role
  cpu                = local.cpu
  memory             = local.memory
  network_mode       = "awsvpc"
  tags               = local.tags

  volume {
    name = "${local.jenkins_name}-efs"

    efs_volume_configuration {
      file_system_id     = data.terraform_remote_state.jenkins_base_infrastructure.outputs.efs_id
      transit_encryption = "ENABLED"

      authorization_config {
        access_point_id = data.terraform_remote_state.jenkins_base_infrastructure.outputs.efs_access_id
        iam             = "ENABLED"
      }
    }
  }

  container_definitions = <<EOF
[
  {
    "name": "${local.jenkins_name}",
    "image": "${var.jenkins_container_image}",
    "cpu": ${local.cpu},
    "memory": ${local.memory},
    "memoryReservation": ${local.memory},
    "environment": [
      {
        "name" : "JAVA_OPTS",
        "value" : "-Djenkins.install.runSetupWizard=false"
      },
      {
        "name": "PLUGINS_FORCE_UPGRADE",
        "value": "true"
      },
      {
        "name": "TRY_UPGRADE_IF_NO_MARKER",
        "value": "true"
      },
      {
        "name": "CASC_JENKINS_CONFIG",
        "value": "/opt/jenkins/casc_configs/jenkins.yaml"
      },
      {
        "name": "CASC_SSM_PREFIX",
        "value": "/kcdc/jenkins/"
      }
    ],
    "essential": true,
    "mountPoints": [
      {
        "containerPath": "/var/jenkins_home",
        "sourceVolume": "${local.jenkins_name}-efs"
      }
    ],
    "portMappings": [
      {
        "containerPort": 8080
      },
      {
        "containerPort": 50000
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
          "awslogs-group": "${data.terraform_remote_state.jenkins_base_infrastructure.outputs.jenkins_log_group}",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "controller"
      }
    }
  }
]
EOF
}

resource "aws_ecs_service" "jenkins" {
  name                              = local.jenkins_name
  cluster                           = data.terraform_remote_state.jenkins_base_infrastructure.outputs.jenkins_cluster_arn
  task_definition                   = aws_ecs_task_definition.jenkins.arn
  desired_count                     = 1
  launch_type                       = "FARGATE"
  health_check_grace_period_seconds = 300

  service_registries {
    registry_arn = data.terraform_remote_state.jenkins_base_infrastructure.outputs.service_discovery_arn
    port         = 50000
  }

  load_balancer {
    container_name   = local.jenkins_name
    container_port   = 8080
    target_group_arn = data.terraform_remote_state.jenkins_base_infrastructure.outputs.jenkins_service_target_group
  }

  network_configuration {
    security_groups = [data.terraform_remote_state.jenkins_base_infrastructure.outputs.jenkins_security_group]
    subnets         = data.terraform_remote_state.jenkins_base_infrastructure.outputs.subnet_ids
  }
}
