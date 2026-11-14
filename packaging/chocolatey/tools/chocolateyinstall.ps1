$ErrorActionPreference = 'Stop'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'Runvessa requires 64-bit Windows.' }
$packageArgs = @{
  packageName = 'runvessa'
  fileType = 'exe'
  url64bit = 'https://github.com/ioabdullahi/runvessa-releases/releases/download/v0.4.0-preview.13/Runvessa-Setup-0.4.0-preview.13-Windows-x64.exe'
  checksum64 = 'ea0ba3c5573c53bf3aa2b76e906bdc45094264c8c65314a13279e0c39b6ef644'
  checksumType64 = 'sha256'
  silentArgs = '/S'
  validExitCodes = @(0)
}
# Runvessa is per-user. Do not install as SYSTEM or redirect into another profile.
if ([Security.Principal.WindowsIdentity]::GetCurrent().IsSystem) {
  throw 'Install Runvessa in the intended user account, not SYSTEM.'
}
Install-ChocolateyPackage @packageArgs
