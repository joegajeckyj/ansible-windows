If (!(Test-Path "C:\Program Files\VMware")){
  MD -force "C:\Program Files\VMware"
}
Copy-Item -Path i:\ -Destination c:\sysadmin\Runner -Force -recurse
Start-Process -NoNewWindow -Wait -FilePath ".\setup64.exe" -ArgumentList "/S /v ""/qn /l*v ""C:\Program Files\VMware\vmmsi.log"" REBOOT=R"""
