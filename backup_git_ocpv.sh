#!/bin/bash
####################################
#
# Backup for My Wordpress Stuff to my git
# https://github.com/tux1980/leon 
#
####################################
git config --global credential.helper 'cache --timeout 720000000000000000'
git add /root/openshift/ocp4-kubevirt/*
git commit -m "Updates"
git push --set-upstream openshift-wolli main
