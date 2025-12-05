variable "project_name" {
  type        = string
  default     = "eks-tfc-poc"
  description = "Project / EKS cluster base name"
}

variable "aws_region" {
  type        = string
  default     = "ap-southeast-1" # or your preferred region
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}
