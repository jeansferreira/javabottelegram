#!/bin/bash

while [ true ]; do

printf "Monitoramento da Integração SSPRS\n"

MSG_SSPRS_INT=`ssh -p 2223 root@localhost "grep -i ERROR /axs/traces/Kettle_SSPRS_JOB_CARGA_INTEGRADOS.log"`
MSG_SSPRS_INF=`ssh -p 2223 root@localhost "grep -i ERROR /axs/traces/Kettle_SSPRS_JOB_CARGA_INFOPEN.log"`
MSG_SSPRS_PER_PDC=`ssh -p 2223 root@localhost "grep -i ERROR /axs/traces/Kettle_SSPRS_JOB_CARGA_PERICIAS_PDC.log"`
MSG_SSPRS_PER_CPE=`ssh -p 2223 root@localhost "grep -i ERROR /axs/traces/Kettle_SSPRS_JOB_CARGA_PERICIAS_CPE.log"`
MSG_SSPRS_DET=`ssh -p 2223 root@localhost "grep -i ERROR /axs/traces/Kettle_SSPRS_JOB_CARGA_DETRAN.log"`
MSG_SSPRS_AIS=`ssh -p 2223 root@localhost "grep -i ERROR /axs/traces/Kettle_SSPRS_JOB_CARGA_AIS.log"`
MSG_SSPRS_TRO_DOC=`ssh -p 2223 root@localhost "grep -i ERROR /axs/traces/Kettle_SSPRS_JOB_CARGA_TROCA_DOC_DGT.log"`

printf "$MSG_SSPRS_INT"
printf "$MSG_SSPRS_INF"
printf "$MSG_SSPRS_PER_PDC"
printf "$MSG_SSPRS_PER_CPE"
printf "$MSG_SSPRS_DET"
printf "$MSG_SSPRS_AIS"
printf "$MSG_SSPRS_TRO_DOC"

if [ "x$MSG_SSPRS_INT" != "x" ]; then
    java -jar TBDTelegramBotDGT.jar 557067389:AAEFjAGY9yKMj-XmTnpN6WYd5qRYvCxTx24 "Erro no JOB: CARGA_INTEGRADOS - SSPRS"		

fi

if [ "x$MSG_SSPRS_INF" != "x" ]; then
    java -jar TBDTelegramBotDGT.jar 557067389:AAEFjAGY9yKMj-XmTnpN6WYd5qRYvCxTx24 "Erro no JOB: CARGA_INFOPEN - SSPRS"

fi

if [ "x$MSG_SSPRS_PER_PDC" != "x" ]; then
    java -jar TBDTelegramBotDGT.jar 557067389:AAEFjAGY9yKMj-XmTnpN6WYd5qRYvCxTx24 "Erro no JOB: CARGA_PERICIAS_PDC - SSPRS"

fi

if [ "x$MSG_SSPRS_PER_CPE" != "x" ]; then
    java -jar TBDTelegramBotDGT.jar 557067389:AAEFjAGY9yKMj-XmTnpN6WYd5qRYvCxTx24 "Erro no JOB: CARGA_PERICIAS_CPE - SSPRS"

fi

if [ "x$MSG_SSPRS_DET" != "x" ]; then
    java -jar TBDTelegramBotDGT.jar 557067389:AAEFjAGY9yKMj-XmTnpN6WYd5qRYvCxTx24 "Erro no JOB: CARGA_DETRAN - SSPRS"

fi

if [ "x$MSG_SSPRS_AIS" != "x" ]; then
    java -jar TBDTelegramBotDGT.jar 557067389:AAEFjAGY9yKMj-XmTnpN6WYd5qRYvCxTx24 "Erro no JOB: CARGA_AIS - SSPRS"

fi

if [ "x$MSG_SSPRS_TRO_DOC" != "x" ]; then
    java -jar TBDTelegramBotDGT.jar 557067389:AAEFjAGY9yKMj-XmTnpN6WYd5qRYvCxTx24 "Erro no JOB: CARGA_TROCA_DOC - SSPRS"

fi

sleep 90


done
