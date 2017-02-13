::Date: 2/12/17
::This batch script will allow you to append a specific value entered to the end of each line.
::DO NOT FORGET TO USE ESCAPE SPECIAL CHARACTERS

@echo off
set original_file=%1
set new_file=%2
set /A args=2

::this will be the string you want to add to the end of each line
SET string=
SET /P string=Enter the value you want to append:
::echo %string%


::Calculate the number of arguments entered, it will exit the program if fails.
set arg_count=0
for %%x in (%*) do set /A arg_count+=1
::echo arg_count = %arg_count%

set arg_result=0
IF %arg_count% lss %args% set arg_result=1
IF %arg_count% gtr %args% set arg_result=1

IF %arg_result% equ 1 (
    echo Usage: %0 original_file new_file
    EXIT /B 1
  )

::If the new file already exists then it will delete it.
IF EXIST %new_file% (
  ::echo Deleting %new_file%
  del /f %new_file%
  )

for /f "tokens=*" %%x in (%original_file%) do (
  echo %%x%string% >> %new_file%
  )

IF EXIST %new_file% (
  ::echo Deleting %new_file%
  echo %new_file% has been created.
) ELSE (
  echo string input error %new_file% was not created. Make sure to escape special characters.
)
