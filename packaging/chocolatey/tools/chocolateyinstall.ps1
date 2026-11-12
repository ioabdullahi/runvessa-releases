$ErrorActionPreference = 'Stop'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'Runvessa requires 64-bit Windows.' }
$packageArgs = @{
  packageName = 'runvessa'
  fileType = 'exe'
  url64bit = 'https://github.com/ioabdullahi/runvessa-releases/releases/download/v0.4.0-preview.6/Runvessa-Setup-0.4.0-preview.6-Windows-x64.exe'
  checksum64 = '243177f0da24c323429025a8651a3f826b3d914741ba291b073e87282f3293fb'
  checksumType64 = 'sha256'
  silentArgs = '/S'
  validExitCodes = @(0)
}
# Runvessa is per-user. Do not install as SYSTEM or redirect into another profile.
if ([Security.Principal.WindowsIdentity]::GetCurrent().IsSystem) {
  throw 'Install Runvessa in the intended user account, not SYSTEM.'
}
Install-ChocolateyPackage @packageArgs
