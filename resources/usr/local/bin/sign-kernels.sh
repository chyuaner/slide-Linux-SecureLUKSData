#!/bin/bash
set -e

KEY="/usr/share/secureboot/keys/MOK.key"
CRT="/usr/share/secureboot/keys/MOK.crt"

find /boot/ -maxdepth 1 -name 'vmlinuz-*' | while read -r kernel; do
    if ! sbverify --list "$kernel" 2>/dev/null | grep -q "signature certificates"; then
        echo "Signing $kernel ..."
        sbsign --key "$KEY" --cert "$CRT" --output "$kernel" "$kernel"
    else
        echo "Already signed: $kernel"
    fi
done
