# Configuración de AWS y región
provider "aws" {
 region = "us-east-1"
}

# AMI de Ubuntu 20.04 LTS de Canonical
data "aws_ami" "ubuntu" {
 most_recent = true

 filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
 }

 filter {
    name   = "virtualization-type"
    values = ["hvm"]
 }

 owners = ["099720109477"] # ID 
}


# Grupo de seguridad para la instancia EC2
resource "aws_security_group" "instance_security_group" {
 name        = "instance_security_group"
 description = "Security group for EC2 instance"

# Habilitando el tráfico SSH  de puertos 22, 443, 3000 desde cualquier dirección IP y tráfico saliente.
 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

 ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

 ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }
}
# Definiendo la instancia EC2.
resource "aws_instance" "COMPRAS_dev_instance" {
 ami           = data.aws_ami.ubuntu.id
 instance_type = "t2.micro"
 # Asociando la instancia con el grupo de seguridad creado.
 vpc_security_group_ids = [aws_security_group.instance_security_group.id]
# Asignando un tag a la instancia
 tags = {
    Name = "COMPRAS_dev_instance"
 }
# Agregando el par de claves VOCKEY
 key_name = "vockey"

}

# Mostrando la IP publica de la instancia EC2 despues de su despliegue.
output "public_ip_dev" {
 value = aws_instance.COMPRAS_dev_instance.public_ip
}