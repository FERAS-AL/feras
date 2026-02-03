@echo off
chcp 65001 > nul
echo ==========================================
echo       QuickDupe Arabic Build Script
echo          سكربت بناء كويك دوب
echo ==========================================
echo.

echo [1/3] Checking Python...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not found!
    echo Please download and install Python from python.org
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    echo [خطأ] بايثون غير مثبت!
    echo يرجى تحميل وتثبيت بايثون من python.org
    echo تأكد من وضع علامة صح على "Add Python to PATH" أثناء التثبيت
    pause
    exit /b
)
echo Python found.
echo.

echo [2/3] Installing requirements...
echo جاري تثبيت المكتبات المطلوبة...
pip install -r requirements_ar.txt
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install requirements.
    echo [خطأ] فشل تثبيت المكتبات
    pause
    exit /b
)
echo Requirements installed.
echo.

echo [3/3] Building EXE...
echo جاري بناء ملف البرنامج...
python build_ar.py
if %errorlevel% neq 0 (
    echo [ERROR] Build failed.
    echo [خطأ] فشل البناء
    pause
    exit /b
)

echo.
echo ==========================================
echo [SUCCESS] Build Complete!
echo [تم بنجاح] انتهى البناء
echo.
echo You can find QuickDupe_AR.exe in the 'dist' folder.
echo ستجد البرنامج في مجلد dist
echo ==========================================
pause
