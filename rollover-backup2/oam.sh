#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/run/media/mmcblk1p4/lib
ulimit -q unlimited
ulimit -c unlimited
#rm -rf AlarmLog* *.bin *log* core*
BIN=./gnb_cu_oam ../cfg/Proprietary_gNodeB_CU_Data_Model.xml ../cfg/TR196_gNodeB_CU_Data_Model.xml
CMD="./$BIN"
FIFO_DEV=/dev/${BIN}logfifo
mkfifo "$FIFO_DEV"
./readlog.sh < "${FIFO_DEV}" &
CMD="$CMD > $FIFO_DEV 2>&1"
eval "$CMD"

