module "subredes_privadas" {
  source               = "./modulazos/crea_subredes_privadas_o_publicas"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  los_az               = var.AV_ZONES
  cantidad_subredes    = var.NRO_DE_SUBREDES
  tipo_subred          = "privada"
  rangos_cidr_subredes = var.CIDR_PRIVADOS_SUBRED
  asigna_ip_publica    = false
}

module "subredes_publicas" {
  source               = "./modulazos/crea_subredes_privadas_o_publicas"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  los_az               = var.AV_ZONES
  cantidad_subredes    = var.NRO_DE_SUBREDES
  tipo_subred          = "publica"
  rangos_cidr_subredes = var.CIDR_PUBLICOS_SUBRED
  asigna_ip_publica    = true
}

module "instancias_ec2_publicas" {
  source               = "./modulazos/crea_instancias_ec2"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  cantidad_instancias  = var.CANTIDAD_INSTANCIAS
  tipo_subred          = "publica"
  los_IDs_subredes     = module.subredes_publicas.IDs_subredes

  AZs               = var.AV_ZONES
  win_server_ami    = var.WIN_SERVER_AMI
  region            = var.REGION
  tipo_instancia    = var.TIPO_INSTANCIA
  instance_username = var.INSTANCE_USERNAME
  instance_password = var.INSTANCE_PASSWORD
}

module "instancias_ec2_privadas" {
  source               = "./modulazos/crea_instancias_ec2"
  el_id_de_la_VPC      = aws_vpc.mi_red.id
  proyecto             = var.NOMBRE_PROYECTO
  cantidad_instancias  = var.CANTIDAD_INSTANCIAS
  tipo_subred          = "privadas"
  los_IDs_subredes     = module.subredes_privadas.IDs_subredes

  AZs               = var.AV_ZONES
  win_server_ami    = var.WIN_SERVER_AMI
  region            = var.REGION
  tipo_instancia    = var.TIPO_INSTANCIA
  instance_username = var.INSTANCE_USERNAME
  instance_password = var.INSTANCE_PASSWORD
}
