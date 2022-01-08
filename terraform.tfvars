REGION          = "eu-west-3"
BLOQUE_CIDR_VPC = "10.0.0.0/16"
NOMBRE_PROYECTO = "radioactive"

NRO_DE_SUBREDES      = 3
AV_ZONES             = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
CIDR_PRIVADOS_SUBRED = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
CIDR_PUBLICOS_SUBRED = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

CANTIDAD_INSTANCIAS = 3
TIPO_INSTANCIA      = "t2.micro"
INSTANCE_USERNAME   = "vincent"
INSTANCE_PASSWORD   = "Password!1234"
WIN_SERVER_AMI = {
  us-east-1 = "ami-0d80714a054d3360c", # WindowsServer (Northern Virginia)
  us-west-1 = "ami-0fc6888a6bb1dfba6", # WindowsServer (California)
  eu-west-3 = "ami-05fb43e0cf8358e9a"  # WindowsServer (Paris)
}
