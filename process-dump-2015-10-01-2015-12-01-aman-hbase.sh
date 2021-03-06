#! /bin/bash

# Perform preliminary examinations of the data.  These steps may
# be omitted from a production workflow.
echo ./countRecords-dump-2015-10-01-2015-12-01-aman-hbase.sh
./countRecords-dump-2015-10-01-2015-12-01-aman-hbase.sh \
| tee countRecords-dump-2015-10-01-2015-12-01-aman-hbase.log

echo ./countGoodJson-dump-2015-10-01-2015-12-01-aman-hbase.sh
./countGoodJson-dump-2015-10-01-2015-12-01-aman-hbase.sh \
| tee countGoodJson-dump-2015-10-01-2015-12-01-aman-hbase.log

echo ./countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase.sh
./countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase.sh \
| tee countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase.log

# TODO: Fix this script and its program, they don't work on this dataset.
# echo ./countGoodKeysByPublisher-dump-2015-10-01-2015-12-01-aman-hbase.sh
# ./countGoodKeysByPublisher-dump-2015-10-01-2015-12-01-aman-hbase.sh \
# | tee countGoodKeysByPublisher-dump-2015-10-01-2015-12-01-aman-hbase.log

echo ./extractTitleAndTextAndSaveSeq-dump-2015-10-01-2015-12-01-aman-hbase.sh
./extractTitleAndTextAndSaveSeq-dump-2015-10-01-2015-12-01-aman-hbase.sh \
| tee extractTitleAndTextAndSaveSeq-dump-2015-10-01-2015-12-01-aman-hbase.log

# Perform the critical analysis steps that should be part of the
# production workflow.
echo ./tokenizeTitleAndTextAndSaveSeq-dump-2015-10-01-2015-12-01-aman-hbase.sh
./tokenizeTitleAndTextAndSaveSeq-dump-2015-10-01-2015-12-01-aman-hbase.sh \
| tee tokenizeTitleAndTextAndSaveSeq-dump-2015-10-01-2015-12-01-aman-hbase.log

echo ./applyCrfSjSparkDescMemexHairEyesHj-dump-2015-10-01-2015-12-01-aman-hbase-seq.sh
./applyCrfSjSparkDescMemexHairEyesHj-dump-2015-10-01-2015-12-01-aman-hbase-seq.sh \
| tee applyCrfSjSparkDescMemexHairEyesHj-dump-2015-10-01-2015-12-01-aman-hbase-seq.log

echo ./applyCrfSjSparkDescMemexNameEthnicHj-dump-2015-10-01-2015-12-01-aman-hbase-seq.sh
./applyCrfSjSparkDescMemexNameEthnicHj-dump-2015-10-01-2015-12-01-aman-hbase-seq.sh \
| tee applyCrfSjSparkDescMemexNameEthnicHj-dump-2015-10-01-2015-12-01-aman-hbase-seq.log

# Examine the output of the CRF analyses.  These steps may be omitted
# from a production workflow.

# Analyses without hybrid Jaccard processing:
echo ./applyCrfSjSparkDescMemexHairEyes-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh
./applyCrfSjSparkDescMemexHairEyes-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh \
| tee applyCrfSjSparkDescMemexHairEyes-dump-2015-10-01-2015-12-01-aman-hbase-nourl.log

echo ./applyCrfSjSparkDescMemexNameEthnic-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh
./applyCrfSjSparkDescMemexNameEthnic-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh \
| tee applyCrfSjSparkDescMemexNameEthnic-dump-2015-10-01-2015-12-01-aman-hbase-nourl.log

echo ./countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.sh
./countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.sh \
| tee countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.log

echo ./countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.sh
./countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.sh \
| tee countGoodKeys-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.log

echo ./countCrfResultTokens-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.sh
./countCrfResultTokens-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.sh \
| tee countCrfResultTokens-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.log

echo ./countCrfResultTokens-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.sh
./countCrfResultTokens-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.sh \
| tee countCrfResultTokens-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.log

echo ./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.sh
./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.sh \
| tee countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes.log

echo ./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.sh
./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.sh \
| tee countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic.log

# Analyses with hybrid Jaccard processing:
echo ./applyCrfSjSparkDescMemexHairEyesHj-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh
./applyCrfSjSparkDescMemexHairEyesHj-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh \
| tee applyCrfSjSparkDescMemexHairEyesHj-dump-2015-10-01-2015-12-01-aman-hbase-nourl.log

echo ./applyCrfSjSparkDescMemexNameEthnicHj-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh
./applyCrfSjSparkDescMemexNameEthnicHj-dump-2015-10-01-2015-12-01-aman-hbase-nourl.sh \
| tee applyCrfSjSparkDescMemexNameEthnicHj-dump-2015-10-01-2015-12-01-aman-hbase-nourl.log

echo ./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes-hj.sh
./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes-hj.sh \
| tee countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-hair-eyes-hj.log

echo ./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic-hj.sh
./countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic-hj.sh \
| tee countCrfResultTokensFancy-dump-2015-10-01-2015-12-01-aman-hbase-crf-name-ethnic-hj.log

