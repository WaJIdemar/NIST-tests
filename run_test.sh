#!/bin/bash

make 1>>/dev/null 2>>/dev/null

echo "Generate bytes"

python3 generate.py

echo "Test My Generator"

./assess 100000 < run_my_gen.txt >> /dev/null

echo "Test My Generator" > result.txt
echo "" >> result.txt

cat experiments/AlgorithmTesting/finalAnalysisReport.txt >> result.txt

echo "Test Mersenne Twister"

./assess 100000 < run_mt_gen.txt >> /dev/null

echo "" >> result.txt
echo "Test Mersenne Twister" >> result.txt
echo "" >> result.txt

cat experiments/AlgorithmTesting/finalAnalysisReport.txt >> result.txt
