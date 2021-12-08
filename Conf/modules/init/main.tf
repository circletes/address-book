resource "null_resource" "docker" {
  provisioner "local-exec" {
    command = " sudo docker build -t eu.gcr.io/${var.project_id}/${var.image_name}/${terraform.workspace}:${var.tag} /home/pdem/address-book |gcloud auth print-access-token | sudo docker login -u oauth2accesstoken --password-stdin eu.gcr.io | sudo docker push eu.gcr.io/${var.project_id}/${var.image_name}/${terraform.workspace}:${var.tag}"
  }
}
