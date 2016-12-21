# Optimizing the size of the MongoDB Windows Container
[![](https://images.microbadger.com/badges/version/stefanscherer/mongo-windows.svg)](https://microbadger.com/images/stefanscherer/mongo-windows "Get your own version badge on microbadger.com")

## With MSI

The [3.2/msi/Dockerfile](3.2/msi/Dockerfile) downloads the MSI file of MongoDB and installs it with msiexec.
The reason for this is that the MSI file also contains `*.pdb` files, but also
the MSI file itself will be cached and Windows also writes internal binary files.

This results in a big Docker image of about **805 MByte**.

## With ZIP

The next step is to download the ZIP file instead of the MSI and extract it and remove the Zip file in a single `RUN` command. The [3.2/Dockerfile.build](3.2/Dockerfile.build) does this.
The additional optimization is to remove the `*.pdb` debug files from the container as well.

The size of this Container is **249 MByte**.

## With COPY

Using two steps to build the final Docker image can reduce the size.
Copying the extracted files from the ZIP container with a mounted volume and then
using the [3.2/Dockerfile](3.2/Dockerfile) copying the directory back into a new Docker image results in an even smaller image.

The size of this Container is **171 MByte**.
