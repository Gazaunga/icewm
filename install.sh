#!/bin/bash

FILE=packagelist

readarray -t LINES < "$FILE"
for LINE in "${LINES[@]}"; do
trizen -Syu --noconfirm $LINE
done

cp -R ~/icewm/* ~/
cp -R ~/icewm.* ~/

mmaker -f --no-legacy --no-debian icewm

# Auto Install Metro-XP Theme
#ocs://install?url=https%3A%2F%2Fwww.box-look.org%2Fp%2F1217830%2Fstartdownload%3Ffile_id%3D1519939402%26file_name%3Dmetro-xp_0-8.tar.bz2%26file_type%3Dapplication%2Fx-bzip2%26file_size%3D42309%26url%3Dhttps%253A%252F%252Fdl.opendesktop.org%252Fapi%252Ffiles%252Fdownloadfile%252Fid%252F1519939402%252Fs%252F44118ea1d5370053ac43931c14c1a163%252Ft%252F1525274618%252Fu%252F230386%252Fmetro-xp_0-8.tar.bz2&type=icewm_themes&filename=metro-xp_0-8.tar.bz2
