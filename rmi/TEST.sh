#! /bin/bash

java UnixClient P 34798 1 cssmpi1 4 who ls ps df;
java UnixClient P 34798 2 cssmpi1 cssmpi2 4 who ls ps df;
java UnixClient P 34798 3 cssmpi1 cssmpi2 cssmpi3 4 who ls ps df;

java UnixClient P 34798 1 cssmpi1 12 who ls ps df who ls ps df who ls ps df;
java UnixClient P 34798 2 cssmpi1 cssmpi2 12 who ls ps df who ls ps df who ls ps df;
java UnixClient P 34798 3 cssmpi1 cssmpi2 cssmpi3 12 who ls ps df who ls ps df who ls ps df;

java UnixClient C 34798 1 cssmpi1 1 grep\ -o\ 123\ ../files/text1.txt;
java UnixClient C 34798 2 cssmpi1 cssmpi2 1 grep\ -o\ 123\ ../files/text1.txt;
java UnixClient C 34798 3 cssmpi1 cssmpi2 cssmpi3 1 grep\ -o\ 123\ ../files/text1.txt;

java UnixClient P 34798 1 cssmpi1 1 cat\ ../files/text1.txt | grep -o 123 | wc -l;
java UnixClient P 34798 2 cssmpi1 cssmpi2 1 cat\ ../files/text1.txt | grep -o 123 | wc -l;
java UnixClient P 34798 3 cssmpi1 cssmpi2 cssmpi3 1 cat\ ../files/text1.txt | grep -o 123 | wc -l;

