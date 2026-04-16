variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "swiftcart-cluster"
}

variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 2
}

variable "max_capacity" {
  default = 3
}

variable "min_capacity" {
  default = 1
}

variable "github_repo" {
  description = "GitHub repo in format username/repo"
}
