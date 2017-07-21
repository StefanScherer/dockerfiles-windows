# spaces

How to use spaces in Dockerfiles

```Dockerfile
FROM microsoft/windowsservercore
COPY [ "Sub Dir", "C:/Program Files (x86)/Sub Dir" ]
```

* Use JSON format of COPY instruction
* Quote the paths containing spaces.
* It is better to use unix forward slashes
