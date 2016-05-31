#! /bin/bash                                                                                           

DUMP6FILE=/user/worker/hbase-dump-2015-10-01-2015-12-01-aman/webpage
KEY_TO_EXTRACT=description
OUTFILE=/user/crogers/hbase-dump-2015-10-01-2015-12-01-aman-webpage-descriptions-tokens.seq

# Dangerous!
echo "Clearing the output folder: ${OUTFILE}"
hadoop fs -rm -r -f ${OUTFILE}

echo "Submitting the job to the Memex cluster."
time spark-submit \
    --master 'yarn-client' \
    --num-executors 350 \
    --py-files crf_tokenizer.py \
    ./extractAndTokenizeField.py \
    -- \
    --input ${DUMP6FILE} \
    --key ${KEY_TO_EXTRACT} \
    --prune --repartition 350 --cache \
    --count \
    --output ${OUTFILE} \
    --outputSeq
