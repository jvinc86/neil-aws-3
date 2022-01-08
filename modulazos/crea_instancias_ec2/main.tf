resource "aws_instance" "mis_vms" {
  count                       = var.cantidad_instancias
  ami                         = var.win_server_ami[var.region] #var.imagen_OS 
  instance_type               = var.tipo_instancia
  availability_zone           = var.AZs[count.index]
  subnet_id                   = var.los_IDs_subredes[count.index]
  vpc_security_group_ids      = [aws_security_group.mi_sec_group.id]
  user_data                   = data.template_file.userdata_win.rendered

  tags = { Name = "srv-${var.tipo_subred}-${var.proyecto}-${count.index + 1}" }
}

data "template_file" "userdata_win" {
  template = <<EOF
                <script>
                echo "" > _INIT_STARTED_
                net user ${var.instance_username} /add /y
                net user ${var.instance_username} ${var.instance_password}
                net localgroup administrators ${var.instance_username} /add
                netsh advfirewall set allprofiles state off
                echo "" > _INIT_COMPLETE_
                </script>
                <persist>false</persist>
              EOF
}

locals {
  reglas_ingress = [
    { puerto = 22
      resumen = "Puerto SSH" },
    { puerto = 3389
      resumen = "Puerto RDP" },
    { puerto = 80
      resumen = "Puerto HTTP" },
    { puerto = 443
      resumen = "Puerto HTTPS" }
  ]
}
resource "aws_security_group" "mi_sec_group" {
  name   = "${var.proyecto}-sg-${var.tipo_subred}"
  vpc_id = var.el_id_de_la_VPC

  dynamic "ingress" {
    for_each = local.reglas_ingress

    content {
      description = ingress.value.resumen
      from_port   = ingress.value.puerto
      to_port     = ingress.value.puerto
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    description      = "Permitir PING"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = { Name = "sg-${var.tipo_subred}-${var.proyecto}" }

}

resource "aws_network_acl" "mi_network_acl" {
  vpc_id     = var.el_id_de_la_VPC
  subnet_ids = var.los_IDs_subredes

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = { Name = "acl-${var.tipo_subred}-${var.proyecto}" }
}