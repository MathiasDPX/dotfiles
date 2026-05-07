#!/bin/bash

set -e

FINGERPRINT="3FA41CF697B65C61819A131089E4EEB99C9AD348"
KEY_ID="89E4EEB99C9AD348"
GPG_BIN=$(which gpg)


echo "> Import public key"
gpg --keyserver keys.openpgp.org --recv-keys "$FINGERPRINT"


echo "> Trust public key"
echo -e "5\ny\n" | gpg --command-fd 0 --edit-key "$KEY_ID" trust quit


echo "> Configure Git"
git config --global user.signingkey "$KEY_ID"
git config --global commit.gpgsign true
git config --global gpg.format openpgp
git config --global gpg.program "$GPG_BIN"


echo ""
echo "> Done"
