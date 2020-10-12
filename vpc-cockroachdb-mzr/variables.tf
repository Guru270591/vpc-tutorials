variable "ibmcloud_api_key" {
  description = "You IAM based API key."
  default     = ""
}

variable "vpc_region" {
  description = "The VPC region to deploy the resources under."
  default     = ""
}

variable "vpc_ssh_key" {
  description = "The names of SSH key used to access virtual server instances after creation."
  default = ""
}

variable "resource_group" {
  description = "The resource group for all the resources created (VPC and non VPC)."
  default     = ""
}

variable "ssh_private_key_format" {
  description = "Values can be file: requires for `ssh_private_key_file` to be set , content: requires for `ssh_private_key_content` to be set or build: will create an SSH key for use during the build."
  default     = "build"
}

variable "ssh_private_key_file" {
  description = "The file system location of private ssh key for virtual server instances access. Only use if the ssh_private_key_format value is set to `file`, tt needs to be a local file."
  default     = "~/.ssh/id_rsa"
}

variable "ssh_private_key_content" {
  description = "The content of the private ssh key for virtual server instances access. Only use if the ssh_private_key_format value is set to `content`."
  default     = ""
}

variable "resources_prefix" {
  description = "Prefix is added to all resources that are created by this template."
  default     = "cockroach"
}

variable "vpc_database_image_profile" {
  description = "The profile for the database instance, increase the size based on environment need."
  default     = "cx2-2x4"
}

variable "vpc_app_image_profile" {
  description = "The profile for the application instance, increase the size based on environment need"
  default     = "cx2-2x4"
}

variable "vpc_admin_image_profile" {
  description = "The profile for admin instance, it does not require a lot of system resources."
  default     = "cx2-2x4"
}

variable "vpc_admin_image_name" {
  description = "The scripts required for this configuration have only been validated on Ubuntu."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-2"
}

variable "vpc_app_image_name" {
  description = "The scripts required for this configuration have only been validated on Ubuntu."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-2"
}

variable "vpc_database_image_name" {
  description = "The scripts required for this configuration have only been validated on Ubuntu."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-2"
}

variable "TF_VERSION" {
  description = "terraform engine version to be used in schematics"
  default = "0.12"
}