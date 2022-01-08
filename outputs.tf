output "El_ID_VPC" { value = aws_vpc.mi_red.id }
output "Router_VPC" { value = aws_vpc.mi_red.main_route_table_id }
output "Rango_de_IPs_VPC" { value = aws_vpc.mi_red.cidr_block }
output "Bloque_CIDR_subred" { value = module.subredes_privadas.Rango_de_IPs_Subred }
output "Los_IDs_subredes" { value = module.subredes_privadas.IDs_subredes[0] }
