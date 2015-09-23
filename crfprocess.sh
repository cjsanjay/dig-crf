/usr/lib/spark/bin/spark-submit \
--py-files crfprocess.zip \
--files eyeColor_config.txt,eyeColor_reference_wiki.txt,hairColor_config.txt,hairColor_reference_wiki.txt,hairText_config.txt,hairTexture_reference_wiki.txt,crf_test_filter.sh,crf_test \
--master yarn-client \
--driver-memory 8g \
--executor-memory 8g \
--num-executors 20 \
  crfprocess.py \
  $@