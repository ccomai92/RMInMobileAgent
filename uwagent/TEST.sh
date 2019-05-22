#! /bin/bash


java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent P 1 cssmpi1 4 who ls ps df;
java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent P 2 cssmpi1 cssmpi2 4 who ls ps df;
java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent P 3 cssmpi1 cssmpi2 cssmpi3 4 who ls ps df;

java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent P 1 cssmpi1 12 who ls ps df who ls ps df who ls ps df;
java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent P 2 cssmpi1 cssmpi2 12 who ls ps df who ls ps df who ls ps df;
java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent P 3 cssmpi1 cssmpi2 cssmpi3 12 who ls ps df who ls ps df who ls ps df;

java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent C 1 cssmpi1 1 grep\ -o\ 123\ ../files/text1.txt;
java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent C 2 cssmpi1 cssmpi2 1 grep\ -o\ 123\ ../files/text1.txt;
java -cp UWAgent.jar:. UWAgent.UWInject -p $1 localhost UnixAgent C 3 cssmpi1 cssmpi2 cssmpi3 1 grep\ -o\ 123\ ../files/text1.txt;

