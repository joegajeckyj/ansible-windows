If (!(Test-Path "C:\Program Files\VMware")){
  MD -force "C:\Program Files\VMware"
}

Start-Process -NoNewWindow -Wait -FilePath "c:\sysadmin\Runner\setup64.exe" -ArgumentList "/S /v ""/qn /l*v ""C:\Program Files\VMware\vmmsi.log"" REBOOT=R"""
