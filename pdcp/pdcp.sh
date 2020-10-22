#./gnb_cu_pdcp --r=2 --a=0 --t=0 --m=0 --i=0 --S=4 2>&1 | tee CU.log

#./gnb_cu_pdcp --r=57 --a=59 --t=59 --m=61 --S=63 --i=0 2>&1 | tee CU_$(date +%Y%m%d_%H%M%S).log
BIN=./gnb_cu_pdcp --r=2 --a=0 --t=0 --m=0 --i=0 --S=4
CMD="./$BIN"
FIFO_DEV=/dev/${BIN}logfifo
mkfifo "$FIFO_DEV"
./readlog.sh < "${FIFO_DEV}" &
CMD="$CMD > $FIFO_DEV 2>&1"
eval "$CMD"

