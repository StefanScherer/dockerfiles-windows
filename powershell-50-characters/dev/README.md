# dev

Some "printf" debugging to understand the loop a little better.

Compiling the PSReadLine module was easy:

1. Just fork the GH repo
2. Activate AppVeyor build
3. Change some code and `git push`
4. Build a Docker image with the artifact stored in AppVeyor

```
docker build -t psdebug .
docker run -it psdebug
```

Then paste a long string.
