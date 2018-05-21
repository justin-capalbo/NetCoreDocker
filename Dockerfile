#############
# Examples of how to setup
#############
# 1. Build the image:   docker build -t <image> .
# 2. Run the container: docker run -it --rm -p 5001:80 --name netcorewebapi_sample <image>

FROM microsoft/dotnet:2.0-sdk AS build

# Workdir within container
WORKDIR /app

# Copy any .sln or .csproj and restore
# After we have a .sln we shouldn't need to reference csproj this way
COPY netcorewebapi/*.csproj ./netcorewebapi/
RUN dotnet restore ./netcorewebapi/*.csproj 

# Copy anything else, and build.
COPY . .
WORKDIR /app/netcorewebapi/
RUN dotnet build

# TODO - Point at test runner

# TODO - Run dotnet test

# Next stage in the pipeline gets a new image
FROM build AS publish
WORKDIR /app/netcorewebapi
RUN dotnet publish -c Release -o out

# Create runtime using publish
# Runtime uses aspnetcore image instead of dotnet.
# Another fix to this is in the csproj.  https://github.com/dotnet/dotnet-docker/issues/279
FROM microsoft/aspnetcore:2.0.0 AS runtime
WORKDIR /app
COPY --from=publish /app/netcorewebapi/out ./
ENTRYPOINT ["dotnet", "netcorewebapi.dll"]

