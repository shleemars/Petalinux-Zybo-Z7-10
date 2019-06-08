```
docker build --build-arg PETALINUX_INSTALLER=petalinux-v2017.4-final-installer.run -t petalinux .

docker run -i -t --name petalinux -v <your directory>:/home/vivado petalinux
```