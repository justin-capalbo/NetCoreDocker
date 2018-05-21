# NetCoreDocker

Simple WebAPI app that can eventually be expanded to include EF/database and pages.  Primary function is to test Dockerfile functionality.

### Dependencies

1. [Docker](https://www.docker.com/get-docker).  Image creation was originally tested on Windows, with Linux containers.
2. [.NET Core 2.0 or higher](https://www.microsoft.com/net/download).  Only needed if building or developing locally.

### Usage

Tested with Linux containers.

1. Build the image:   

```console
docker build -t netcorewebapi .
```

2. Run the image in a container: 

```console
docker run -it --rm -p 5001:80 --name netcorewebapi_sample netcorewebapi
```
Use any image name you want in place of **netcorewebapi**.
Use any container name you desire in place of **netcorewebapi_sample**.


3. Make a request, e.g. <http://localhost:5001/api/values> to the API in your browser.

The URL will differ if you used a different host port other than 5001.

