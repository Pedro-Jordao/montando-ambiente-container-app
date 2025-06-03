az extension add --name containerapp --upgrade

az provider register --namespace Microsoft.App

az provider register --namespace Microsoft.OperationalInsights
myRG=phjorcontainerapp
myLocation=eastus
myContainerEnv=phjor-env-001


az group create --name $myRG --location $myLocation

az containerapp env create --name $myContainerEnv --resource-group $myRG --location $myLocation 

az containerapp create \
--name my-container-app \
--resource-group phjorcontainerapp \
--environment phjor-env-001 \
--image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest \
--target-port 80 \
--ingress 'external' \
--query properties.configuration.ingress.fqdn