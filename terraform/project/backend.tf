terraform {
  backend "gcs" {
      bucket      = "task-busket-tf1"
      prefix      = "project/terraform.tfstate"
  }
} 
