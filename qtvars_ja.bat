@echo off
chcp 65001
setlocal enabledelayedexpansion
set BAT_DIR=%~dp0

set VC_DIR="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC"
set QT_BIN_DIR=C:\Qt\5.9\msvc2015_64\bin

set IS_NMAKE_ENABLED=0
call %VC_DIR%\vcvarsall.bat amd64
where nmake.exe
if %ERRORLEVEL% == 0 (
	set IS_NMAKE_ENABLED=1
	echo "nmake.exe" が見つかりました。
)

set IS_QMAKE_ENABLED=0
set PATH=%QT_BIN_DIR%;%BAT_DIR%qt-creator;%PATH%
where qmake.exe
if %ERRORLEVEL% == 0 (
	set IS_QMAKE_ENABLED=1
	echo "qmake.exe" が見つかりました。
)


if %IS_NMAKE_ENABLED% == 0 (	
	echo;
	echo "nmake.exe" が見つかりませんでした。
	if defined VC_DIR (
		echo 次のVCのディレクトリ指定が間違っている可能性があります:
		echo %VC_DIR%
	) else (
		echo VC_DIR は空です。 "nmake.exe" が存在するディレクトリのパスを VC_DIR に設定してください。
	)
)
if %IS_QMAKE_ENABLED% == 0 (
	echo;
	echo Could not find "qmake.exe".
	if defined QT_BIN_DIR (
		echo 次のQtのディレクトリ指定が間違っている可能性があります:
		echo %QT_BIN_DIR%
	) else (
		echo QT_BIN_DIR は空です。 "qmake.exe" が存在するディレクトリのパスを QT_BIN_DIR に設定してください。
	)
)

if %IS_NMAKE_ENABLED% == 1 (
	set RESULT_MESSAGE=MSVC
	if %IS_QMAKE_ENABLED% == 1 (
		set RESULT_MESSAGE=!RESULT_MESSAGE! と Qt
		
	) 
	set RESULT_MESSAGE=!RESULT_MESSAGE! のツールが利用可能になりました。
	
) else (
	if %IS_QMAKE_ENABLED% == 1 (
		set RESULT_MESSAGE=Qt のツールが利用可能になりました。
	)
)

if defined RESULT_MESSAGE (
	echo;
	echo %RESULT_MESSAGE%
)
