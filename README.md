# 🚀 SmartCodeLab AI

Умное, смелое, минималистичное программное обеспечение в стиле SmartCodeLab. Мы создаём быстрые и надёжные ИТ‑решения на базе ИИ.

## 🌟 Особенности

- **AI-разработка** - Создание интеллектуальных систем, машинное обучение
- **Веб-приложения** - Современные веб-решения на React, Angular, Blazor
- **Мобильные приложения** - Нативные и кроссплатформенные приложения
- **Автоматизация** - Автоматизация бизнес-процессов и интеграции

## 🛠️ Технологии

- **Backend**: .NET 8, Blazor Server
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
- **AI/ML**: TensorFlow, машинное обучение
- **Cloud**: AWS, MongoDB, Docker

## 🚀 Быстрый старт

### Локальная разработка
```bash
# Клонирование репозитория
git clone https://github.com/your-username/SmartCodeLab.git
cd SmartCodeLab

# Восстановление зависимостей
dotnet restore

# Запуск приложения
dotnet run
```

### Автоматический деплой
Приложение автоматически развертывается на [s2.open.by](https://s2.open.by) при каждом push в main ветку.

## 📋 GitHub Actions

### Автоматический деплой
- **Production**: Автоматически при push в `main`/`master`
- **Staging**: При создании Pull Request
- **Тестирование**: При push в feature ветки

### Настройка секретов
1. Перейдите в **Settings** → **Secrets and variables** → **Actions**
2. Добавьте:
   - `FTP_USERNAME`: `смарткод`
   - `FTP_PASSWORD`: `dMlW4h6wqM`

## 🌐 Деплой

### Автоматический (рекомендуется)
```bash
git add .
git commit -m "feat: add new feature - Cursor"
git push origin main
# Автоматически запустится деплой!
```

### Ручной
- **cPanel**: https://cpanel.domain.by
- **FTP**: s2.open.by (логин: смарткод)

## 📁 Структура проекта

```
SmartCodeLab/
├── .github/workflows/     # GitHub Actions
├── Pages/                 # Blazor страницы
├── Layout/                # Макеты и навигация
├── wwwroot/               # Статические файлы
├── Program.cs             # Точка входа
└── SmartCodeLab.csproj    # Конфигурация проекта
```

## 🔧 Разработка

### Сборка для продакшена
```bash
dotnet publish -c Release -o publish
```

### Запуск тестов
```bash
dotnet test
```

### Линтинг
```bash
dotnet format
```

## 📚 Документация

- [Настройка GitHub Actions](GITHUB_ACTIONS_SETUP.md)
- [Инструкция по деплою](DEPLOY_INSTRUCTIONS.md)
- [Скрипт деплоя](deploy.ps1)

## 🤝 Вклад в проект

1. Форкните репозиторий
2. Создайте feature ветку (`git checkout -b feature/amazing-feature`)
3. Зафиксируйте изменения (`git commit -m 'feat: add amazing feature'`)
4. Отправьте в ветку (`git push origin feature/amazing-feature`)
5. Откройте Pull Request

## 📞 Поддержка

- **Сайт**: https://smartcodelab.by
- **Email**: support@smartcodelab.by
- **GitHub Issues**: [Создать issue](https://github.com/your-username/SmartCodeLab/issues)

## 📄 Лицензия

Этот проект лицензирован под MIT License - см. файл [LICENSE](LICENSE) для деталей.

---

**Создано с ❤️ командой SmartCodeLab AI**
