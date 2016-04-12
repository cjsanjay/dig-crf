#!/usr/bin/env python

"""This program will use Apache Spark to read a keyed JSON Lines file (such as
adjudicated_modeled_live_eyehair_100.kjsonl), convert it to a pair RDD,
process it with CRF++, and print detected attributes as pair RDD keyed JSON
files, formatted to Karma's liking. The keys in the input file will be passed
through to the output file, but the text and tokens will not.

"""

import argparse
import sys
from pyspark import SparkContext
import applyCrf

def main(argv=None):
    '''this is called if run from command line'''
    parser = argparse.ArgumentParser()
    parser.add_argument('-d','--debug', help="Optionallly give debugging feedback.", required=False, action='store_true')
    parser.add_argument('--download', help="Optionally ask Spark to download the feature list and model files to the clients.", required=False, action='store_true')
    parser.add_argument('-f','--featlist', help="Required input file with features to be extracted, one feature entry per line.", required=True)
    parser.add_argument('-i','--input', help="Required input file with Web scraping sentences in keyed JSON Lines format.", required=True)
    parser.add_argument('-m','--model', help="Required input model file.", required=True)
    parser.add_argument('-o','--output', help="Required output file of phrases in keyed JSON Lines format.", required=True)
    parser.add_argument('-p','--partitions', help="Optional number of partitions.", required=False, type=int, default=1)
    parser.add_argument('-s','--statistics', help="Optionally report use statistics.", required=False, action='store_true')
    args = parser.parse_args()

    if args.debug:
        print "Starting applyCrfPjSparkTest."

    sc = SparkContext()

    featlist = args.featlist
    model = args.model
    if args.download:
        # Ask Spark to download the feature list and model files from the driver to the clients.
        sc.addFile(featlist)
        sc.addFile(model)

    inputLinesRDD = sc.textFile(args.input, args.partitions)
    inputPairsRDD = inputLinesRDD.map(lambda s: s.split('\t', 1))
    tagger = applyCrf.ApplyCrfPj(featlist, model, args.debug, args.statistics)
    tagger.setDownload(args.download)
    resultsRDD = tagger.perform(inputPairsRDD)
    resultsRDD.saveAsTextFile(args.output)
    if args.debug:
        print "Ending applyCrfPjSparkTest."

# call main() if this is run as standalone
if __name__ == "__main__":
    sys.exit(main())
