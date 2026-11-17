![Омчанка · Aether ОБТ](assets/banner.svg)

# Aether и Омчанка · открытая бета

Для установки выберите один файл:

| Что нужно | Файл |
|---|---|
| Android ARM64 · проверка ключа, маршрутизация, журнал, маскоты | [Скачать APK](https://github.com/yrkas1488-ship-it/omchanka-obt/releases/download/v0.1.0-beta.1/Aether-Android-key-check-arm64.apk) |
| Windows x64 · переносимый клиент 0.0.9.12 (b) | [Скачать ZIP](https://github.com/yrkas1488-ship-it/omchanka-obt/releases/download/v0.1.0-beta.1/Aether-Windows-key-check.zip) |
| Панель на VPS · установка или обновление | `install-omchanka-ubuntu.sh` — команда ниже |
| Исходники панели, включая копирование существующих ключей | [Скачать исходники](https://github.com/yrkas1488-ship-it/omchanka-obt/releases/download/v0.1.0-beta.1/omchanka-source.zip) |
| Контрольные суммы | [SHA256SUMS.txt](https://github.com/yrkas1488-ship-it/omchanka-obt/releases/download/v0.1.0-beta.1/SHA256SUMS.txt) |

## Панель одной командой

На Ubuntu / Debian выполните от root:

```bash
bash <(curl -fsSL https://github.com/yrkas1488-ship-it/omchanka-obt/releases/download/v0.1.0-beta.1/install-omchanka-ubuntu.sh)
```

На новой системе установщик подготовит зависимости и запросит параметры панели.
Для существующей стандартной установки `/opt/omchanka` он собирает обновление,
сохраняет предыдущий бинарник и откатывает его при неудачном запуске. Ключи,
сертификаты и настройки сохраняются. Сборка на VPS занимает несколько минут;
перезапуск кратковременно прерывает соединения Aether.

## Клиенты

**Android:** установите APK; при обновлении — поверх текущего приложения.
**Windows:** распакуйте ZIP и запустите `Aether.exe`.
В обоих клиентах импортируйте свою ссылку из панели. Ссылку храните как пароль.

## Статус беты

На телефоне проверялись передача трафика, маршрутизация, сон и переключение сетей.
Отдельные TCP/TLS-таймауты ещё исследуются; независимый аудит безопасности не проводился.
Это тестовый выпуск, а не гарантия отсутствия утечек или сбоев.

## Архив

[Прежние тестовые APK, Windows-сборки и патчи](https://github.com/yrkas1488-ship-it/omchanka-obt/releases/tag/v0.1.0-beta.1-archive) сохранены отдельно для истории и отката.
