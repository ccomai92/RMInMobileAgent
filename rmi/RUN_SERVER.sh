#! /bin/bash
rmiregistry 34798 &
java UnixServer $1 34798;
