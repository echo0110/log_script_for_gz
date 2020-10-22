#BIN=gnb_tr069nxp
#CMD="./$BIN -p ../cfg/tr069 -c ../cfg/tr069/certs/cert.pem -k ../cfg/tr069/private/key.pem -i em3"
BIN=gnb_tr069nxp
CMD="./$BIN"
FIFO_DEV=/dev/${BIN}logfifo
mkfifo "$FIFO_DEV"
#./readlog.sh < "${FIFO_DEV}" "./gnb_tr069.log" &
./readlog.sh < "${FIFO_DEV}" &
CMD="$CMD > $FIFO_DEV 2>&1"
eval "$CMD"

