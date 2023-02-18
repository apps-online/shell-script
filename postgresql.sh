#!/usr/bin/env sh

# debian@debian:~$ sudo -u postgres psql postgres

# or

# debian@debian:~$ sudo su - postgres
# postgres@debian:~$ psql
# postgres=# ALTER USER postgres WITH PASSWORD 'password';

sudo -u postgres psql postgres
