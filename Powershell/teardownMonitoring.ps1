Param(
    [parameter(Mandatory=$false)]
    [bool]$ProvisionAKSCluster=$false
)


if($ProvisionAKSCluster)
{
    Write-Host "Provisioning AKS cluster with default parameters" -ForegroundColor Cyan
    & ((Split-Path $MyInvocation.InvocationName) + "\createAKS.ps1") 
}

Write-Host "Starting deletion of AKS monitoring services" -ForegroundColor Yellow

Write-Host "Deleting Grafana" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\Grafana\
kubectl delete --recursive --filename . 

Write-Host "Grafana services deleted successfully" -ForegroundColor Cyan

Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\Prometheus\

Write-Host "Deleting Prometheus"  -ForegroundColor Yellow
kubectl delete --recursive --filename . 

Write-Host "Prometheus related services deleted successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application monitoring have been successfully deleted" -ForegroundColor Cyan

Set-Location D:\rahul\MyExperiments\AKS\