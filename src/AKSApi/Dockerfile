FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env


WORKDIR /AKSApi
COPY NuGet.config ./
COPY AKSApi.csproj ./


RUN dotnet restore

COPY . ./

RUN dotnet publish --configuration Release --output releaseOutput --no-restore

#build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet

WORKDIR /AKSApi

COPY --from=build-env /AKSApi/releaseOutput ./

ENTRYPOINT ["dotnet", "AKSApi.dll"]