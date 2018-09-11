# Kikstart files to nemo
This repo сontains ks files to create sdk and targets for nemo

To create sdk image:

`#export PORT_ARCH=i486`

`#sudo mic create fs --arch=$PORT_ARCH --tokenmap=ARCH:$PORT_ARCH --record-pkgs=name,url --outdir=nemo-sdk --pack-to=nemo_sdk-$PORT_ARCH.tar.bz2 ~/nemo-sdk.ks`

To create target image:

`#export PORT_ARCH=armv7hl`

`sudo mic create fs --arch=$PORT_ARCH --tokenmap=ARCH:$PORT_ARCH --record-pkgs=name,url --outdir=nemo-target --pack-to=nemo_target-$PORT_ARCH.tar.bz2 ~/nemo-target.ks`

# IMPORTANT!

This ks files use my own repos and some times it's broken :)
