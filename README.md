# Vault-AKS-deploy and auto-unseal from Azure KMS

## Set Up Auto-Unseal Key In Azure
The first step is to set up our key in Azure Key Vault.

Create an Azure Key Vault Instance. Note the Subscription (Tenant) ID and directory ID. 

Next register an application - choose single tenant and leave the rest as defaults. Note the Application (client) ID. 

Then, create a client secret. 
In the Azure Service Principal go to 'Certifications and Secrets' and create a new client secret. Save this client secret. We wont be able to view it again. 

Go back to the Azure Key Vault and add a the service principal 'New Role Assignment' as a 'Key Vault Contributor'. 

## Deploy AKS with Terraform
```
terraform init
terraform apply
```

## Connnect Kubectl to deployed AKS
```
az aks get-credentials --resource-group $(terraform output resource_group_name) --name $(terraform output kubernetes_cluster_name)
```

##
Deploy Vault with Helm 
```
helm install vault hashicorp/vault -f values.yaml
```



