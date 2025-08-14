# Simple DNS check script for smartcodelab.by
# Run: .\check-dns-simple.ps1

$domain = "smartcodelab.by"

Write-Host "Checking DNS for domain: $domain" -ForegroundColor Cyan
Write-Host ""

# Check current NS records
Write-Host "Current DNS servers:" -ForegroundColor Yellow
nslookup -type=ns $domain

Write-Host ""
Write-Host "Expected DNS servers:" -ForegroundColor Green
Write-Host "  ns1.domain.by" -ForegroundColor White
Write-Host "  ns2.domain.by" -ForegroundColor White

Write-Host ""
Write-Host "Domain availability:" -ForegroundColor Yellow
Test-Connection -ComputerName $domain -Count 1 -Quiet

Write-Host ""
Write-Host "A record:" -ForegroundColor Yellow
nslookup $domain

Write-Host ""
Write-Host "Instructions:" -ForegroundColor Cyan
Write-Host "1. Open your domain registrar control panel" -ForegroundColor White
Write-Host "2. Find domain $domain" -ForegroundColor White
Write-Host "3. Change DNS servers to:" -ForegroundColor White
Write-Host "   - ns1.domain.by" -ForegroundColor Green
Write-Host "   - ns2.domain.by" -ForegroundColor Green
Write-Host "4. Wait 24-48 hours for propagation" -ForegroundColor White
