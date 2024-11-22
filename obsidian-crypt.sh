#!/bin/bash
# OpenSSL 3.3.2 3 Sep 2024 (Library: OpenSSL 3.3.2 3 Sep 2024)
# git-crypt 0.7.0
# GNU bash, version 5.2.37(1)-release (x86_64-pc-linux-gnu)

if [ "$1" != "encrypt" ] && [ "$1" != "decrypt" ]; then
    echo "\$1 should either be 'encrypt' or 'decrypt'"
    exit 1
fi

read -s -p "Enter password for the 1st time: " password
echo
read -s -p "Enter password for the 2nd time: " password_alter
echo
if [ "${password}" != "${password_alter}" ]; then
    echo "Password doesn't match!"
    exit 1
fi

if [ "$1" == "encrypt" ]; then
    git-crypt init
    git-crypt export-key - \
    | openssl aes-256-cbc -pbkdf2 -a -e -salt -pass "pass:${password}" \
    > git-crypt-aes-256-cbc.key
fi

if [ "$1" == "decrypt" ]; then
    cat git-crypt-aes-256-cbc.key \
    | openssl aes-256-cbc -pbkdf2 -a -d -salt -pass "pass:${password}" \
    | git-crypt unlock - 
fi

unset password_alter
unset password
