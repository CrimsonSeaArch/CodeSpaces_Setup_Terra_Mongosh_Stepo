
output "project_id" {
  description = "MongoDB Atlas Project ID"
  value       = mongodbatlas_project.test_project.id
  sensitive = true
}
