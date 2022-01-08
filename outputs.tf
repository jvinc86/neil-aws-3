output "El_ID_VPC" { value = aws_vpc.mi_red.id }
output "Router_Nuevo_ID_VPC" { value = aws_vpc.mi_red.main_route_table_id }
output "Los_IDs_subredes" { value = module.subredes_privadas.IDs_subredes }

output "IP_privada_de_EC2_en_subred_privada" { value = module.instancias_ec2_privadas.mis_ip_privadas }

output "IP_privada_de_EC2_en_subred_publica" { value = module.instancias_ec2_publicas.mis_ip_publicas }
output "IP_publica_de_EC2_en_subred_publica" { value = module.instancias_ec2_publicas.mis_ip_privadas }