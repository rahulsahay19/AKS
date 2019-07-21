Param(
    [parameter(Mandatory = $false)]
    [bool]$ProvisionAKSCluster = $false
)


if ($ProvisionAKSCluster) {
    Write-Host "Provisioning AKS cluster with default parameters" -ForegroundColor Cyan
    & ((Split-Path $MyInvocation.InvocationName) + "\createAKS.ps1")
}


Write-Host "Starting deployment of AKS application and services" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\

Write-Host "Creating namespace"  -ForegroundColor Yellow
kubectl apply --filename AKS_namespace.yml
Write-Host "Namespace created successfully" -ForegroundColor Cyan

Write-Host "Creating storage class" -ForegroundColor Yellow
kubectl apply --filename StorageClass.yml
Write-Host "Storage class created successfully" -ForegroundColor Cyan

Write-Host "Creating Persistant Volume Claim" -ForegroundColor Yellow
kubectl apply --filename PersistantVolumeClaim.yml
Write-Host "Persistant Volume Claim created successfully" -ForegroundColor Cyan

Write-Host "Deploying AKSLearnsDB service" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\AKSLearnDB\
kubectl apply --recursive --filename .

Write-Host "AKSLearnsDB service deployed successfully" -ForegroundColor Cyan

Write-Host "Deploying AKS API service" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\AKSApi\
kubectl apply --recursive --filename .

Write-Host "AKS API service deployed successfully" -ForegroundColor Cyan

Write-Host "Deploying AKS Web" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\AKSWeb\
kubectl apply --recursive --filename .

Write-Host "AKS Web deployed successfully" -ForegroundColor Cyan

Write-Host "All the services related to AKS application have been successfully deployed" -ForegroundColor Cyan

Set-Location D:\rahul\MyExperiments\AKS\