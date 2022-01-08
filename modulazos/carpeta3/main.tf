resource "aws_subnet" "subred_privada_1" {
  vpc_id            = var.el_id_de_la_VPC
  cidr_block        = var.rango_cidr_subred
  tags              = { Name = "subnet-${var.proyecto}" }
}