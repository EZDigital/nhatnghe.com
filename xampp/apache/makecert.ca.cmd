@echo off
set RANDFILE=.rnd 
set OPENSSL_CONF=./conf/openssl-ca.cnf

if not exist .\conf\ssl.ca mkdir .\conf\ssl.ca
if not exist .\conf\ssl.key mkdir .\conf\ssl.key
if not exist .\conf\ssl.csr mkdir .\conf\ssl.csr
if not exist .\conf\ssl.pem mkdir .\conf\ssl.pem

bin\openssl req -x509 -newkey rsa:4096 -sha256 -nodes -out cacert.pem -days 3650 -outform PEM
bin\openssl x509 -in cacert.pem -out cacert.crt
bin\openssl rsa -in cakey.pem -out ca.key

set OPENSSL_CONF=
move /y cacert.pem .\conf\ssl.ca
move /y cacert.crt .\conf\ssl.ca
move /y cakey.pem .\conf\ssl.ca
move /y ca.key .\conf\ssl.ca
del .rnd

echo.
echo Chung nhan CA cua ban da duoc tao - Your CA certificate was created.
echo.
echo Chung nhan CA cua ban da duoc cap phat - The certificate was provided.
echo.
echo ----- EZ Digital - www.ezdigital.net
echo.
pause
