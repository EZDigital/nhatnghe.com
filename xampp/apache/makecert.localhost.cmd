@echo off
set RANDFILE=.rnd

set OPENSSL_CONF=./conf/openssl-localhost.cnf

echo.
echo ----- Chuan bi tao tin yeu cau ky chung chi CSR 'localhost.csr' cho ten mien localhost
echo ----- va khoa bao mat 'localhost.key' cua no.
echo.
echo ----- Nhan phim bat ky de bat dau.
echo.
pause

bin\openssl req -newkey rsa:4096 -sha256 -nodes -out localhost.csr -outform PEM
bin\openssl rsa -in localhost.key.pem -out localhost.key

echo.
echo ----- Xong phan tao key va CSR cho ten mien localhost.
echo.
echo ----- Nhan phim bat ky de xem va xac nhan thong tin cua file CSR vua tao.
echo.
pause

bin\openssl req -text -noout -verify -in localhost.csr

echo.
echo ----- Neu moi thu deu ok thi nhan phim bat ky de tiep tuc.
echo.
pause

echo.
echo ----- Bat dau dung quyen luc cua CA de chung thuc
echo ----- va cap chung chi SSL cho localhost va cac SAN cua localhost.
echo.
echo ----- Tiep theo ban se nhin thay 2 ket qua tra ve lien tuc nhu sau:
echo.
echo ----- Sign the certificate? [y/n]:
echo.
echo ----- 1 out of 1 certificate requests certified, commit? [y/n]
echo.
echo ----- Ca 2 lan deu go phim y va nhan Enter de xac nhan.
echo.
echo ----- Bay gio thi nhan phim bat ky de tiep tuc qua trinh.
echo.
pause

if not exist index.txt type nul > index.txt
if not exist index.txt.attr type nul > index.txt.attr
if not exist serial.txt type nul > serial.txt
if not exist serial.txt.attr type nul > serial.txt.attr
echo 01> serial.txt

set OPENSSL_CONF=./conf/openssl-ca.cnf
bin\openssl ca -policy signing_policy -extensions signing_req -out localhost.pem -infiles localhost.csr
bin\openssl x509 -in localhost.pem -out localhost.crt

echo.
echo ----- CA da xac nhan xong chung chi cua ban.
echo.
echo ----- Nhan phim bat ky de xac nhan lai thong tin co trong chung chi ma CA vua ky.
echo.
pause

bin\openssl x509 -in localhost.pem -text -noout

echo.
echo ----- Toi day ma khong thay co loi gi thi xem nhu da thanh cong!
echo.
echo ----- Nhan phim bat ky de bat dau don rac da phat sinh trong qua trinh thuc thi.
echo.
pause

set OPENSSL_CONF=
move /y localhost.csr .\conf\ssl.csr
move /y localhost.crt .\conf\ssl.crt
move /y localhost.pem .\conf\ssl.pem
move /y localhost.key.pem .\conf\ssl.key
move /y localhost.key .\conf\ssl.key

if exist .rnd del .rnd
if exist 01.pem del 01.pem
if exist index.txt.attr del index.txt.attr
if exist index.txt.attr.old del index.txt.attr.old
if exist index.txt.old del index.txt.old
if exist index.txt del index.txt
if exist serial.txt.attr.old del serial.txt.attr.old
if exist serial.txt.attr del serial.txt.attr
if exist serial.txt.old del serial.txt.old
if exist serial.txt del serial.txt

echo.
echo ----- Chung chi SSL cua ban da duoc tao - Your certificate was created.
echo.
echo ----- Chung Chi SSL cua ban da duoc chung thuc va cap phat boi CA - The certificate was provided by CA.
echo.
echo ----- EZ Digital - www.ezdigital.net
echo.
pause
