resource "kubernetes_deployment" "DataBase_deployment" {
  metadata {
    name = "sqldb"
    labels = {
        app="webapp-sql"
        tier="backend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "webapp-sql"
        tier="backend"
      }
    }
    strategy {
      type ="Recreate"
    }

    #_______________________________La definition de Pod : du Data Base ______________________________ 
     template{
        metadata{
            name ="pod2"
            labels = {
            app ="webapp-sql"
            tier= "backend"
            }
        }
        

      spec {
        container {
          name  = "mysql"
          image = "mysql"
          
            env {
            name = "MYSQL_ROOT_PASSWORD"
            value = "password"
            }
            env{

            name="MYSQL_DATABASE"
            value="chat"
           }
 
            env{

            name="MYSQL_USER"
            value="db_user"
           }
            
            env{

            name="MYSQL_PASSWORD"
            value="password"
           }    
            args=["--default-authentication-plugin=mysql_native_password"]   

            port{
                container_port = 3306
                }
            volume_mount{
                name="mysql-pv-claim"
                mount_path="/var/lib/mysql"
                }    

        }
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

        volume {
            name ="mysql-pv-claim"
            persistent_volume_claim{
                claim_name="mysql-pv-claim"
            }
        }
          

          
           }


      }

    }



  }
