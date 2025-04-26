variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "target_port" {
  description = "Port on which targets receive traffic"
  type        = number
  default     = 80
}
