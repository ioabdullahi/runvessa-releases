$ErrorActionPreference = 'Stop'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'Runvessa requires 64-bit Windows.' }
$packageArgs = @{
  packageName = 'runvessa'
  fileType = 'exe'
  url64bit = 'https://github.com/ioabdullahi/runvessa-releases/releases/download/v0.4.0-preview.11/Runvessa-Setup-0.4.0-preview.11-Windows-x64.exe'
  checksum64 = '48aae83e181ae118035107e68b8f0adc204f6750aec95c7b957598d13863a823'
  checksumType64 = 'sha256'
  silentArgs = '/S'
  validExitCodes = @(0)
}
# Runvessa is per-user. Do not install as SYSTEM or redirect into another profile.
if ([Security.Principal.WindowsIdentity]::GetCurrent().IsSystem) {
  throw 'Install Runvessa in the intended user account, not SYSTEM.'
}
Install-ChocolateyPackage @packageArgs
