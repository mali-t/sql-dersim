-- dml - data manupulatin lang
-- insert
select * from ogrenciler;

-- bir tabloda tüm veri ekleme
insert into ogrenciler values ('1234','erol evren',80.50,'2020-01-05');

-- bir tabloya parçalı veri eklemek
insert into ogrenciler (id,isim_soyisim);

create table tedarikciler
(
tedarikci_id int unique, --veride iki değerin aynı olmasını engeller
tedarikci_isimleri varchar(30),
tedarikci_adres varchar(60) not NULL,
	--not null veride belirtilmiş kısmın boş aktarılmasına izin vermez
ulasım_tarihi date
);

create table tedarikci_ziyaret
as
select tedarikci_isimleri,ulasım_tarihi from tedarikciler;

-- iyaret” isminde bir tabloyu  “tedarikciler” tablosundan olusturun.
-- ,,jhjjjedarikci_ismi”, “ulasim_tarihi” field’lari olsun

CREATE TABLE personel
(
id char(10),
isim varchar(50) NOT NULL, --not null veride belirtilmiş kısmın boş aktarılmasına izin vermez
soyisim varchar(50),
email varchar(50),
ise_baslama_tar date,
maas int
) ;
--alttaki işlem olamaz çünkü isim not null

insert into personel(id,soyisim) values(234567822,'karan')

-- Primary Key oluşturma 1. yol
CREATE TABLE ogrenciler4
(
id char(4) PRIMARY KEY,
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);

-- Primary Key oluşturma 2. yol
CREATE TABLE ogrenciler5
(
id char(4) ,
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date,
constraint ogrpk primary key (id)
-- bu yolla yapınc prim keye kendin isim verebiliyon
);

CREATE TABLE tedarikciler2
(
tedarikci_id int,
tedarikci_ismi varchar(20) NOT NULL,
tedarikci_adres varchar(30),
ulasim_tarihi date
);

/*Practice 4:
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,  “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin 
*/
create table tedarikciler3
(
	tedarikci_id char(10) primary key,
	isim varchar(20),
	iletisim_isim varchar(30)
	
);


create table urunler
(
	tedarikci_id char(10),
	urun_id char(10)
	constraint tedarikciler3_pkey FOREIGN KEY (tedarikciler3_pkey) references tedarikciler3(tedarikci_id) ;
);

CREATE TABLE tedarikciler3
(
tedarikci_id char(5) ,
tedarikci_ismi varchar(20),
iletisim_ismi varchar(20),
CONSTRAINT tdrkpk PRIMARY KEY (tedarikci_id)
);
CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(10),
CONSTRAINT tdrkfk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
)
/* 
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”  field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
create table calisanlar
*/

CREATE TABLE calisanlar
(
id char(9) Primary Key,
isim varchar(30) Unique,
maas int not null,
ise_baslama date
)
CREATE TABLE adresler
(
adres_id char(10),
sokak varchar(10),
cadde varchar(10),
sehir varchar(10),
CONSTRAINT adrsfk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
)

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');-- unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- not null
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- not null
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--unique
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--pkey
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--pkey

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar
select * from adresler

--check constrait kullanımı
create table sehirler2 (
alan_kodu int primary key,
isim varchar(20) not null,
nufus int check (nufus>0) 
);
insert into sehirler2 values (123,'erol',-50)-- bu çalışmıycak
select * from sehirler2

--calışanlar tablosundan sadece maaşı 5000 den büyük olanları getir
--olanların isim fieldındaki dataları getir

select isim from calisanlar
select isim from calisanlar where maas > 5000;-- where şart komutudur
select isim from calisanlar where id = '10004'

-- id'si 10004 olan kişinin id,isim ve maas field'larını sorgulayalım
SELECT id,isim,maas FROM calisanlar WHERE id='10004';

CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- ıd si 124 olanı sil
select * from ogrenciler6

delete from ogrenciler6 where 120<id and id<126
delete from ogrenciler6 where isim = 'kemal yasa'
select * from ogrenciler6


(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
white_check_mark
eyes
pray





7:50
CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
 
select * from tedarikci_ziyaret

-- in condition

CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);
DELETE FROM musteriler
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

-- tablodan ürün ismi orange apple palm olan dataları getir
--1. yol
select * from musteriler where urun_isim in('orange','apple','palm')
--2.yol
select * from musteriler WHERE urun_isim= 'orange' or urun_isim= 'palm' OR urun_isim= 'apple'
select * from musteriler WHERE urun_isim= 'Orange' AND musteri_isim='Mark'

--between condition
--urun ıd si20 ile 40 arasında olanları getir
select * from musteriler where urun_id between 20 and 40;
--urun ıd si20 ile 40 arasında olmayanları getir
select * from musteriler where urun_id not between 20 and 40;

CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);
/*
Practice 6
-id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
-D ile Y arasındaki personel bilgilerini listeleyiniz
-D ile Y arasında olmayan personel bilgilerini listeleyiniz
-Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
*/

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
delete from calisanlar2

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

-- çalışan sayısı 15k dan büyük olan markaların çalışanlarının isim ,
-- maas ve işyerlerini
select maas,isyeri,isim from calisanlar2 where isyeri 
in (select marka_isim from markalar where calisan_sayisi>15000)

-- marka ıd si 101 den küçük olan marka çalışanlarının 
--isim,maaş ve şehirlerini listeleyin
select isyeri,sehir,isim from calisanlar2 where 
isyeri in (select marka_isim from markalar where marka_id >101)

-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
select marka_id,calisan_sayisi from markalar 
where marka_id in (select marka_isim from calisanlar2 where sehir='Ankara' )

--agregate function
select sum(maas) as maas_toplam from calisanlar2 -- toplamları verir
select max(maas) as en_yuksek_maas from calisanlar2 -- maxı verir
select min(maas) as en_dusuk_maas from calisanlar2
select avg(maas) as ort from calisanlar2 -- ortalama alır
select round(avg(maas)) as ortort from calisanlar2 --küsüratlıysa yuvarlar
select round(avg(maas),2) as ortort from calisanlar2 -- belirtilen ondalığa kadar yuvarlar
select count(maas) as maas_adedi from calisanlar2-- kaç maas değişkeni olduğnu sayar

-- Her markanin id’sini, ismini ve toplam kaç şehirde 
-- bulunduğunu listeleyen bir SORGU yaziniz.

select marka_id,marka_isim,
(select count(sehir)from calisanlar2 where isyeri=marka_isim)as sehir_sayisi
from markalar



