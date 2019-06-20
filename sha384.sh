#!/bin/sh -e

URL=https://swift.org/builds/swift-5.0.1-release/ubuntu1804/swift-5.0.1-RELEASE/swift-5.0.1-RELEASE-ubuntu18.04.tar.gz
KEY=A62AE125BBBFBB96A6E042EC925CC1CCED3D1561

WORKING_DIR="$(mktemp -d)"
echo $WORKING_DIR
cd $WORKING_DIR

curl -L $URL -o swift.tar.gz
curl -L $URL.sig -o swift.tar.gz.sig

# Only do that once, or whenever the keyservers let you.
#gpg --quiet --keyserver ha.pool.sks-keyservers.net --recv-keys $KEY

gpg --batch --verify --quiet swift.tar.gz.sig swift.tar.gz
# -> File is OK.

echo -n "sha384/"
sha384sum swift.tar.gz

rm -r $WORKING_DIR
