Copy-Item -Path \\GB3GOCHJRGTST03\c$\sysadmin\Runner -Destination C:\sysadmin\Runner -Force -Recurse
Get-Process | sort WS -Descending | select -first 10
