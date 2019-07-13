FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env


WORKDIR /AKSWeb
COPY NuGet.config ./
COPY AKSWeb.csproj ./


RUN dotnet restore

COPY . ./

RUN dotnet publish --configuration Release --output releaseOutput --no-restore

#build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet

WORKDIR /AKSWeb

COPY --from=build-env /AKSWeb/releaseOutput ./

ENTRYPOINT ["dotnet", "AKSWeb.dll"]