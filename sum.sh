#!/bin/sh
# $1 : SKU
# $2 : Currency
# ... : CSVのpostfix


# スクリプト自身の名前に.tmpを付けたファイル名でテンポラリ作成
TEMP="${0##*/}.tmp"
if [ -e ${TEMP} ]; then
	rm -f ${TEMP}
else
	touch ${TEMP}
fi

# totaling.shを呼び出して集計用CTVを生成
./totaling.sh ${@:3} | grep $1 | grep $2 | awk 'BEGIN {FS="\t"} {printf("%s\t%s\n"),$3,$4}' > ${TEMP}

# perlのワンライナーで集計
perl -ne 'BEGIN{$t=0;}/^[0-9]+?/ and $t += $_;END{printf("$t\n");}' ${TEMP}


