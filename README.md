iTCSRTotalizer
==============

iTCのSalesReportから合計を求める

#使い方
iTCからレポートファイルをダウンロードし解凍して置いている事を前提とする

##configを作成

以下の2変数を記述したconfigファイルを作成

    REPORT_DIR="レポートファイルのパス"
    VENDOR_ID="ベンダーID"

##実行

`sum.sh [SKU] [Currency] [YYYYMMDD]...`

###パラメタ
* *SKU* : アプリやアプリ内課金のSKU
* *Currency* : 通貨識別子(日本円ならJPY、米ドルならUSD)。ALLはCurrencyを無視して通貨横断的に計算
* *YYYYMMDD* : reportsの拡張子を除くファイル名

#実行例

有償アプリ「そら気温」(SKU=soratemp)の weekly report の 20140302,20140309,20140316,20140323 から日本円(JPY)精算された販売数とそれによる利益合計を出力

` ./sum.sh soratemp JPY 20140302 20140309 20140316 20140323`