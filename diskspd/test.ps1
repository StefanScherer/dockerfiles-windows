Write-Host Testing diskspd
docker run --rm diskspd -c8192K -d1 testfile.dat
Write-Host Testing diskspd:nano
docker run --rm diskspd:nano -c8192K -d1 testfile.dat
