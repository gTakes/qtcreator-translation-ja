# Qt Creator's Japanese translation file
<div style="text-align:right">Language: <i>English</i> | <a href="README_JA.md">日本語</a></div>

## For Qt Creator 4.4.1 and later
These are translation files of Qt Creator for Japanese. 
These translated files are for Qt Creator versions 4.4.1 and later.  
&emsp;&raquo; 2018-06-20: Updated for Qt Creator 4.6.2  
&emsp;&raquo; 2018-06-19: Updated for Qt Creator 4.6.0  
&emsp;&raquo; 2017-12-28: Updated for Qt Creator 4.5.0 

## Reason for deciding to create these
I switched from the old version of Qt Creator I used to a new version  (probably 4.4.0).  
I usually use Qt Creator in Japanese environment, but I noticed that some letters in the widget (welcome screen) are still in English notation. For example, "Session", "Open Project", "Recent Projects", "Get Started Now" and more.  
Of course, they are not going to interfere with using Qt Creator. However, there is a sense of incongruity in the display in which Japanese and English are mixed in buttons, menus, etc., it is certain to be worrisome.  
I saw the Qt Creator's repository on Github and found that the Japanese translation file has not been updated for 1 year. 
I also noticed that the German translation file has not been updated for the same period. 
I thought that the Japanese translation file were based on updates of the German translation file.  
So, I decided to update the translation file by myself.  

*The translated file might contain mistranslation or an incomprehensible translation because I am not familiar with English. 
I would be happy if you let me know what you noticed me.*

## Directory and Files in this repository
* *translations*  &emsp;&raquo;&raquo; Directory containing translation files
    * ABOUT.md  &emsp;&raquo;&raquo; Simple description 
    * **qtcreator_ja.qm**  &emsp;&raquo;&raquo; Translation file used by Qt Creator
    * **qtcreator_ja.ts**  &emsp;&raquo;&raquo; Translation file usually used by humans
* qtvars.bat  &emsp;&raquo;&raquo; A batch file that sets the build environment of MSVC and Qt
* qtvars.lnk  &emsp;&raquo;&raquo; Windows shortcut(icon) for cmd.exe to open `qtvars.bat`
* qtvars_ja.bat  &emsp;&raquo;&raquo; A batch file that sets the build environment of MSVC and Qt (showing Japanese messages)
* qtvars_ja.lnk  &emsp;&raquo;&raquo; Windows shortcut(icon) for cmd.exe to open `qtvars_ja.bat`
* README.md  &emsp;&raquo;&raquo; This file

### **Note:&emsp;The following description assumes Windows and MSVC environment.**

## How to use translation file

If you have installed Qt 5.9, Qt Creator was normally installed by default in the following location: `C:\Qt\Tools\QtCreator`  
I will write this location as `<QT_CREATOR_DIR>`.

1. Download `translations/qtcreator_ja.qm` from this repository.
2. Copy or move the downloaded file `qtcreator_ja.qm` to the diretory `<QT_CREATOR_DIR>\share\qtcreator\translations`.
3. Launch Qt Creator, you can see that buttons, menus and others are in Japanese notation.

## Update "qtcreator_ja.ts" file (Optionaly)
Here is the procedure for updating the translation file of the version of Qt Creator that you are using.  

If `Git` is not installed on your PC, download it from [https://git-scm.com/download/]() and install it.

1. Launch "`Git CMD`" (or "`Git Bash`") from group of `Git` in Start Menu. 
2. Create working directory for translation of Qt Creator. 
In this case, make it a directory `C:\Develop\QtCreator-Work`.  
Then change directory created it.
    ``` sh
    > mkdir C:\Develop\QtCreator-Work
    > cd C:\Develop\QtCreator-Work
    ```
3. Type Git command: `git clone https://github.com/qt-creator/qt-creator.git`
    ``` sh
    > git clone https://github.com/qt-creator/qt-creator.git
    Cloning into 'qt-creator'...
    remote: Counting objects: 632722, done.
    remote: Compressing objects: 100% (184/184), done.
    remote: Total 632722 (delta 137), reused 129 (delta 72), pack-reused 632466 eceiving objects: 100% (632722/632722), 287.16 MiB | 8.72 MiB/s
    Receiving objects: 100% (632722/632722), 288.12 MiB | 8.99 MiB/s, done.
    Resolving deltas: 100% (530310/530310), done.
    Checking out files: 100% (10367/10367), done.
    >
    ```
    Now, "`qt-creator`" directory is created.

4. Change directory to `qt-creator` and get the tag list. Then switch to your version.
    ``` sh
    > cd qt-creqtor
    > git tag
    at-v3.4.0
    at-v3.4.0-beta1
    ....
    ....
    v4.4.0-rc1
    v4.4.1
    v4.5.0
    v4.5.0-beta1
    v4.5.0-rc1
    ```
    If your version is v4.5.0, use the following Git command.
    ``` sh
    > git checkout refs/tags/v4.5.0
    ```
    After switched your version, change the directory up one.
    ``` sh
    > cd ..\
    ```
5. Create a directory "`build`" for shadow build and change directory to it.
    ``` sh
    > mkdir build
    > cd build

6. Set MSVC build environment. (Adjust to your environment)
    ``` sh
    > "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64
    ```
7. Include qmake.exe in the search path. (Adjust to your environment)
    ``` sh
    > set PATH=C:\Qt\5.9\msvc2015_64\bin;%PATH%
    ```
8. Run `qmake.exe` with "..\qt-creator\share\qtcreator\translations" to generate `Makefile`. 
    ``` sh
    > qmake ..\qt-creator\share\qtcreator\translations
    ```
9. If you want to update based on the already existing your translation file "`qtcreator_ja.ts`", copy that file to "`<QtCreator-Work>\qt-creator\share\qtcreator\translations`".

10. You are now ready to update. Type the following command: `nmake ts-ja`
    ``` sh
    > nmake ts-ja
    ......
    ......
    Updating 'share/qtcreator/translations/qtcreator_ja.ts'...
    Found 9886 source text(s) (1961 new and 7925 already existing)
    Kept 1255 obsolete entries
    Number heuristic provided 9 translation(s)
    Same-text heuristic provided 791 translation(s)

    >
    ```
11. The updated translation file is in the dictionary "`<QtCreator-Work>\qt-creator\share\qtcreator\translations`".  
**Note:&ensp;".ts" file is not generated in the build directory.**  
You can translate to open "qtcreator_ja.ts" with Linguist or your favorite editor.  
After the translation is completed, create ".qm" file with to  chose menu [File]  &raquo; [Release] (when using Linguist) or with the following command: `lrelease qtcreator_ja.ts`
