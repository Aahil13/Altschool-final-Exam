provider "kubernetes" {

  host = data.aws_eks_cluster.todo-cluster.endpoint
  token = data.aws_eks_cluster_auth.todo-cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.todo-cluster.certificate_authority.0.data)
}

data "aws_eks_cluster" "todo-cluster"{
    name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "todo-cluster" {
    name = module.eks.cluster_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.21.0"

  cluster_name = "todo-eks-cluster"
  cluster_version = "1.22"

  subnet_ids = module.todo-vpc.private_subnets
  vpc_id = module.todo-vpc.vpc_id

  tags = {
    environment = "development"
    application = "todo-app"
  }

  eks_managed_node_groups = {
    dev ={
        min_size = 1
        max_size = 3
        desired_size = 3

        instance_types =["t2.small"]
    }
  }
}