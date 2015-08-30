iTCSRTotalizer
==============

iTCのSalesReportから合計を求める

#使い方
iTCからレポートファイルをダウンロードし解凍して置いている事を前提とする

##設定指定

extract.sh の以下を指定する

    REPORT_DIR="レポートファイルフォルダへの相対パス"
    VENDOR_ID="ベンダーID"

##実行

`extract.sh [YYYYMMDD]...`

###パラメタ
* *YYYYMMDD* : レポートファイルの日付

#実行例

2014/3/30-2014/5/3の期間で算出する場合

` ./extract.sh 20140406 20140413 20140420 20140427 20140504`

期間についてはAppleの Finance Calendar を参照のこと