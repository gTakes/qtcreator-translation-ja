# Qt Creator の日本語翻訳ファイル
<div style="text-align:right">Language: <a href="README.md">English</a> | <i>日本語</i></div>

## Qt Creator 4.4.1 以降を対象
Qt Creator の日本語翻訳ファイルです。バージョン 4.4.1 以降の Qt Creator を対象としています。

## これを作成した理由
ある時、これまで使用していた古い Qt Creatorを新しいバージョン（おそらく4.4.0）へ移行しました。  
すると、起動した際のウィジェット（ウェルカム画面）の一部の文字が日本語表示になっておらず、英語のままであること
に気付きました。（例えば、「Session」、「Open Project」、「Recent Projects」、「Get Started Now」やその他） 
Qt Creator を使用するのには支障はないのですが、メニューやボタンなどに日本語と英語が混在して表示されるのは気になります。（個人的感覚ですが、、、。）  
Github上の Qt Creator のレポジトリを確認すると、日本語翻訳ファイルが１年は更新されていないことがわかりました。そしてドイツ語の翻訳ファイルも同様に更新されていないようです。  
おそらく、日本語の翻訳ファイルはドイツ語の翻訳ファイルを元に更新されているでは、と考えました。（READMEにテンプレートはドイツ語のものを元に作るような記述がありましたので。）   
そこで、勉強がてら自分で翻訳ファイルを更新することにしました。

*私は英語に精通しているわけではないので、誤訳や合わない表現を使用している可能性があります。もし気付いた点があった際に、ご報告いただければ幸いです。*

## このリポジトリのディレクトリとファイル
* *translations*  &emsp;&raquo;&raquo; 翻訳ファイルを内包しているディレクトリ
    * ABOUT.md  &emsp;&raquo;&raquo; 簡易説明文 
    * **qtcreator_ja.qm**  &emsp;&raquo;&raquo; Qt Creator で使用される翻訳ファイル
    * **qtcreator_ja.ts**  &emsp;&raquo;&raquo; 人が使用する翻訳ファイル
* qtvars.bat  &emsp;&raquo;&raquo; MSVC and Qt のビルド環境を設定するバッチファイル
* qtvars.lnk  &emsp;&raquo;&raquo; cmd.exe で `qtvars.bat` を開くための Windowsショートカット(アイコン)
* qtvars_ja.bat  &emsp;&raquo;&raquo; MSVC and Qt のビルド環境を設定するバッチファイル (日本語メッセージ表示)
* qtvars_ja.lnk  &emsp;&raquo;&raquo; cmd.exe で `qtvars_ja.bat` を開くための Windowsショートカット(アイコン)
* README.md  &emsp;&raquo;&raquo; このファイル

### **注意:&emsp;以下の説明は Windows と MSVC 環境を前提としています。**

## 翻訳ファイルの使い方

Qt 5.9 をインストールしている場合、 Qt Creator は通常次のパスへインストールされています: `C:\Qt\Tools\QtCreator`  
ここではこのパスを `<QT_CREATOR_DIR>` としています。

1. このリポジトリから `translations/qtcreator_ja.qm` をダウンロードします。
2. ダウンロードしたファイル `qtcreator_ja.qm` を  `<QT_CREATOR_DIR>\share\qtcreator\translations` ディレクトリへコピーまたは移動します。
3. Qt Creator を起動します。ボタン、メニュー、その他が日本語表記になります。

## "qtcreator_ja.ts" ファイルの更新 (任意)
ここでは、使用している Qt Creator の バージョン用の翻訳ファイルを更新する手順を説明します。 

使用しているPCに `Git` がインストールされていない場合は、 [https://git-scm.com/download/]() からダウンロードしてインストールしてください。

1. スタートメニューのグループ `Git` から "`Git CMD`" (または "`Git Bash`") を起動します。 
2. QtCreator の翻訳用にディレクトリを作成します。
ここでは、 `C:\Develop\QtCreator-Work` とします。  
そして、そのディレクトリへ移動します。
    ``` sh
    > mkdir C:\Develop\QtCreator-Work
    > cd C:\Develop\QtCreator-Work
    ```
3. 次のGitコマンドを入力します： `git clone https://github.com/qt-creator/qt-creator.git`
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
    "`qt-creator`" が作成されます。

4. `qt-creator` ディレクトリへ移動し、タグの一覧を確認して希望するバージョンへ切り替えます。
    ``` sh
    > cd qt-creqtor
    > git tag
    at-v3.4.0
    at-v3.4.0-beta1
    ....
    ....
    v4.4.0-rc1
    v4.4.1
    v4.5.0-beta1
    ```
    v4.4.1へ切り替える場合は次のようにします。
    ``` sh
    > git checkout refs/tags/v4.4.1
    ```
    切り替え後は、一つ上のディレクトリへ移動しておきます。
    ``` sh
    > cd ..\
    ```

5. シャドウビルド用に "`build`" ディレクトリを作り、移動します。
    ``` sh
    > mkdir build
    > cd build

6. MSVC のビルド環境を設定します。 (環境に合わせてください。ここでは64ビット用に設定しています。)
    ``` sh
    > "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64
    ```
7. 検索パスに `qmake.exe` を含めるようにします。(環境に合わせてください。)
    ``` sh
    > set PATH=C:\Qt\5.9\msvc2015_64\bin;%PATH%
    ```
8. `Makefile` を生成するために、`qmake.exe` を "..\qt-creator\share\qtcreator\translations" の引数で起動します。 
    ``` sh
    > qmake ..\qt-creator\share\qtcreator\translations
    ```
9. すでに翻訳ファイルを持っていて、それを元に更新したい場合は、その "`qtcreator_ja.ts`" を "`<QtCreator-Work>\qt-creator\share\qtcreator\translations`" へコピーします。

10. これで更新準備が整いました。 次のコマンドで更新をかけます: `nmake ts-ja`
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
11. ディレクトリ"`<QtCreator-Work>\qt-creator\share\qtcreator\translations`"の翻訳ファイル（`qtcreator_ja.ts`）が更新されます。  
**注意:&ensp;".ts" はビルドディレクトリ内には生成されません。**  
Linguist または 使い慣れたエディタで "qtcreator_ja.ts" を開き、翻訳することができます。  
翻訳完了後は、メニューから [ファイル]  &raquo; [リリース] (Linguist を使用している場合) を選ぶか、`lrelease qtcreator_ja.ts` コマンドで".qm" を 生成してください。 

