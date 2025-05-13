#!/bin/bash

# Останавливаем и удаляем все контейнеры
docker compose down

# Удаляем конфликтующую сеть
docker network rm backend 2>/dev/null || true

# Запускаем заново
docker compose up -d

# Ждем инициализации MySQL
echo "Ожидаем готовности MySQL..."
for i in {1..30}; do
  if docker compose exec db mysqladmin ping -h localhost --silent; then
    echo "MySQL готов!"
    break
  fi
  sleep 2
done

# Проверяем состояние сервисов
docker compose ps
