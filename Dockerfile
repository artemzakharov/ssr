FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o out

FROM microsoft/aspnetcore:2.0
RUN apt-get update
RUN apt install -y curl software-properties-common gnupg
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt install -y nodejs
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "ssr.dll"]