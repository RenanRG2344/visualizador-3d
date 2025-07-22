@echo off
cd /d "C:\Users\renan\3D Objects\projetos"

echo ================================
echo  🔄 Sincronizando com GitHub...
echo ================================
git pull origin main --allow-unrelated-histories

echo ================================
echo  ➕ Adicionando arquivos...
echo ================================
git add .

:: Gera a data e hora atual para o commit
for /f "tokens=1-5 delims=/ " %%d in ("%date%") do (
    set DIA=%%d
    set MES=%%e
    set ANO=%%f
)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set HORA=%%a
    set MIN=%%b
)

set MSG=Atualização em %DIA%/%MES%/%ANO% às %HORA%h%MIN%min

echo ================================
echo  📝 Fazendo commit...
echo ================================
git commit -m "%MSG%"

echo ================================
echo  🚀 Enviando para o GitHub...
echo ================================
git push origin main

echo.
echo ✅ Projeto sincronizado com sucesso!
pause
