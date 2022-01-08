resource "aws_vpc" "mi_red" {
  cidr_block = var.rango_cidr_vpc
  tags       = { Name = "vpc-${var.proyecto}" }
}

module subredes_privadas {
  source = "./modulazos/carpeta3"
  el_id_de_la_VPC = aws_vpc.mi_red.id
  proyecto  = var.proyecto
  cantidad_subredes = 3
  tipo_subred = "privada"
  los_az = ["eu-west-3a","eu-west-3b","eu-west-3c"]
  rangos_cidr_subredes = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
}

module subredes_publicas {
  source = "./modulazos/carpeta3"
  el_id_de_la_VPC = aws_vpc.mi_red.id
  proyecto  = var.proyecto
  cantidad_subredes = 3
  tipo_subred = "publica"
  los_az = ["eu-west-3a","eu-west-3b","eu-west-3c"]
  rangos_cidr_subredes = ["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
}