resource "kubernetes_persistent_volume" "mysql_pv_volume" {
  metadata {
    name = "mysql-pv-volume"
    labels = {
      type = "local"
    }
  }

  spec {
    capacity = {
      storage = "20Gi"
    }

    persistent_volume_source {
      host_path {
        path = "/mnt/data"
      }
    }

    access_modes = ["ReadWriteOnce"]
    storage_class_name = "manual"
  }
}

resource "kubernetes_persistent_volume_claim" "mysql_pv_claim" {
  metadata {
    name = "mysql-pv-claim"
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }

    storage_class_name = "manual"
  }
}
