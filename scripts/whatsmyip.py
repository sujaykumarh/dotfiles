#!/usr/bin/env python

# ################################################################################
# 
# Copyright Jun, 2020 - present - Sujaykumar.Hublikar <hello@sujaykumarh.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#    http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#####################################################################################

import sys, argparse, subprocess
import urllib.request
import socket 

# App Name
_appName = "WhatsMyIp"
# App Name
_appDesc = "WhatsMyIp Find out your ip and hostname\nUse -h to find how to use"
# App Version
_appVer = "0.0.1"   

def externalIp():
    _externalIp = urllib.request.urlopen('https://icanhazip.com/').read().decode('utf-8').rstrip().strip()
    # print(_externalIp)
    print("External Ip  : ", _externalIp)

def internalIP():
    try: 
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('255.255.255.0', 1))  # connect() for UDP doesn't send packets
        local_ip_address = s.getsockname()[0].strip()
        print("Internal Ip  : ", local_ip_address) 
    except: 
        print("Unable to get Local IP") 
  
def hostName():
    try: 
        host_name = socket.gethostname().strip()
        print("Hostname     : ", host_name) 
    except: 
        print("Unable to get Hostname") 

def main():
    parser = argparse.ArgumentParser(prog=_appName, description=_appDesc)
    parser.add_argument('-a', '--all', action='store_true', help="Print all the other argument info.")
    parser.add_argument('-n', '--hostname', action='store_true', help="Finds Hostname")
    parser.add_argument('-i', '--internal', action='store_true', help="Finds Internal Ip")
    parser.add_argument('-e', '--external', action='store_true', help="Finds External Ip")
    parser.add_argument('-v', '--version', action='version', version='%(prog)s v{version}'.format(version=_appVer))
    args = parser.parse_args()
    globals().update(args.__dict__)

    if len(sys.argv) < 2:
        print('{name} v{version}'.format(name=_appName, version=_appVer))
        print("\nNo argurment specified use --help or -h to learn more")
        return

    if(args.all):
        hostName()
        internalIP()
        externalIp()
        return

    if(args.hostname):
        hostName()

    if(args.internal):
        internalIP()

    if(args.external):
        externalIp()

if __name__ == '__main__':
    main()  # Run Main Function