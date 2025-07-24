@echo off
set LOG_FILE=D:\code\coolify\coolify-update.log
echo --- START %DATE% %TIME% --- >> %LOG_FILE%

cd /d "D:\code\coolify" >> %LOG_FILE% 2>&1

echo Pulling latest image... >> %LOG_FILE%
docker-compose -f docker-compose.dev.yml pull coolify >> %LOG_FILE% 2>&1

echo Recreating container... >> %LOG_FILE%
docker-compose -f docker-compose.dev.yml up -d --force-recreate coolify >> %LOG_FILE% 2>&1

echo Done. Coolify updated. >> %LOG_FILE%
echo --- END %DATE% %TIME% --- >> %LOG_FILE%