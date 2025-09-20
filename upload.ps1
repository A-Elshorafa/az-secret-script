# Path to your secrets file
$secretsFile = ".\secrets.json"

# Name of your Key Vault
$vaultName = "myVaultName"

# Load secrets from JSON
$secrets = Get-Content -Raw -Path $secretsFile | ConvertFrom-Json

# Show what will be uploaded
Write-Host "The following secrets will be uploaded to Key Vault '$vaultName':" -ForegroundColor Green
foreach ($p in $secrets.PSObject.Properties) {
    Write-Host " - $($p.Name)" -ForegroundColor Green
}

# Ask for confirmation
$confirmation = Read-Host -Prompt "Do you want to continue? (y/n)"

if ($confirmation -eq "y") {
    foreach ($p in $secrets.PSObject.Properties) {
        $name = $p.Name
        $value = $p.Value

        Write-Host "Adding secret: $name" -ForegroundColor Green
        az keyvault secret set `
            --vault-name $vaultName `
            --name $name `
            --value $value | Out-Null
    }
    Write-Host "✅ All secrets uploaded successfully." -ForegroundColor Green
}
else {
    Write-Host "❌ Operation cancelled." -ForegroundColor Red
}
