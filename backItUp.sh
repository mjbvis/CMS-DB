#!/bin/bash

mysqldump -u cms -pTh3.D@t@bas3.P@ssw0rd --skip-extended-insert cms > cms.sql

git commit -am "Updating DB Back up"

git push


