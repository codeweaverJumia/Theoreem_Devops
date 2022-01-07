variable "name" {
  default = "theoremtest2022"
}

variable "memory_size" {
  default = "128"
}

variable "timeout" {
  default = "50"
}

variable "env_vars" {
  default = {
    test="test_env"
  }
}

variable "ci_containers_storage_name" {
  default = "tf-ci"
}
variable "ci_container_name" {
  default = "theorem"
}
variable "repo_owner" {
  default = "codeweaverJumia"
}
variable "repo_name" {
  default = "Theoreem_Devops"
}
variable "branch" {
  default = "main"
}
variable "main_domain" {
  default = "getjara.co"
}
variable "zone_id" {
  default = "Z00746283TLJ71769E05L"
}
variable "certificate_arn" {
  default = "arn:aws:acm:us-east-1:908815334059:certificate/01c54d4a-068e-4060-ad26-361bee6acec0"
}
variable "with_api_gateway" {
  default = true
}
#Remove this if you want to put it behind a VPC
# variable "subnet_ids" {
#   type    = list
#   default = ["subnet-2128bf47", "subnet-ad13c99c", "subnet-b5135bbb", "subnet-ef3214a2"]
# }

# variable "security_group_ids" {
#   type    = list
#   default = ["sg-39c58c32"]
# }

variable "github_Token" {
  default=""
}