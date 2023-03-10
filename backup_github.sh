#!/usr/bin/env bash

read -p "User: " user
read -p "Token: " token
current_dir=$(pwd)
directory="github-$user-$(date +'%Y-%m-%d')"
mkdir "/tmp/$directory"
cd "/tmp/$directory"
repos=$(curl -H "Authorization: $token" https://api.github.com/users/$user/repos | jq -r '.[]|.html_url')
#repos=$(curl -s https://api.github.com/users/$user/repos | jq -r '.[]|.html_url')
ext=".git"
for repo in ${repos[@]}; do
git clone $repo$ext
done
cd /tmp
tar -cvf "$directory.tar" $directory
rm -rf $directory
cd $current_dir
mv "/tmp/$directory.tar" "$directory.tar"
clear
echo '========== Done! =========='
