#!/bin/sh
./logtranslate --file test_log00.bin 2>&1 | tee test_log00.txt
./logtranslate --file test_log01.bin 2>&1 | tee test_log01.txt
./logtranslate --file test_log02.bin 2>&1 | tee test_log02.txt
./logtranslate --file test_log03.bin 2>&1 | tee test_log03.txt
./logtranslate --file test_log04.bin 2>&1 | tee test_log04.txt
./logtranslate --file test_log05.bin 2>&1 | tee test_log05.txt
./logtranslate --file test_log06.bin 2>&1 | tee test_log06.txt
./logtranslate --file test_log07.bin 2>&1 | tee test_log07.txt
./logtranslate --file test_log08.bin 2>&1 | tee test_log08.txt
./logtranslate --file test_log09.bin 2>&1 | tee test_log09.txt
