resource "github_repository" "modules" {
  name        = "terraform-demo"
  description = "My awesome codebase"
  auto_init   = true
  visibility  = "public"
}

# resource "github_branch" "development" {
#   repository = github_repository.modules.name
#   branch     = "modules"
# }

resource "github_branch_default" "default"{
  repository = github_repository.modules.name
  branch     = "modules"
  rename     = true
}


resource "github_repository_file" "file" {
#   count = length(var.files)
  for_each = fileset("${path.module}/../modules/service", "*.tf")

  repository          = github_repository.modules.name
  branch              = github_branch_default.default.branch
#   file                = "service/${element(var.files, count.index)}"
  file                = "service2/${each.value}"
#   content             = file("${path.module}/../modules/service/${element(var.files, count.index)}")
  content             = file("${path.module}/../modules/service/${each.value}")
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}