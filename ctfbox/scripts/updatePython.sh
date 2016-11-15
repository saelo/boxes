#!/bin/sh
# -*- coding: utf-8 -*-

echo "### py2 ###"
pip2 list --outdated | cut -d ' ' -f1 | xargs -n1 sudo -H pip2 install -U

#echo "### py3 ###"
#pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 sudo -H pip3 install -U
