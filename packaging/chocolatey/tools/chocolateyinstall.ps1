$ErrorActionPreference = 'Stop'
if (-not [Environment]::Is64BitOperatingSystem) { throw 'Runvessa requires 64-bit Windows.' }
$packageArgs = @{
  packageName = 'runvessa'
  fileType = 'exe'
  url64bit = 'https://github.com/ioabdullahi/runvessa-releases/releases/download/v0.4.0-preview.12/Runvessa-Setup-0.4.0-preview.12-Windows-x64.exe'
  checksum64 = '8c8e2c345ef18ae93d894e82ae2c72920d507c9d6997e0cbdeb7afa21a3f6f7c'
  checksumType64 = 'sha256'
  silentArgs = '/S'
  validExitCodes = @(0)
}
# Runvessa is per-user. Do not install as SYSTEM or redirect into another profile.
if ([Security.Principal.WindowsIdentity]::GetCurrent().IsSystem) {
  throw 'Install Runvessa in the intended user account, not SYSTEM.'
}
Install-ChocolateyPackage @packageArgs
