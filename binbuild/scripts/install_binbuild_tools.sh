set -e
set -x
# old releases fix
sed -i 's/http:\/\/deb.debian.org\/debian/[trusted=yes] http:\/\/archive.debian.org\/debian/g' /etc/apt/sources.list
sed -i 's/http:\/\/security.debian.org/[trusted=yes] http:\/\/archive.debian.org\/debian-security/g' /etc/apt/sources.list
sed -i '/jessie-updates/d' /etc/apt/sources.list
echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99ignore-release-date

# for npm module re-building
apt-get update -y
apt-get -y install build-essential g++ libssl-dev git python
npm install -g node-gyp
# pre-install node source code for faster building
$(npm bin -g)/node-gyp install ${NODE_VERSION}

bash $METEORD_DIR/lib/cleanup.sh
