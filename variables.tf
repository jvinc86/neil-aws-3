variable "REGION"          { default = "eu-west-3" }   #OJO si se modifica la region deben adaptarse abajo los AV_ZONES
variable "BLOQUE_CIDR_VPC" { default = "192.168.0.0/16" }   #OJO si se modifica la VPC deben adaptarse abajo los CIDR_SUBRED
variable "NOMBRE_PROYECTO" { default = "mi_maravilloso_proyecto" }

variable "NRO_DE_SUBREDES"      { default = 3 }   #OJO si se modifica este numero, tambien debe modificarse/adaptarse las variables de abajo 
variable "AV_ZONES"             { default = ["eu-west-3a", "eu-west-3b", "eu-west-3c"] }
variable "CIDR_PRIVADOS_SUBRED" { default = ["192.168.80.0/24", "192.168.81.0/24", "192.168.82.0/24"] }
variable "CIDR_PUBLICOS_SUBRED" { default = ["192.168.120.0/24", "192.168.121.0/24", "192.168.122.0/24"] }


