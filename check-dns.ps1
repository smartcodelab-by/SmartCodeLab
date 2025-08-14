# Скрипт для проверки DNS настроек домена smartcodelab.by
# Запуск: .\check-dns.ps1

$domain = "smartcodelab.by"
$expectedNS = @("ns1.domain.by", "ns2.domain.by")

Write-Host "🔍 Проверяем DNS настройки для домена: $domain" -ForegroundColor Cyan
Write-Host ""

# Проверяем текущие NS записи
Write-Host "📋 Текущие DNS серверы:" -ForegroundColor Yellow
try {
    $nsRecords = nslookup -type=ns $domain 2>$null | Select-String "nameserver ="
    if ($nsRecords) {
        foreach ($ns in $nsRecords) {
            Write-Host "   $($ns.ToString().Trim())" -ForegroundColor White
        }
    } else {
        Write-Host "   ❌ NS записи не найдены" -ForegroundColor Red
    }
} catch {
    Write-Host "   ❌ Ошибка при получении NS записей" -ForegroundColor Red
}

Write-Host ""

# Проверяем ожидаемые NS записи
Write-Host "✅ Ожидаемые DNS серверы:" -ForegroundColor Green
foreach ($ns in $expectedNS) {
    Write-Host "   $ns" -ForegroundColor White
}

Write-Host ""

# Проверяем доступность домена
Write-Host "🌐 Проверяем доступность домена:" -ForegroundColor Yellow
try {
    $ping = Test-Connection -ComputerName $domain -Count 1 -Quiet
    if ($ping) {
        Write-Host "   ✅ Домен доступен" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Домен недоступен" -ForegroundColor Red
    }
} catch {
    Write-Host "   ❌ Ошибка при проверке доступности" -ForegroundColor Red
}

Write-Host ""

# Проверяем A запись
Write-Host "📍 Проверяем IP адрес домена:" -ForegroundColor Yellow
try {
    $aRecord = nslookup $domain 2>$null | Select-String "Address:"
    if ($aRecord) {
        foreach ($record in $aRecord) {
            if ($record.ToString() -notlike "*127.0.0.1*") {
                Write-Host "   $($record.ToString().Trim())" -ForegroundColor White
            }
        }
    } else {
        Write-Host "   ❌ A запись не найдена" -ForegroundColor Red
    }
} catch {
    Write-Host "   ❌ Ошибка при получении A записи" -ForegroundColor Red
}

Write-Host ""
Write-Host "📋 Инструкции по настройке DNS:" -ForegroundColor Cyan
Write-Host "1. Откройте панель управления вашего регистратора домена" -ForegroundColor White
Write-Host "2. Найдите домен $domain" -ForegroundColor White
Write-Host "3. Измените DNS серверы на:" -ForegroundColor White
Write-Host "   - ns1.domain.by" -ForegroundColor Green
Write-Host "   - ns2.domain.by" -ForegroundColor Green
Write-Host "4. Подождите 24-48 часа для распространения изменений" -ForegroundColor White
