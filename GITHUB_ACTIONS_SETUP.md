# 🚀 Настройка GitHub Actions для автоматического деплоя

## 📋 Что создано

1. **`.github/workflows/deploy.yml`** - основной workflow для production деплоя
2. **`.github/workflows/staging.yml`** - workflow для staging окружения
3. **Автоматическая сборка и тестирование** при каждом push
4. **Автоматический деплой** на хостинг s2.open.by

## 🔐 Настройка GitHub Secrets

### Шаг 1: Перейдите в настройки репозитория
1. Откройте ваш GitHub репозиторий
2. Нажмите **Settings** (вкладка)
3. В левом меню выберите **Secrets and variables** → **Actions**

### Шаг 2: Добавьте необходимые секреты

#### FTP_USERNAME
- **Name**: `FTP_USERNAME`
- **Value**: `смарткод`
- **Description**: Логин для FTP доступа к s2.open.by

#### FTP_PASSWORD
- **Name**: `FTP_PASSWORD`
- **Value**: `dMlW4h6wqM`
- **Description**: Пароль для FTP доступа к s2.open.by

## 🎯 Как это работает

### Автоматический деплой
- **Триггер**: Каждый push в ветку `main` или `master`
- **Действие**: Автоматическая сборка, тестирование и деплой
- **Результат**: Сайт обновляется на https://smartcodelab.by

### Staging деплой
- **Триггер**: Pull Request в main ветку
- **Действие**: Деплой в staging окружение
- **Результат**: Тестирование на https://s2.open.by/staging

### Ручной запуск
- **Триггер**: Вкладка Actions → Run workflow
- **Выбор**: Production или Staging окружение

## 📁 Структура деплоя

```
public_html/          # Production (основной сайт)
├── index.html
├── .htaccess
├── web.config
└── wwwroot/
    ├── css/
    ├── js/
    └── images/

staging/              # Staging (тестирование)
├── index.html
├── .htaccess
└── wwwroot/
```

## 🔧 Настройка веток

### Основная ветка (Production)
```bash
git checkout main
git add .
git commit -m "feat: add new feature - Cursor"
git push origin main
# Автоматически запустится деплой!
```

### Feature ветка (Staging)
```bash
git checkout -b feature/new-feature
git add .
git commit -m "feat: add new feature - Cursor"
git push origin feature/new-feature
# Создайте Pull Request для staging деплоя
```

## 📊 Мониторинг деплоя

### GitHub Actions
1. Перейдите в **Actions** вкладку
2. Выберите workflow **Deploy SmartCodeLab to s2.open.by**
3. Отслеживайте статус выполнения

### Логи деплоя
- ✅ **Зеленый**: Деплой успешен
- ❌ **Красный**: Ошибка деплоя
- 🟡 **Желтый**: Деплой в процессе

## 🚨 Устранение проблем

### Ошибка FTP подключения
- Проверьте правильность `FTP_USERNAME` и `FTP_PASSWORD`
- Убедитесь, что FTP доступен на s2.open.by

### Ошибка сборки
- Проверьте логи в GitHub Actions
- Убедитесь, что все зависимости указаны в `.csproj`

### Ошибка деплоя
- Проверьте права доступа к папке на сервере
- Убедитесь, что mod_rewrite включен

## 🎉 Преимущества

✅ **Автоматизация**: Никаких ручных действий  
✅ **Надежность**: Тестирование перед деплоем  
✅ **Безопасность**: Секреты не видны в коде  
✅ **Мониторинг**: Полная история деплоев  
✅ **Откат**: Возможность вернуться к предыдущей версии  

## 📞 Поддержка

При возникновении проблем:
1. Проверьте логи GitHub Actions
2. Убедитесь в правильности секретов
3. Проверьте доступность FTP сервера
4. Обратитесь в техподдержку s2.open.by
