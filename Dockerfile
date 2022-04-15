# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app

LABEL maintainer="jf13g13@gmail.com"
EXPOSE 80
EXPOSE 443

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .

# Add user without 
RUN useradd -Ms /bin/bash runApplication
USER runApplication

ENTRYPOINT ["dotnet", "Amici.dll"]