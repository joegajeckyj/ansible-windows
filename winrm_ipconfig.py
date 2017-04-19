#!/usr/bin/env python

import winrm

s = winrm.Session('10.105.13.25', auth=('administrator@jrg.lab', 'dbghYp9e3bR'))
r = s.run_cmd('ipconfig', ['/all'])
print r.status_code
print r.std_out
print r.std_err
