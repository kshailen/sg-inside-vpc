resource "aws_security_group" "sg_allow_trafficmanager_ips" {
  name        = "allow_trafficmanager_ips"
  description = "Allow All IP address of Traffic Manager on port 80"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Port 80 from Traffic Manager"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = var.Traffic_Manager_IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Traffic Manager"
  }
}

resource "aws_security_group" "sg_allow_North_America_IPs" {
  name        = "allow_North_America_IPs"
  description = "Allow All IP address of North America on port 80"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Port 80 from North America IPs"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = var.North_America_IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "North America"
  }
}

resource "aws_security_group" "sg_allow_South_America_IPs" {
  name        = "allow_South_America_IPs"
  description = "Allow All IP address of South/central America on port 80"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Port 80 from South/central America IPs"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = var.South_Central_America_IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "South/Central America"
  }
}

resource "aws_security_group" "sg_allow_Europe_IPs" {
  name        = "allow_Europe_IPs"
  description = "Allow All IP address of Europe on port 80"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Port 80 from Europe IPs"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = var.EUROPE_IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EUROPE"
  }
}

resource "aws_security_group" "sg_allow_Asia_Pacefic_IPs" {
  name        = "allow_Asia_Pacefic_IPs"
  description = "Allow All IP address of Asia Pacefic ips on port 80"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Port 80 from Asia Pacefic IPs"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = var.Asia-Pacific_IPs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Asia Pacefic"
  }
}

resource "aws_security_group" "master_security_group" {
  name        = "Master Security Group"
  vpc_id      = var.aws_vpc_id

  ingress {
    description = "Port 80 from other security groups"
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    security_groups = [aws_security_group.sg_allow_Asia_Pacefic_IPs , aws_security_group.sg_allow_Europe_IPs , aws_security_group.sg_allow_North_America_IPs, aws_security_group.sg_allow_South_America_IPs, aws_security_group.sg_allow_trafficmanager_ips]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Master SG"
  }
}

