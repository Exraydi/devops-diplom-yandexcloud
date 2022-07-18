variable "yandex_cloud_id" {
  default = "b1gh69h18og7s3s213ih"
}

variable "yandex_folder_id" {
  default = "b1g78ee9o3vi6at0tr9p"
}

variable "zones" {
  type    = list(string)
}

variable "cidr" {
  type    = list(string)
}
