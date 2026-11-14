$ErrorActionPreference = 'Stop'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'Runvessa requires 64-bit Windows.' }
$packageArgs = @{
  packageName = 'runvessa'
  fileType = 'exe'
  url64bit = 'https://github.com/ioabdullahi/runvessa-releases/releases/download/v0.4.0-preview.14/Runvessa-Setup-0.4.0-preview.14-Windows-x64.exe'
  checksum64 = 'b173d813d43f2aa0a1d6fd42df5603e013ec567b09ff7a312c08dc267de68b9d'
  checksumType64 = 'sha256'
  silentArgs = '/S'
  validExitCodes = @(0)
}
# Runvessa is per-user. Do not install as SYSTEM or redirect into another profile.
if ([Security.Principal.WindowsIdentity]::GetCurrent().IsSystem) {
  throw 'Install Runvessa in the intended user account, not SYSTEM.'
}
Install-ChocolateyPackage @packageArgs
