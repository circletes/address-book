terraform {
  backend "gcs" {
      bucket      = "task-busket222-tf1"
      prefix      = "project/terraform.tfstate"
  }
} 
