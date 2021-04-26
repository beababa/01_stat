#!/bin/sh
for i in *.xls
    do soffice --headless --convert-to csv "$i" 
done
