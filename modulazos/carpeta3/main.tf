resource "aws_subnet" "subred_privada_1" {
  count             = var.cantidad_subredes
  vpc_id            = var.el_id_de_la_VPC
  availability_zone = var.los_az[count.index]
  cidr_block        = var.rangos_cidr_subredes[count.index]
  tags              = { Name = "subnet-${var.tipo_subred}-${count.index+1}-${var.proyecto}" }
}