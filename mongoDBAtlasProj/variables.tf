
variable "mongodbatlas_public_key" {
  description = "MongoDB Atlas Public API Key"
  type        = string
  sensitive   = true
}

variable "mongodbatlas_private_key" {
  description = "MongoDB Atlas Private API Key"
  type        = string
  sensitive   = true
}


variable "project_name" {
  description = "project_name"
  type        = string
  sensitive   = false
}

variable "org_id" {
  description = "Id of organisation"
  type        = string
  sensitive   = false
}

variable "cluster_name" {
  description = "name of clust"
  type        = string
  sensitive   = false
}


variable "database_username" {
  description = "name for access"
  type        = string
  sensitive   = false
}

variable "database_password" {
  description = "password"
  type        = string
  sensitive   = false
}

