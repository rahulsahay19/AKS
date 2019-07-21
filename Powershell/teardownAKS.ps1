
Write-Host "Starting deleting AKS application and services" -ForegroundColor Yellow

Write-Host "Deleting AKS Web" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\AKSWeb\
kubectl delete --recursive --filename .
Write-Host "AKS Web deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting AKS API service" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\AKSApi\
kubectl delete --recursive --filename .
Write-Host "AKS API service deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting AKSLearnsDB service" -ForegroundColor Yellow
Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\AKSLearnDB\
kubectl delete --recursive --filename .
Write-Host "AKSLearnsDB service deleted successfully" -ForegroundColor Cyan

Set-Location D:\rahul\MyExperiments\AKS\k8s\AKS\
Write-Host "Deleting Persistant Volume Claim" -ForegroundColor Yellow
kubectl delete --filename PersistantVolumeClaim.yml
Write-Host "Persistant Volume Claim deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting storage class" -ForegroundColor Yellow
kubectl delete --filename StorageClass.yml
Write-Host "Storage class deleted successfully" -ForegroundColor Cyan

Write-Host "Deleting namespace"  -ForegroundColor Yellow
kubectl delete --filename AKS_namespace.yml
Write-Host "Namespace deleted successfully" -ForegroundColor Cyan

Write-Host "All the services related to AKS application have been successfully deleted" -ForegroundColor Cyan

Set-Location D:\rahul\MyExperiments\AKS\