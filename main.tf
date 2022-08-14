module "network" {
  source            = "./modules/network"
  cidr_block        = "10.0.0.0/16"
  public-subnet     = ["10.0.1.0/24", "10.0.2.0/24"]
  private-subnet    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zone = ["ap-southeast-1a", "ap-southeast-1b"]
}

module "database" {
  source         = "./modules/database"
  storage        = 10
  engine         = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.small"
  db_name        = "wordpress"
  username       = "admin"
  password       = "12345678"
  depends_on     = [module.network]
}

module "compute" {
  source        = "./modules/compute"
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  depends_on    = [module.network, module.database]
}



output "ec2-dns" {
  value=module.compute.ec2-dns-name
}

output "dns_name" {
  value = module.compute.lb-dns
}

output "db-endpoint" {
  value = module.database.db-endpoint
}
