module "dev-app" {
    source = "./aws-infra-modules"
    my-env = "dev"
    ami_id = "ami-0b09627181c8d5778"  # Amazon linux 2 ami in us-south-1
    instance_type = "t2.micro"
    instance_count = 1 
}

module "stage-app" {
    source = "./aws-infra-modules"
    my-env = "stage"
    ami_id = "ami-0b09627181c8d5778"  # Amazon linux 2 ami in us-south-1
    instance_type = "t2.micro"
    instance_count = 1 
}

module "production-app" {
    source = "./aws-infra-modules"
    my-env = "prod"
    ami_id = "ami-0b09627181c8d5778"  # Amazon linux 2 ami in us-south-1
    instance_type = "t2.micro"
    instance_count = 3 
}