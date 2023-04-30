resource "kubernetes_service" "Service_A"{

metadata{
  name="webapp-sql"
}
spec{
  selector={
    app="webapp-sql"
    tier="frontend"
  }
  port{
    protocol= "TCP"
    port=80
    target_port= 80
  }
  type="NodePort"
}
}
