# az-secret-script

a powershell script that helps to upload multiple secrets only in one run

## Steps to run the script

1. **Update the secrets in the secrets.json**
2. **Open PowerShell and run `az login`**
3. **Allow access for this specific PowerShell process by running `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`**
4. **Type `./upload.ps1`**
