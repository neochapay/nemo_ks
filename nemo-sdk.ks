# DisplayName: GlacierUX/@ARCH@ (release) 1
# KickstartType: release
# SuggestedImageType: fs
# SuggestedArchitecture: @ARCH@

lang en_US.UTF-8
keyboard us
user --name nemo --groups audio,video --password nemo
timezone --utc UTC

### Commands from /tmp/sandbox/usr/share/ssu/kickstart/part/default
part / --size 500 --ondisk sda --fstype=ext4

## No suitable configuration found in /tmp/sandbox/usr/share/ssu/kickstart/bootloader

repo --name=mer-core --baseurl=http://repo.merproject.org/obs/home:/neochapay:/mer:/core/latest_@ARCH@
repo --name=mer-mw --baseurl=http://repo.merproject.org/obs/home:/neochapay:/mer:/mw/latest_@ARCH@
repo --name=mer-qt56 --baseurl=http://repo.merproject.org/obs/home:/neochapay:/mer:/qt56/latest_@ARCH@
repo --name=mer-crosstuls --baseurl=http://repo.merproject.org/obs/home:/neochapay:/mer:/crossutils/latest_@ARCH@
repo --name=mer-tools --baseurl=http://repo.merproject.org/obs/home:/neochapay:/mer:/tools/latest_@ARCH@

%packages
alsa-lib
attr
augeas-libs
autoconf
automake
basesystem
bash
binutils
bluez
bluez-configs-mer
bluez-libs
boardname
boost-system
boost-thread
bsdtar
btrfs-progs
build
build-mkbaselibs
busybox
busybox-symlinks-gzip
bzip2
bzip2-libs
ca-certificates
cairo
connman
connman-configs-mer
coreutils
cpio
cpp
crda
cross-aarch64-binutils
cross-aarch64-gcc
cross-armv7hl-binutils
cross-armv7hl-gcc
cross-mipsel-binutils
cross-mipsel-gcc
curl
db4
db4-utils
dbus
dbus-glib
dbus-libs
dconf
deltarpm
desktop-file-utils
device-mapper
device-mapper-event
device-mapper-event-libs
device-mapper-libs
diffutils
dosfstools
e2fsprogs
e2fsprogs-libs
eat-host
elfutils
elfutils-libelf
elfutils-libs
expat
fakeroot
file
file-libs
filesystem
findutils
fontconfig
fontpackages-filesystem
freetype
gawk
gcc
gcc-c++
gdb
gdbm
#genisoimage
git
glib2
glibc-common
glibc-devel
glibc-headers
glibc-utils
gmp
gnupg2
gnutls
gpgme
grep
groff
gstreamer1.0
harfbuzz
hwdata
icu52
info
iproute
iptables
iw
kbd
kernel-headers
kmod
kmod-libs
kpartx
lcms
lcms-libs
less
libacl
libarchive
libattr
libblkid
libcap
libcom_err
libcurl
libdbusaccess
libdbuslogserver-dbus
libdrm
libfdisk
libffi
libgcc
libgcrypt
libglibutil
libgofono
libgofonoext
libgomp
libgpg-error
libgrilio
libgsupplicant
libicu52
libidn
libiphb
libjpeg-turbo
libksba
liblua
libmce-glib
libmng
libmount
libnl
libogg
libpng
libpng15-compat
libsb2
libsmartcols
libsolv-tools
libsolv0
libss
libstdc++
libstdc++-devel
libtasn1
libtheora
libtiff
libusb
libusb1
libuser
libutempter
libuuid
libvorbis
libwspcodec
libxml2
libxslt
libyaml
libzypp
lsb-release
lsof
lvm2
lvm2-libs
lzo
m4
make
mer-kickstarter
mer-release
mesa-llvmpipe
mesa-llvmpipe-libEGL
mesa-llvmpipe-libGLESv2
mesa-llvmpipe-libglapi
mic
mobile-broadband-provider-info
mpc
mpfr
mtools
multi_c_rehash
ncurses
ncurses-base
ncurses-libs
net-tools
nspr
nss
nss-softokn-freebl
nss-sysinit
ofono
ofono-configs-mer
oneshot
openssh
openssh-clients
openssl-libs
oprofile
orc
osc
p11-kit
p11-kit-nss-ckbi
p11-kit-trust
pacrunner
pacrunner-python
pam
pango
parted
passwd
patch
pcre
perl
perl-Error
perl-Filter
#perl-Git
perl-Module-Pluggable
perl-Pod-Escapes
perl-Pod-Parser
perl-Pod-Perldoc
perl-Pod-Simple
perl-Scalar-List-Utils
perl-Socket
perl-libs
perl-macros
perl-parent
perl-threads
perl-threads-shared
pixman
pkgconfig
polkit
popt
powertop
ppl
prelink
procps
psmisc
pth
pygpgme
python
python-M2Crypto
python-cheetah
python-devel
python-iniparse
python-libs
python-lxml
python-pycurl
python-urlgrabber
python-yaml
python-zypp
qemu-usermode
qemu-usermode-static
readline
repomd-pattern-builder
rootfiles
rpm-build
rpm-libs
rpm-python
rsync
scratchbox2
sdk-chroot
sdk-sb2-config
sdk-utils
sed
setup
shadow-utils
shared-mime-info
#sp-memusage
#sp-rtrace
#sp-smaps
spectacle
sqlite
squashfs-tools
sudo
swig
systemd
systemd-config-mer
systemd-libs
systemd-user-session-targets
tar
test-definition
testrunner-lite
testrunner-lite-hwinfo-nemo
tinycdb
tzdata
unzip
usbutils
util-linux
v8
valgrind
vim-common
vim-enhanced
vim-filesystem
wayland
wireless-regdb
wpa_supplicant
xdg-user-dirs
xdg-utils
xz
xz-libs
xz-lzma-compat
yum
yum-metadata-parser
zip
zlib
zypper
%end
%pre
export SSU_RELEASE_TYPE=release
### begin 01_init
touch $INSTALL_ROOT/.bootstrap
### end 01_init
%end

