FROM microsoft/dotnet-framework:4.7.2-sdk AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY aspnetmvc472dockerdemo/*.csproj ./aspnetmvc472dockerdemo/
COPY aspnetmvc472dockerdemo/*.config ./aspnetmvc472dockerdemo/
#RUN nuget restore

# copy everything else and build app
COPY aspnetmvc472dockerdemo/. ./aspnetmvc472dockerdemo/
WORKDIR /app/aspnetmvc472dockerdemo
#RUN msbuild /p:Configuration=Release


FROM microsoft/aspnet:4.7.2 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/aspnetmvc472dockerdemo/. ./