@echo off
echo "assume officialwinsha512 filename is not used in this dir."
set oripath="%cd%"
cd %oripath%
echo "hashcheck">"%outerpath%\officialwinsha512"
FOR %%G IN (*) do CertUtil -hashfile "%%G" SHA512>>"%oripath%\officialwinsha512"
