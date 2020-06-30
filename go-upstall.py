#!/usr/bin/env python3
# Author: Thiago Mallon <thiagomallon@gmail.com>

import requests
import getpass
import urllib.request
import re
import subprocess
import shutil

#
def check_installed_ver():
    try:
        curr_ver_res = subprocess.check_output(["go", "version"])
    except FileNotFoundError:
        return False
    else:
        curr_ver = re.search('((\d+\.?){3})',str(curr_ver_res, 'utf-8')) # check why not
    return curr_ver.group(1)

#
def down_decomp_go(lts_ver):
    filename = f"go{lts_ver}.linux-amd64.tar.gz"
    url = f"https://dl.google.com/go/{filename}"
    path = f"/home/{getpass.getuser()}/Downloads/"
    subprocess.run(f"wget -P {path} {url}", shell=True, check=True)
    subprocess.run(f"sudo tar -C /usr/local -xzf {path}{filename}", shell=True, check=True)
    subprocess.run(f"rm {path}{filename}", shell=True, check=True)

#
def check_latest_ver():
    lts_ver_url = "https://golang.org/VERSION?m=text"
    lts_ver_res = requests.get(lts_ver_url)
    lts_ver = re.search('((\d+\.?){3})', lts_ver_res.text) # check why not
    return lts_ver.group(1)

#
def check_go_install():
    lts_ver = check_latest_ver()
    inst_ver = check_installed_ver()

    def ask_usr():
        resp = input("\33[1;34mWould you like to install the latest version? [Y/n]:\33[0m ")
        if not resp or re.search(r'Y|y', resp):
            down_decomp_go(lts_ver)
        else:
            return False
        return True

    if not inst_ver:
        print("\33[1;34mIt seems that you don't have Go installed.\33[0m")
        if ask_usr():
            subprocess.run(f"sh -c 'printf \"export GOROOT=/usr/local/go\nexport GOPATH=\$HOME/go\nexport PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH\" >> ~/.profile'", shell=True, check=True)
    elif lts_ver > inst_ver:
        print("\33[1;32mYour Go installation is outdated.\33[0m")
        ask_usr()

try:
    check_go_install()
except requests.exceptions.ConnectionError as e:
    print("\33[1;31mPlease, check your connection\33[0m")
except Exception as e:
    print("Something went wrong. Please check the log file")
    print(e)
else:
    print("\33[1;32mAll good buddy.\33[0m")
