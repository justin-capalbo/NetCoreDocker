# NetCoreDocker

Simple WebAPI app that can eventually be expanded to include EF/database and pages.  Primary function is to test Dockerfile functionality.

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


3. Make a request to the API in your local browser

```
http://localhost:5001/api/values
```
Can be any local:container port you desire.
