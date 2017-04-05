#!/usr/bin/env python
import winrm

from argparse import ArgumentParser

parser = ArgumentParser()

# Arguments
parser.add_argument("-s", "--server", dest="server",
                    help="Enter server name", metavar="SERVER")
parser.add_argument("-u", "--user", dest="user",
                    help="Enter user name", metavar="USER")
parser.add_argument("-p", "--password", dest="password",
                    help="Enter password", metavar="PASSWORD")
args = parser.parse_args()

#print args.server
#print args.user
#print args.password

ps_script = open('scripts/mem.ps1','r').read()
session = winrm.Session(args.server, auth=(args.user, args.password))
run = session.run_ps(ps_script)
print run.status_code
print run.std_out
print run.std_err
