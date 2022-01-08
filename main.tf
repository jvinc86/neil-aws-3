module "subredes_privadas" {
  source               = "./modulazos/carpeta3"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  los_az               = var.AV_ZONES
  cantidad_subredes    = var.NRO_DE_SUBREDES
  tipo_subred          = "privada"
  rangos_cidr_subredes = var.CIDR_PRIVADOS_SUBRED
  asigna_ip_publica    = false
}

module "subredes_publicas" {
  source               = "./modulazos/carpeta3"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  los_az               = var.AV_ZONES
  cantidad_subredes    = var.NRO_DE_SUBREDES
  tipo_subred          = "publica"
  rangos_cidr_subredes = var.CIDR_PUBLICOS_SUBRED
  asigna_ip_publica    = true
}