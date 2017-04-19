#!/usr/bin/env python

import winrm

s = winrm.Session('GB3GOCHJRGTST01', auth=('administrator@jrg.lab', 'dbghYp9e3bR'))
r = s.run_cmd('ipconfig', ['/all'])
print r.status_code
print r.std_out
print r.std_err
