@echo off
echo Starting Coolify update from GitHub...

cd /d "D:\code\coolify"
if %errorlevel% neq 0 (
    echo Failed to change to coolify directory
    exit /b 1
)

echo Logging into GitHub Container Registry...
docker login ghcr.io -u makeouthillx32 -p %GHCR_TOKEN%
if %errorlevel% neq 0 (
    echo Failed to login to GHCR
    exit /b 1
)

echo Pulling latest image...
docker-compose -f docker-compose.dev.yml pull coolify
if %errorlevel% neq 0 (
    echo Failed to pull image
    exit /b 1
)

echo Recreating container...
docker-compose -f docker-compose.dev.yml up -d --force-recreate coolify
if %errorlevel% neq 0 (
    echo Failed to recreate container
    exit /b 1
)

echo Coolify updated successfully!
docker-compose -f docker-compose.dev.yml ps coolify