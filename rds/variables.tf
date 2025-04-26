variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Port for the database"
  type        = number
  default     = 3306
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "db_subnet_ids" {
  description = "List of private subnet IDs for RDS deployment"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security group ID for RDS"
  type        = string
}
