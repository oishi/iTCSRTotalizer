#!/bin/sh
REPORT_DIR="reports"
VENDOR_ID="80071992"



# 必要な列だけ抽出し合計を取る
# 3列目 : SKU
# 8列目 : Units
YM="${1}"
TITLE="${2}"
FILE="${REPORT_DIR}/monthly/S_M_${VENDOR_ID}_${YM}.txt"

if [ -e ${FILE} ]; then
	echo ${YM} ${TITLE}
	awk 'BEGIN {FS="\t"} {if($7=="1F" || $7=="F1" || $7=="1") printf("%s\t%s\n"),$3,$8}' ${FILE} | grep ${TITLE} | awk '{m+=$2} END {print m;}'
else
	echo "not found ${FILE}"
fi


