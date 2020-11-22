FROM microsoft/aspnetcore:2.0-stretch AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0-stretch AS build
WORKDIR /src
COPY ["DockerToAWSWithDotNet/DockerToAWSWithDotNet.csproj", "DockerToAWSWithDotNet/"]
RUN dotnet restore "DockerToAWSWithDotNet/DockerToAWSWithDotNet.csproj"
COPY . .
WORKDIR "/src/DockerToAWSWithDotNet"
RUN dotnet build "DockerToAWSWithDotNet.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DockerToAWSWithDotNet.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DockerToAWSWithDotNet.dll"]