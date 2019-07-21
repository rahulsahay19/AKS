Param(
    [parameter(Mandatory=$false)]
    [string]$resourceGroupName="KubernetesRG",
    [parameter(Mandatory=$false)]
    [string]$clusterName="aksLearningCluster"
)

# Browse AKS dashboard
Write-Host "Browse AKS Learning cluster $clusterName" -ForegroundColor Yellow
az aks browse `
--resource-group=$resourceGroupName `
--name=$clusterName