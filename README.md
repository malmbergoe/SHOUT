## S.H.O.U.T.
#### (Simple Hardware Output Usecase Test)
This project is an exploratory project to learn how to build images with yocto.
It depends on my own yocto meta layer "meta-malmbergoe".

More documentation will be provided soon...


## Setting up:

### Prepare the sources
1. in the setup_env.sh set the YOCTO_HOME path. this should point to the path where all yocto and open-embedded layers and sources will reside.
2. clone poky into YOCTO_HOME
cd $YOCTO_HOME
git clone git://git.yoctoproject.org/poky.git
3. clone the open-embedded meta layers
cd $YOCTO_HOME
git clone https://github.com/openembedded/meta-openembedded.git
4. clone the meta-raspberrypi layer
cd $YOCTO_HOME
git clone https://github.com/agherzan/meta-raspberrypi.git
5. clone the meta-malmbergoe layer
cd $YOCTO_HOME
git clone git@github.com:malmbergoe/meta-malmbergoe.git

At this point, all the dependent sources should be in place.

### Setup the build directory first time
1. Setup your build directory by navigating to YOCTO_HOME/poky and source
'source oe-init-build-env <PATH_TO_YOUR_BUILD_DIR>'. This creates a directory containing standard template for a build directory.
2. copy the bblayers.conf and local.conf from the SHOUT repository and overwrite the ones in the build directory (under 'conf')

### setup build environment and build
1 initialize the build environment
source oe-init-build-env <PATH_TO_YOUR_BUILD_DIR>
2 source the setup_env.sh
3 run 'bitbake rpi-shout-image.bb' to start the build


NOTE: the branch of poky should be master. otherwise there will be problems finding the meta-python layer exposed in openembedded

### Deploy to target
after building according to previous instructions, there will be a binary image available at
<PATH_TO_YOUR_BUILD_DIR>/tmp/deploy/images/raspberrypi3/rpi-shout-image-raspberrypi3.rpi-sdimg
this file should be written onto an sd card.

1. open a terminal and type 'lsblk' to list currently mounted blcok devices. (typically sda)
2. insert the sdcard to the computer and type 'lsblk' again. this should show exactly one new block devices (typically sdb)
3. flash the image file onto the sd card using dd.
dd if=<shout-image> of=<block_dev> bs=4M

for instance
dd if=rpi-shout-raspberrypi3.<datebuildhash>.rootfs.rpi-sdimg of=/dev/sdb bs=4M

### TODOs
- cleanup README text
- refactor bblayers to use YOCTO_HOME variable
- DisplayHello: implement lowlevel writing
- document install instructions for image
- document setup instructions to execute displayHello
#### Future improvements
- setup a buildserver
- automate complete process of setting up project from scratch
- implement unit tests
- setup build system (gradle?) for displayHello
- script to transfer image to sd-card
- cleanup: remove and strip as much redundancy as possible
- automate initialization of i2c on target. (incorporate in build recipe?)
- migrate relevant parts from hellodisplay into an i2c output library (reuse)
- collect external resources of documentation. i.e. explain to understand...