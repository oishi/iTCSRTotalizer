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
if [ ${2} = "ALL" ]; then
	./extract.sh ${@:3} | grep $1 | awk 'BEGIN {FS="\t"} {printf("%s\t%s\n"),$3,$4}' > ${TEMP}
else
	./extract.sh ${@:3} | grep $1 | grep $2 | awk 'BEGIN {FS="\t"} {printf("%s\t%s\n"),$3,$4}' > ${TEMP}
fi

# perlのワンライナーで集計
perl -ne 'BEGIN{$t=0;$p=0;}/^([0-9]+?)\t([0-9\.]*)/ and $t += $1; $p += $2;END{printf("Unit=$t, Proceed=$p\n");}' ${TEMP}

# 後始末
if [ -e ${TEMP} ]; then
	rm -f ${TEMP}
fi