resource "yandex_kubernetes_cluster" "momo" {
 network_id = yandex_vpc_network.net.id
 master {
   zonal {
     zone      = yandex_vpc_subnet.subnet.zone
     subnet_id = yandex_vpc_subnet.subnet.id
   }
 }
 service_account_id      = yandex_iam_service_account.babutz.id
 node_service_account_id = yandex_iam_service_account.babutz.id
   depends_on = [
     yandex_resourcemanager_folder_iam_binding.editor,
     yandex_resourcemanager_folder_iam_binding.images-puller
   ]
}

resource "yandex_vpc_network" "net" { name = "net" }

resource "yandex_vpc_subnet" "subnet" {
 v4_cidr_blocks = ["10.45.0.0/18"]
 zone           = "ru-central1-a"
 network_id     = yandex_vpc_network.net.id
}

resource "yandex_iam_service_account" "babutz" {
 name        = "babutz"
}

resource "yandex_resourcemanager_folder_iam_binding" "editor" {
 folder_id = "b1g87mpbmqltsid0rp8p"
 role      = "editor"
 members   = [
   "serviceAccount:${yandex_iam_service_account.babutz.id}"
 ]
}

resource "yandex_resourcemanager_folder_iam_binding" "images-puller" {
 folder_id = "b1g87mpbmqltsid0rp8p"
 role      = "container-registry.images.puller"
 members   = [
   "serviceAccount:${yandex_iam_service_account.babutz.id}"
 ]
}