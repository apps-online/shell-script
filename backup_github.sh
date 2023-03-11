#!/usr/bin/env bash

current_dir=$(pwd)
directory="github-$(date +'%Y-%m-%d')"
mkdir "/tmp/$directory"
cd "/tmp/$directory"
read -p "Token: " token
repos=$(curl -H "Authorization: token $token" https://api.github.com/user/repos | jq -r '.[]|.html_url')
#read -p "User: " user
#repos=$(curl -s https://api.github.com/users/$user/repos | jq -r '.[]|.html_url')
for repo in ${repos[@]}; do
git clone "https://$token@"${repo#https://}".git"
#git clone $repo".git"
done
cd /tmp
tar -cvf "$directory.tar" $directory
rm -rf $directory
cd $current_dir
mv "/tmp/$directory.tar" "$directory.tar"
clear
echo '========== Done! =========='
