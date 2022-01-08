resource "aws_vpc" "mi_red" {
  cidr_block = var.rango_cidr_vpc
  tags       = { Name = "vpc-${var.proyecto}" }
}

module subred_a_crear {
  source = "./modulosLindos/carpeta3"
  el_id_de_la_VPC = aws_vpc.mi_red.id
  proyecto  = var.proyecto
  rango_cidr_subred = "172.82.178.0/24"
}