@echo off
chcp 65001 > nul
echo ==========================================
echo       QuickDupe Arabic Build Script
echo          سكربت بناء كويك دوب
echo ==========================================
echo.
echo اضغط اي زر للبدء...
pause

echo.
echo [1/3] Checking Python...
echo جاري البحث عن بايثون...
python --version
if %errorlevel% neq 0 (
    echo.
    echo ==========================================
    echo [ERROR] Python is not found!
    echo [خطأ] بايثون غير مثبت!
    echo.
    echo Please download and install Python from python.org
    echo يرجى تحميل وتثبيت بايثون من python.org
    echo.
    echo Make sure to check "Add Python to PATH" during installation.
    echo تأكد من وضع علامة صح على "Add Python to PATH" أثناء التثبيت
    echo ==========================================
    echo.
    pause
    exit /b
)
echo Python found!
echo تم العثور على بايثون!
echo.

echo [2/3] Installing requirements...
echo جاري تثبيت المكتبات المطلوبة...
echo.
pip install -r requirements_ar.txt
if %errorlevel% neq 0 (
    echo.
    echo ==========================================
    echo [ERROR] Failed to install requirements.
    echo [خطأ] فشل تثبيت المكتبات
    echo ==========================================
    echo.
    pause
    exit /b
)
echo.
echo Requirements installed!
echo تم تثبيت المكتبات!
echo.

echo [3/3] Building EXE...
echo جاري بناء ملف البرنامج...
echo.
python build_ar.py
if %errorlevel% neq 0 (
    echo.
    echo ==========================================
    echo [ERROR] Build failed.
    echo [خطأ] فشل البناء
    echo ==========================================
    echo.
    pause
    exit /b
)

echo.
echo ==========================================
echo [SUCCESS] Build Complete!
echo [تم بنجاح] انتهى البناء!
echo.
echo You can find QuickDupe_AR.exe in the 'dist' folder.
echo ستجد البرنامج في مجلد dist
echo ==========================================
echo.
pause
