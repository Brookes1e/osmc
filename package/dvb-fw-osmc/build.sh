# (c) 2014 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

echo -e "Building package DVB firmware"

FW_SCRIPT="https://www.kernel.org/doc/Documentation/dvb/get_dvb_firmware"

make clean
wget $FW_SCRIPT -O get_dvb_firmware
chmod +x get_dvb_firmware
patch -p1 < 000-pull_firmware_auto.patch

./get_dvb_firmware
mkdir -p files/lib/firmware
mv *.fw files/lib/firmware

dpkg -b files/ dvb-firmware-osmc.deb
