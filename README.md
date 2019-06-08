```
docker build --build-arg PETALINUX_INSTALLER=petalinux-v2017.4-final-installer.run -t petalinux .

docker run -i -t --name petalinux -v <your directory>:/home/vivado petalinux

aria2c -m 10 -s 10 -x 10 -o petalinux-v2017.4-final-installer.run https://xilinx-ax-dl.entitlenow.com/dl/ul/2017/12/18/R209898206/petalinux-v2017.4-final-installer.run/1a8f2e5c8d9f044d945cff13d54c1198/5CFB51AF?akdm=0&filename=petalinux-v2017.4-final-installer.run

```