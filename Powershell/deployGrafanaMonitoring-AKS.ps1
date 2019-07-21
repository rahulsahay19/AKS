Param(
    [parameter(Mandatory=$false)]
    [bool]$ProvisionAKSCluster=$false
)


if($ProvisionAKSCluster)
{
    Write-Host "Provisioning AKS cluster with default parameters" -ForegroundColor Cyan
    & ((Split-Path $MyInvocation.InvocationName) + "\createAKS.ps1") 
}

Write-Host "Starting deployment of AKS application and services" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\Prometheus\

Write-Host "Deploying Prometheus"  -ForegroundColor Yellow
kubectl apply --recursive --filename . 

Write-Host "Prometheus related services deployed successfully" -ForegroundColor Cyan

Write-Host "Deploying Grafana" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\Grafana\
kubectl apply --recursive --filename . 

Write-Host "Grafana services deployed successfully" -ForegroundColor Cyan

Write-Host "Monitoring related deployed successfully" -ForegroundColor Cyan

Write-Host "All the services related to Tech Talks application monitoring have been successfully deployed" -ForegroundColor Cyan

Set-Location D:\rahul\MyExperiments\AKS\