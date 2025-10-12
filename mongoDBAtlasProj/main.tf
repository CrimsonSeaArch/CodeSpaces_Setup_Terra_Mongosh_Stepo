
resource "mongodbatlas_project" "test_project" {
  name   = var.project_name
  org_id = var.org_id
  


}

resource "mongodbatlas_cluster" "cluster-test" {
  project_id   = mongodbatlas_project.test_project.id
  name         = var.cluster_name
  
  # Provider Settings "block"

  provider_name               = "TENANT"
  backing_provider_name       = "AWS"
  provider_region_name        = "EU_CENTRAL_1"
  provider_instance_size_name = "M0"
}

resource "mongodbatlas_database_user" "test" {
  username           = var.database_username
  password           = var.database_password
  project_id         = mongodbatlas_project.test_project.id
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }
}

resource "mongodbatlas_project_ip_access_list" "Stephan_mongoDBAccess" {
  project_id = mongodbatlas_project.test_project.id
  cidr_block = "0.0.0.0/0"
  comment    = "cidr block for tf acc testing"
}


# 05 Datenbank erstellen und mit Example Daten füllen
resource "null_resource" "initialize_database" {
  depends_on = [
    mongodbatlas_cluster.cluster-test,
    mongodbatlas_database_user.test,
    mongodbatlas_project_ip_access_list.Stephan_mongoDBAccess
  ]

  provisioner "local-exec" {
    command     = "bash ${path.module}/init_db.sh"
    environment = {
      MONGO_URI = replace(mongodbatlas_cluster.cluster-test.connection_strings[0].standard_srv, "mongodb+srv://", "mongodb+srv://${var.database_username}:${var.database_password}@")
    }
  }

  triggers = {
    cluster_id = mongodbatlas_cluster.cluster-test.cluster_id
  }
}