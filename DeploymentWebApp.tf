resource "kubernetes_deployment" "Frontend_deployment" {
  metadata {
    name = "webapp1"
    labels = {
        app="webapp-sql"
        tier="frontend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "webapp-sql"
        tier="frontend"
      }
    }

    #_______________________________La definition de Pod : du frontend ______________________________ 
     template{
        metadata{
            name ="pod1"
            labels = {
            app ="webapp-sql"
            tier= "frontend"
        }
      }

      spec {
        container {
          name  = "webapp1"
          image = "alakh1111/chat-bot"
          image_pull_policy = "Always"
          port{
            container_port = 8081
            
          }
          
           }

                #Specification des nodes qui vont faire ce travaille 

        affinity {
          node_affinity {
            required_during_scheduling_ignored_during_execution {
              node_selector_term {
                match_expressions {
                  key = "kubernetes.io/hostname"
                  operator = "In"
                  values = ["minikube-m02", "minikube-m03"]
                }
              }
            }
          }
        }
      }

    }



  }
}