@echo off
setlocal EnableExtensions DisableDelayedExpansion
set "FolderPath=%~dp0"
if "%FolderPath:~-1%" == "\" set "FolderPath=%FolderPath:~0,-1%"
for /F "delims=" %%I in ('dir "%FolderPath%" /A-D /B /S 2^>nul ^| %SystemRoot%\System32\findstr.exe /E /I /L /V /G:"%FolderPath%\delete-all-except.txt"') do del /A /F "%%I"
call :DeleteEmptyFolders "%FolderPath%"
goto EndBatch

:DeleteEmptyFolders
for /F "eol=| delims=" %%I in ('dir %1 /AD /B 2^>nul') do call :DeleteEmptyFolders "%~1\%%I"
for /F "eol=| delims=" %%I in ('dir %1 /A /B 2^>nul') do goto :EOF
rd /Q /S %1
goto :EOF

:EndBatch
endlocal