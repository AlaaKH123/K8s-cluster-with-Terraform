# Architecture du cluster : 
![Image 1](Architecture_de_Projet.png)

# K8s-cluster-with-Terraform
creation d un cluster Kubernetes local atomatiseé avec Terraform
dans ce projet on utilise le Terraform pour deployer localement sur notre machine local 

<h1>Requirements</h1>
<h2> Minikube Docker Terraform </h2>


$minikube start 

//pour ajouter des worker nodes pour le cluster : 
//$minikube node add 

$minikube status

![1](https://user-images.githubusercontent.com/124509691/235356577-0a9f297e-b85f-46a1-9ae1-cbaa0704e1b4.PNG)


on peut distinguer ca en docker desktop : 3 conteneur sont en cours : 1 master node et 2 workers 

![2](https://user-images.githubusercontent.com/124509691/235356664-4bf90eef-51ef-431d-8b30-a061e569ce4d.PNG)


pour deployer ces fichier sur le cluster il faut se placer sur le repo ou on les fichier :

#les etapes apres la creation du cluster  : 

<h3>Attention !</h3> :

il faut modifier le fichier provider.tf l adresse ip de cluster :

![3](https://user-images.githubusercontent.com/124509691/235356846-47dbcf51-560f-4234-8749-b41ac6f7df83.PNG)


pour reccuper l adresse on fait ca : 

![4](https://user-images.githubusercontent.com/124509691/235356830-257fb947-2f52-4ff1-943c-2dc43462306e.PNG)




$terraform init 
$terraform plan 
$terraform aplly : yes 


$kubectl get deployments

![6](https://user-images.githubusercontent.com/124509691/235357023-3e38cef4-ac5b-4ab8-9dfe-99aa57faddbc.PNG)



$kubectl get svc 

![8](https://user-images.githubusercontent.com/124509691/235357040-e30562b5-b1af-4792-b042-f0f78a38845d.PNG)


$kubectl get pods

![7](https://user-images.githubusercontent.com/124509691/235357055-0664b5fb-81aa-4913-970b-4dd5546f84ef.PNG)


$minikube service webapp-sql

![9](https://user-images.githubusercontent.com/124509691/235357080-237a4ef3-4c74-4b8f-9f9e-94ca0a9ca4e0.PNG)


cette page s affiche sur le Browser et si ecrit hi dans le chat il nous repond  en se conectant au pod de la base de donnes mySQL

![10](https://user-images.githubusercontent.com/124509691/235357153-fd9088a1-781e-4967-83e1-514ef6c4fbb9.PNG)


![11](https://user-images.githubusercontent.com/124509691/235357162-08174b91-d213-4fbd-8aa4-b181500a7f9f.PNG)





