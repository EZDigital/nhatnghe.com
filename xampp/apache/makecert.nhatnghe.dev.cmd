@echo off
set RANDFILE=.rnd

set OPENSSL_CONF=./conf/openssl-nhatnghe.dev.cnf

echo.
echo ----- Chuan bi tao tin yeu cau ky chung chi CSR 'nhatnghe.dev.csr' cho ten mien nhatnghe.dev
echo ----- va khoa bao mat 'nhatnghe.dev.key' cua no.
echo.
echo ----- Nhan phim bat ky de bat dau.
echo.
pause

bin\openssl req -newkey rsa:4096 -sha256 -nodes -out nhatnghe.dev.csr -outform PEM
bin\openssl rsa -in nhatnghe.dev.key.pem -out nhatnghe.dev.key

echo.
echo ----- Xong phan tao key va CSR cho ten mien nhatnghe.dev.
echo.
echo ----- Nhan phim bat ky de xem va xac nhan thong tin cua file CSR vua tao.
echo.
pause

bin\openssl req -text -noout -verify -in nhatnghe.dev.csr

echo.
echo ----- Neu moi thu deu ok thi nhan phim bat ky de tiep tuc.
echo.
pause

echo.
echo ----- Bat dau dung quyen luc cua CA de chung thuc
echo ----- va cap chung chi SSL cho nhatnghe.dev va cac SAN cua nhatnghe.dev.
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
echo 127128129001> serial.txt

set OPENSSL_CONF=./conf/openssl-ca.cnf
bin\openssl ca -policy signing_policy -extensions signing_req -out nhatnghe.dev.pem -infiles nhatnghe.dev.csr
bin\openssl x509 -in nhatnghe.dev.pem -out nhatnghe.dev.crt

echo.
echo ----- CA da xac nhan xong chung chi cua ban.
echo.
echo ----- Nhan phim bat ky de xac nhan lai thong tin co trong chung chi ma CA vua ky.
echo.
pause

bin\openssl x509 -in nhatnghe.dev.pem -text -noout

echo.
echo ----- Toi day ma khong thay co loi gi thi xem nhu da thanh cong!
echo.
echo ----- Nhan phim bat ky de bat dau don rac da phat sinh trong qua trinh thuc thi.
echo.
pause

set OPENSSL_CONF=
move /y nhatnghe.dev.csr .\conf\ssl.csr
move /y nhatnghe.dev.pem .\conf\ssl.pem
move /y nhatnghe.dev.key.pem .\conf\ssl.key
move /y nhatnghe.dev.key .\conf\ssl.key
move /y nhatnghe.dev.crt .\conf\ssl.crt

if exist .rnd del .rnd
if exist 127128129001.pem del 127128129001.pem
if exist index.txt.attr del index.txt.attr
if exist index.txt.attr.old del index.txt.attr.old
if exist index.txt.old del index.txt.old
if exist index.txt del index.txt
if exist serial.txt.attr.old del serial.txt.attr.old
if exist serial.txt.attr del serial.txt.attr
if exist serial.txt.old del serial.txt.old
if exist serial.txt del serial.txt

if not exist ..\htdocs\nhatnghe.dev mkdir ..\htdocs\nhatnghe.dev
if not exist ..\htdocs\nhatnghe.dev\index.html echo Hello Nhat Nghe! >..\htdocs\nhatnghe.dev\index.html

echo.
echo ----- Chung chi SSL cua ban da duoc tao - Your certificate was created.
echo.
echo ----- Chung Chi SSL cua ban da duoc chung thuc va cap phat boi CA - The certificate was provided by CA.
echo.
echo ----- EZ Digital - www.ezdigital.net
echo.
pause
