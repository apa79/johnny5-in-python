variable "project" {
  default = "johnny5-2024"
}

variable "local_lambda_folder" {
  default = "${path.module}/.."
}

variable "c" {
  default = "${path.module}/../local_deploy/"
}