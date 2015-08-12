#!/bin/bash

mkdir /var/run/sshd
mkdir -p /home/nikmash/.ssh
chmod 700 /home/nikmash/.ssh
mv /authorized_keys /home/nikmash/.ssh/
chmod 600 /home/nikmash/.ssh/*
chown -Rf nikmash:nikmash /home/nikmash/.ssh
/usr/bin/ssh-keygen -A
ls -al /etc/ssh/ssh*key

# configure sshd to block authentication via password
#sed -i.bak 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
#rm /etc/ssh/sshd_config.bak
