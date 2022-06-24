variable "token" {
  description = "TOKEN YandexCloud"
  default     = "${TOKEN}"
}

variable "cloud_id" {
  description = "ID cloud-babutz"
  default     = "b1gscb7cde12vb6f5abv"
}

variable "folder_id" {
  description = "ID b1g87mpbmqltsid0rp8p"
  default     = "default"
}

variable "zone" {
  description = "zone"
  default     = "ru-central1-a"
}

variable "name_serv" {
  description = "name"
  default     = "terraform-momo"
}

variable "image_id" {
  description = "image dist"
  default     = "fd80qm01ah03dkqb14lc"
}

variable "network_name" {
  default = "net-babentsov"
}

variable "network_zone" {
  default = "ru-central1-a"
}

variable "network_id" {
  default = "enpm6e1qncdi27cijlj0"
}

variable "cidr_blocks" {
  default = ["192.168.108.0/24"]
}
