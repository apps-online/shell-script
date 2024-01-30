#!/usr/bin/env bash

#git clone https://<token>@github.com/apps-online/<repo>.git
#git remote set-url origin https://<token>@github.com/apps-online/<repo>.git

git add .
git commit -m "Updated"
git push origin main
git status
