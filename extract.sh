#!/bin/sh
. config

# テンポラリ作成
TEMP="temp"
if [ -e ${TEMP} ]; then
	rm -f ${TEMP}
else
	touch ${TEMP}
fi


# CSVから必要な列だけ抽出する
# 3列目 : SKU
# 5列目 : Title
# 8列目 : Units
# 9列目 : Developer Proceeds
# 12列目 : Customer Currency
for file in $*
do
	CSV="${REPORT_DIR}/S_W_${VENDOR_ID}_${file}.csv"

	if [ -e ${CSV} ]; then
		awk 'BEGIN {FS="\t"} $9 != 0 {printf("%s\t%s\t%s\t%s\t%s\n"),$3,$5,$8,$9,$12}' ${CSV} | grep -v '^SKU' >> ${TEMP}
	else
		echo "not found ${CSV}"
	fi
done


# 並び替え
cat ${TEMP} | sort


# 後始末
if [ -e ${TEMP} ]; then
	rm -f ${TEMP}
fi