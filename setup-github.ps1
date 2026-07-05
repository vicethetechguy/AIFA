Write-Host "🔑 Generating a new SSH key for GitHub..." -ForegroundColor Cyan
$sshKeyPath = "$env:USERPROFILE\.ssh\id_ed25519"

if (-Not (Test-Path "$sshKeyPath")) {
    # Generate the key with an empty passphrase
    ssh-keygen -t ed25519 -C "vicethetechguy@example.com" -f "$sshKeyPath" -N '""'
} else {
    Write-Host "SSH key already exists at $sshKeyPath, skipping generation." -ForegroundColor Yellow
}

Write-Host "🔄 Changing the Git remote to use SSH instead of HTTPS..." -ForegroundColor Cyan
Set-Location -Path "C:\Users\user\Downloads\aifest-africa"
git remote set-url origin git@github.com:vicethetechguy/AIFA.git

Write-Host ""
Write-Host "=======================================================================" -ForegroundColor Green
Write-Host "✅ DONE! Now, you must copy the text below and paste it into GitHub:" -ForegroundColor Green
Write-Host "=======================================================================" -ForegroundColor Green
Write-Host ""

$pubKey = Get-Content "$sshKeyPath.pub" -Raw
Write-Host $pubKey -ForegroundColor Magenta

# Try to copy to clipboard for convenience
try {
    Set-Clipboard -Value $pubKey
    Write-Host "(The key has also been copied to your clipboard!)" -ForegroundColor Yellow
} catch {
    # Ignore if clipboard fails
}

Write-Host ""
Write-Host "=======================================================================" -ForegroundColor Cyan
Write-Host "STEPS TO FINISH:" -ForegroundColor Cyan
Write-Host "1. Log into GitHub and go to: https://github.com/settings/keys"
Write-Host "2. Click the green New SSH key button."
Write-Host "3. Give it a title (like Windows PC) and paste the key above into the Key box."
Write-Host "4. Click Add SSH key."
Write-Host "5. Finally, run this command to push your code:"
Write-Host "   git push -u origin main"
Write-Host "=======================================================================" -ForegroundColor Cyan
