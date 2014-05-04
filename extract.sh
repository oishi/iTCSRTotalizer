#!/bin/sh
. config

# テンポラリ作成
TEMP="temp"
if [ -e ${TEMP} ]; then
	rm -f ${TEMP}
else
	touch ${TEMP}
fi


# 必要な列だけ抽出する
# 3列目 : SKU
# 5列目 : Title
# 8列目 : Units
# 9列目 : Developer Proceeds
# 12列目 : Customer Currency
for file in $*
do
	FILE="${REPORT_DIR}/S_W_${VENDOR_ID}_${file}.txt"

	if [ -e ${FILE} ]; then
		awk 'BEGIN {FS="\t"} $9 != 0 {printf("%s\t%s\t%s\t%s\t%s\n"),$3,$5,$8,$9,$12}' ${FILE} | grep -v '^SKU' >> ${TEMP}
	else
		echo "not found ${FILE}"
	fi
done


# 並び替え
cat ${TEMP} | sort


# 後始末
if [ -e ${TEMP} ]; then
	rm -f ${TEMP}
fi