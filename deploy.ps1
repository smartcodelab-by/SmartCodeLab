# Скрипт автоматического деплоя SmartCodeLab на s2.open.by
# Запуск: .\deploy.ps1

param(
    [string]$FtpServer = "s2.open.by",
    [string]$Username = "смарткод",
    [string]$Password = "dMlW4h6wqM",
    [string]$RemotePath = "/public_html",
    [string]$LocalPath = ".\publish"
)

Write-Host "🚀 Начинаем деплой SmartCodeLab на $FtpServer..." -ForegroundColor Green

# Проверяем наличие папки publish
if (-not (Test-Path $LocalPath)) {
    Write-Host "❌ Папка $LocalPath не найдена. Сначала выполните сборку: dotnet publish -c Release -o publish" -ForegroundColor Red
    exit 1
}

# Создаем временный файл с FTP командами
$ftpCommands = @"
open $FtpServer
user $Username $Password
binary
cd $RemotePath
lcd $LocalPath
prompt
mput *
bye
"@

$ftpCommands | Out-File -FilePath "ftp_commands.txt" -Encoding ASCII

Write-Host "📤 Загружаем файлы на сервер..." -ForegroundColor Yellow

try {
    # Запускаем FTP с командами
    ftp -s:ftp_commands.txt
    
    Write-Host "✅ Деплой завершен успешно!" -ForegroundColor Green
    Write-Host "🌐 Ваш сайт должен быть доступен по адресу: https://smartcodelab.by" -ForegroundColor Cyan
    
} catch {
    Write-Host "❌ Ошибка при загрузке: $_" -ForegroundColor Red
} finally {
    # Удаляем временный файл
    if (Test-Path "ftp_commands.txt") {
        Remove-Item "ftp_commands.txt"
    }
}

Write-Host "📋 Не забудьте проверить настройки в cPanel:" -ForegroundColor Yellow
Write-Host "   - https://cpanel.domain.by" -ForegroundColor White
Write-Host "   - http://smartcodelab.by/cpanel" -ForegroundColor White
