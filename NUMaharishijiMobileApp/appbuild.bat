@echo off
 
REM ============================================
REM  reset-android.bat
REM  Removes the android folder and re-adds it
REM ============================================

echo.
echo ====== Removing existing android folder ======
if exist android (
    rmdir /S /Q android
    if errorlevel 1 (
        echo Failed to remove android folder.
        exit /b 1
    )
    echo Android folder removed.
) else (
    echo No android folder found, skipping removal.
)
echo.

echo ====== Re-adding android platform ======
call npx cap add android
if errorlevel 1 (
    echo Failed to add android platform.
    exit /b 1
)
echo Android platform recreated successfully.
pause


echo.
echo ====== Step 1: Clean old icon/splash resources ======
for /d %%D in (android\app\src\main\res\mipmap-*) do (
    echo Removing %%D
    rmdir /S /Q "%%D"
)
for /d %%D in (android\app\src\main\res\drawable-*) do (
    echo Removing %%D
    rmdir /S /Q "%%D"
)
echo Resource folders cleaned.
echo.

echo ====== Step 2: Copy Google service/config files (if present) ======
REM -- Adjust the source folder if your google-services.json or plist
REM    is stored elsewhere. This example assumes you keep a copy in
REM    resources\google\ for convenience.
if exist resources\google\google-services.json (
    copy /Y resources\google\google-services.json android\app\
    echo Copied google-services.json
) else (
    echo No google-services.json found in resources\google\
)
echo.

echo ====== Step 3: Regenerate icons and splash images ======
call npx cordova-res android --skip-config --copy
if errorlevel 1 (
    echo cordova-res failed. Exiting.
    exit /b 1
)
echo Icons & splash regenerated.
echo.

echo ====== Step 4: Build project ======
call npx ionic build --product
if errorlevel 1 (
    echo Ionic Build failed. Exiting.
    exit /b 1
)
echo Ionic Build complete.
echo.

echo ====== Step 4: Capacitor sync (no APK build) ======
call npx cap sync android
if errorlevel 1 (
    echo Capacitor sync failed. Exiting.
    exit /b 1
)
echo Capacitor sync complete.
echo.

echo ====== All Done! ======
echo Old resources removed, Google files copied, and new icons/splash applied.
echo No APK was built.
pause
