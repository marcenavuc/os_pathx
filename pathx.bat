@echo off
set filter=%1
set text=%CD%;%PATH%
set ext=%PATHEXT%

:loop
for /f "delims=; tokens=1*" %%A in ( "%text%" ) do (
   set str=%%A
   set strnext=%%B
   if "%str:~-1%"=="\" (
      set str=%str:~0,-1%
   )
   set ext=%PATHEXT%
   :eloop
   for /f "delims=; tokens=1*" %%d in ( "%ext%" ) do (
      for %%f in ("%str%\%filter%*%%d" ) do ( 
         echo %%f
         exit /b
      )
      set ext=%%e
      goto eloop
   )
   set text=%strnext%
   goto loop
)

echo File not found