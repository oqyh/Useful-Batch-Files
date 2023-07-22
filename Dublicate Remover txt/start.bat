@echo off
type nul>result_after_removing_dublicates.txt
for /f "tokens=* delims=" %%a in (dublicate_remover.txt) do (
  findstr /ixc:"%%a" result_after_removing_dublicates.txt || >>result_after_removing_dublicates.txt echo.%%a
)