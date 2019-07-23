# This will remove all the images starting with the name eshop
Write-Host "Removing all eshop related images" -ForegroundColor Red
docker images -a | grep "eshop" | awk '{print $3}' | xargs docker rmi -f