# Python

This is a work in progress.
Trying to build a nanoserver image with Python 3.6 installed.

## Some obstacles

### get-pip.py

The script `get-pip.py` does not work out of the box, it errored with

```
  File "ntpath.py", line 75, in join
  TypeError: expected str, bytes or os.PathLike object, not NoneType
```

I found out that this should be called to initialize `site.USER_SITE`

```python
import site
site.getusersitepackages()
```

After that patch pip can be installed.

### pip

Running pip I encounter the next problem

```
PS C:\> pip --version
Could not import runpy module
ModuleNotFoundError: No module named 'runpy'
```

Investigated the Docker host with procmon.exe. Python also looks in the
Windows Registry. Maybe some more initialization is needed to make Python/Pip
happy.
