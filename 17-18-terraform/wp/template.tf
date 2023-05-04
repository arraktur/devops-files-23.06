resource "local_file" "ansible_inventory" {
    content = templatefile("ansible_inventory.tpl",
      { vm_ip_address = "192.168.0.100",
        private_ssh_key = "/home/vagrant/.ssh/id_rsa"
      })

    filename = "./inventory"
}

# resource "null_resource" "run_ansible" {
#   provisioner "local-exec" {
#     command = "ansible-playbook -i inventory playbook.yml"
#   }
# }

resource "null_resource" "docker_build" {
  provisioner "local-exec" {
    command = <<-EOT
      echo ${var.dockepass} |docker login -u feniks --password-stdin
      docker build -t feniks/terraform_demo -f Dockerfile.multi .
      docker push feniks/terraform_demo
    EOT
  }
  triggers = {
    docker_file = md5(file("Dockerfile.multi"))
    # run_always = timestamp()
  }
}