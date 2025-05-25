module "vpc" {
  source               = "./module/vpc"
  vpc_name             = "my-vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet1_cidr  = "10.0.1.0/24"
  public_subnet1_az    = "eu-north-1a"
  public_subnet2_cidr  = "10.0.2.0/24"
  public_subnet2_az    = "eu-north-1b"
  private_subnet1_cidr = "10.0.3.0/24"
  private_subnet1_az   = "eu-north-1a"
  private_subnet2_cidr = "10.0.4.0/24"
  private_subnet2_az   = "eu-north-1b"
  vpc_igw              = "my-igw"
  public_sg            = "pub-sg"
  private_sg           = "pri-sg"
  public-rt            = "public-route-table"
  public-sub1a         = "pub-assocation-1"
  public-sub2a         = "pub-assocation-2"
  eip                  = "my-eip"
  nat                  = "my-Nat"
  private-rt           = "private-route-table"
  private-sub1a        = "pri-assocation-1"
  private-sub2a        = "pri-assocation-2"
}
module "alb" {
  source            = "./module/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg            = [module.vpc.alb_sg]
}

module "database" {
  source             = "./module/database"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  public_sg          = module.vpc.public_sg
}

module "compute" {
  source             = "./module/ec2"
  public_subnet_ids  = module.vpc.public_subnet_ids
  public_sg          = module.vpc.public_sg
  private_sg         = module.vpc.private_sg
  private_subnet_ids = module.vpc.private_subnet_ids

}

