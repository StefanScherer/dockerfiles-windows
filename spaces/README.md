# spaces

How to use spaces in Dockerfiles

```Dockerfile
FROM microsoft/windowsservercore:10.0.14393.1770
COPY [ "Sub Dir", "C:/Program Files (x86)/Sub Dir" ]
```

* Use JSON format of COPY instruction
* Quote the paths containing spaces.
* It is better to use unix forward slashes
