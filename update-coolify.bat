@echo off
echo 📁 Entering Coolify directory...
cd /d "D:\code\coolify"

echo 📥 Pulling latest image...
docker-compose -f docker-compose.dev.yml pull coolify

echo 🔁 Recreating container...
docker-compose -f docker-compose.dev.yml up -d --force-recreate coolify

echo ✅ Coolify updated successfully!