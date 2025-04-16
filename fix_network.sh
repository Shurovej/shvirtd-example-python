#!/bin/bash

# Останавливаем и удаляем все контейнеры
docker compose down

# Удаляем конфликтующую сеть
docker network rm backend 2>/dev/null || true

# Запускаем заново
docker compose up -d