%post
export SSU_RELEASE_TYPE=release
### begin 01_arch-hack
# Without this line the rpm does not get the architecture right.
echo -n "@ARCH@-meego-linux" > /etc/rpm/platform

#make rootfs as mer sdk
echo MerSDK > /etc/MerSDK

# Also libzypp has problems in autodetecting the architecture so we force tha as well.
# https://bugs.meego.com/show_bug.cgi?id=11484
echo "arch = @ARCH@" >> /etc/zypp/zypp.conf

#add repos
zypper ar -G http://repo.merproject.org/obs/home:/neochapay:/mer:/core/latest_@ARCH@ mer-core
zypper ar -G http://repo.merproject.org/obs/home:/neochapay:/mer:/mw/latest_@ARCH@ mer-mw
zypper ar -G http://repo.merproject.org/obs/home:/neochapay:/mer:/qt56/latest_@ARCH@ mer-qt56
zypper ar -G http://repo.merproject.org/obs/home:/neochapay:/mer:/crossutils/latest_@ARCH@ mer-crossutils
zypper ar -G http://repo.merproject.org/obs/home:/neochapay:/mer:/tools/latest_@ARCH@ mer-tools

### end 01_arch-hack
### begin 01_rpm-rebuilddb
# Rebuild db using target's rpm
echo -n "Rebuilding db using target rpm.."
rm -f /var/lib/rpm/__db*
rpm --rebuilddb
echo "done"
### end 01_rpm-rebuilddb
### begin 50_oneshot
# exit boostrap mode
rm -f /.bootstrap

# export some important variables until there's a better solution
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export GSETTINGS_BACKEND=gconf

# run the oneshot triggers for root and first user uid
UID_MIN=$(grep "^UID_MIN" /etc/login.defs |  tr -s " " | cut -d " " -f2)
DEVICEUSER=`getent passwd $UID_MIN | sed 's/:.*//'`

if [ -x /usr/bin/oneshot ]; then
   su -c "/usr/bin/oneshot --mic"
   su -c "/usr/bin/oneshot --mic" $DEVICEUSER
fi
### end 50_oneshot

### begin 60_sdk-domain

export SSU_DOMAIN=@RNDFLAVOUR@

if [ "$SSU_RELEASE_TYPE" = "release" ] && [[ "$SSU_DOMAIN" = "public-sdk" ]];
then
    ssu domain nemomobile
fi
### end 60_sdk-domain
%end

%post --nochroot
export SSU_RELEASE_TYPE=release
### begin 01_release
if [ -n "$IMG_NAME" ]; then
    echo "BUILD: $IMG_NAME" >> $INSTALL_ROOT/etc/meego-release
fi

%end

%pack
export SSU_RELEASE_TYPE=release

%end
