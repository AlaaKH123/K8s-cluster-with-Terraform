resource "kubernetes_service" "Service_B"{

metadata{
  name="mysql"
}
spec{
  selector={
    app="webapp-sql"
    tier="backend"
  }
  port{
    protocol= "TCP"
    port=3306
    target_port= 3306
  }
  cluster_ip = "10.111.93.175"
  
}
}
