#! /bin/bash                                                                                           

DUMP6FILE=/user/worker/hbase-dump-2015-10-01-2015-12-01-aman/webpage
KEY_TO_EXTRACT=description
NEW_RDD_KEY_KEY=url
OUTFILE=/user/crogers/hbase-dump-2015-10-01-2015-12-01-aman-webpage-descriptions.seq

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
    --newRddKeyKey ${NEW_RDD_KEY_KEY} \
    --notokenize --prune --repartition 700 --cache \
    --count \
    --output ${OUTFILE} \
    --outputSeq