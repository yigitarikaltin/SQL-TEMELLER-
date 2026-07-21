--SELECT, WHERE OPERATORU
SELECT * FROM Ogrenci WHERE DogumTarihi <= '2006-08-09'
SELECT OgrenciNo, Ad, Soyad FROM Ogrenci WHERE Soyad = 'KAŞİF'
  
--CREATE, ALTER OPERATORU
CREATE TABLE Ogrenci (
OgrenciNo int NOT NULL,
Ad varchar(30) NOT NULL,
Soyad varchar(30) NOT NULL,
TCKimlikNo char(11) NOT NULL,
KayitTarihi date NOT NULL,
ErkekMi bit NOT NULL)
ALTER TABLE Ogrenci ALTER COLUMN DogumTarihi date NOT NULL
SELECT Ad, Soyad, KayitTarihi, DogumTarihi FROM Ogrenci Where OgrenciNo <= 600
ALTER TABLE Ogrenci ADD SinavNotu1 tinyint DEFAULT 0
  

--AND ve OR OPERATORU
SELECT * FROM Ogrenci WHERE OgrenciNo > 500 AND ErkekMi = 1
SELECT * FROM Ogrenci WHERE Soyad = 'Eren' OR Ad = 'Ömer'

--IN OPERATORU
SELECT * FROM Ogrenci WHERE OgrenciNo in (124, 11, 893)
SELECT * FROM Ogrenci WHERE OgrenciNo in (124, 11, 893) AND ErkekMi = 1

--LIKE OPERATORU ve % KULLANIMI           "%, İÇİNDE ARAR. BAŞINA VE SONUNA EKLERSEN YERİ FARKETMEKSİZİN BULUNANLARI GÖSTERİR. SADECE SONUNA EKLERSEN BAŞINDA BULUNANLARI GÖSTERİR."
SELECT * FROM Ogrenci WHERE Ad like 'K%'
SELECT * FROM Ogrenci WHERE TCKimlikNo like '%34%'

--PERSONEL PROJECT 
USE OgrenciBilgileriVT
GO 

CREATE TABLE Ogretmen(
OgretmenNo int NOT NULL,
Ad varchar(30) NOT NULL,
Soyad varchar(30) NOT NULL,
TCKimlikNo char(11) NOT NULL,
KayitTarihi date NOT NULL,
ErkekMi bit NOT NULL)

SELECT * FROM Ogretmen
ALTER TABLE Ogretmen ADD OgrenciSayisi int 
ALTER TABLE Ogretmen DROP COLUMN OgrenciSayisi
ALTER TABLE Ogretmen ADD OgrenciSayisi int DEFAULT 0
SELECT * FROM Ogretmen
SELECT Ad, Soyad FROM Ogretmen WHERE ErkekMi = 1
SELECT Ad, Soyad FROM Ogretmen WHERE OgretmenNo > 200 AND ErkekMi = 1 
SELECT Ad, Soyad FROM Ogretmen WHERE OgretmenNo in (123,432)
SELECT Ad, Soyad FROM Ogretmen WHERE OgretmenNo in (123,432) OR ErkekMi = 1
SELECT Ad, Soyad FROM Ogretmen WHERE TCKimlikNo like '%34%'
SELECT TCKimlikNo FROM Ogretmen WHERE TCKimlikNo like '%34%'
SELECT Ad, Soyad, TCKimlikNo FROM Ogretmen WHERE Ad like '%A'

--INSERT INTO KULLANIMI (YENİ KAYIT ATAR)
INSERT INTO Ogrenci VALUES(925,'Ahmet','Çalık','12345678991','2022-02-15',1,'2006-08-09',70,0,0)
INSERT INTO Ogrenci (OgrenciNo, Ad, Soyad, TCKimlikNo, KayitTarihi, ErkekMi, DogumTarihi) 
		values(980, 'Damla','Sucu','12345678913','2019-08-19', 0, '2003-04-29')
INSERT INTO Ogrenci (OgrenciNo, Ad, Soyad, TCKimlikNo, KayitTarihi, ErkekMi, DogumTarihi) 
		values(980, 'Berra','Sucu','12345678940','2019-01-10', 0, '2003-01-06')
INSERT INTO Ogrenci VALUES( 102, 'Cengiz','Kardelen','12345678990','2024-09-30', 1, '2002-01-18', 91, 65, 80)
	
--PERSONEL INSERT INTO AND UPDATE WORKS (OGRETMEN TABLE)
INSERT INTO Ogretmen (OgretmenNo, Ad, Soyad, TCKimlikNo, KayitTarihi, ErkekMi)
		VALUES(203, 'Burak','Enes','1234567982','2024-02-09', 0)
SELECT * FROM Ogretmen
UPDATE Ogretmen SET TCKimlikNo = '12345678904' WHERE Soyad = 'Enes'
 
--UPDATE OPERATORU (DEĞERLERİ GÜNCELLER)
uPDATE Ogrenci SET SinavNotu1 = 75 WHERE Ad = 'Damla' AND Soyad = 'Sucu'
UPDATE Ogrenci SET SinavNotu2 = 80 WHERE ErkekMi = 1
UPDATE Ogrenci SET SinavNotu2 = 85 WHERE OgrenciNo>500;
UPDATE Ogrenci SET SinavNotu1 = 90, FinalNotu = 100 WHERE OgrenciNo IN (124,392,29,11) AND ErkekMi = 1
UPDATE Ogrenci SET SinavNotu1 = 05, SinavNotu2 = 40, FinalNotu = 22 WHERE Ad = 'Batuhan' AND Soyad = 'Kaymak'
UPDATE Ogrenci SET OgrenciNO = 129 WHERE Ad = 'Damla' AND Soyad = 'Sucu' 

--DELETE OPERATORU (KAYIT SİLER)
DELETE FROM Ogrenci WHERE Ad = 'Fatma' AND Soyad = 'Talha'
DELETE FROM Ogrenci WHERE OgrenciNo IN(900,11) AND ErkekMi = 1
DELETE FROM Ogrenci WHERE DogumTarihi > '2006-12-12'

-- ORDER BY (SIRALA), ASC (ARTARAK) / DESC (AZALARAK)  OPERATORU
SELECT * FROM Ogrenci ORDER BY OgrenciNo
SELECT * FROM Ogrenci ORDER BY OgrenciNo ASC
SELECT * FROM Ogrenci ORDER BY OgrenciNo DESC
SELECT * FROM Ogrenci ORDER BY ErkekMi, Ad 
SELECT * FROM Ogrenci ORDER BY ErkekMi, Ad DESC

--PERSONEL WORKS
DELETE FROM Ogrenci WHERE Ad = 'Cengiz'
SELECT * FROM Ogrenci ORDER BY OgrenciNo DESC
INSERT INTO Ogrenci(OgrenciNo, Ad, Soyad, TCKimlikNo, KayitTarihi, ErkekMi, DogumTarihi)
		VALUES (990, 'Efe','Dursun','12345678917','2023-12-01', 1, '2005-01-05') 
UPDATE Ogrenci SET SinavNotu1 = 80, SinavNotu2 = 45, FinalNotu = 90 WHERE Ad = 'Efe' AND Soyad = 'Dursun'

--AS KULLANIMI (1. KULLANIMI AD DEĞİŞTİRİR, 2. KULLANIMI MATEMATİKSEL İŞLEM YAPAR.)
	--1. KULLANIM
SELECT OgrenciNo, Ad, Soyad, SinavNotu1 AS Midterm1, SinavNotu2 AS Midterm2, FinalNotu FROM Ogrenci
	--2. KULLANIM
SELECT OgrenciNo, Ad, Soyad, SinavNotu1, SinavNotu2, FinalNotu,
		(SinavNotu1+SinavNotu2+FinalNotu)/3 AS Ortalama FROM Ogrenci

-- PERSONEL AS WORKS
SELECT OgretmenNo, Ad AS İsim, Soyad AS Soyisim, OgrenciSayisi, DersSayisi, MezunSayisi FROM OGRETMEN
SELECT OgretmenNo, Ad, Soyad, OgrenciSayisi, DersSayisi, MezunSayisi,
		(OgrenciSayisi+DersSayisi+MezunSayisi)/3 AS OgretmenBasariNotu FROM Ogretmen

--BETWEEN KULLANIMI
SELECT * FROM Ogrenci WHERE OgrenciNo >= 300 AND OgrenciNo <= 900 
SELECT * FROM Ogrenci WHERE OgrenciNo BETWEEN 200 AND 900
SELECT * FROM Ogrenci WHERE OgrenciNo BETWEEN 200 AND 900 AND ErkekMi = 0
SELECT * FROM Ogrenci WHERE DogumTarihi BETWEEN '2000-01-01' AND '2001-12-12'

--COUNT (KAÇ ADET OLDUGUNU GOSTERIR) KULLANIMI
SELECT COUNT(*) FROM Ogrenci --Kaç adet sütun oldugunu gosterır
SELECT COUNT(*) FROM Ogrenci WHERE ErkekMi = 1  --Erkek öğrenci sütun sayısını yani sayısını gosterır
SELECT COUNT(*) FROM Ogrenci WHERE DogumTarihi >= '2003-03-09'  --Dogum tarihi 2003-03-09 dan buyuk ogrenci sayisi

--SUM KULLANIMI (SUTUNDAKI DEGERLERIN TOPLAMINI GETIRIR) 
SELECT SUM(FinalNotu) FROM Ogrenci  --Bütün final notlarını toplar ve yazar
SELECT SUM(SinavNotu2) FROM Ogrenci WHERE OgrenciNo >= 200

--MAX KULLANIMI (SUTUNDAKI EN YUKSEK DEGERI GETIRIR)
SELECT MAX(SinavNotu1) FROM Ogrenci
SELECT MAX(SinavNotu1) FROM Ogrenci WHERE ErkekMi = 0

--AVG KOMUTU (SUTUNUN ORTALAMASINI HESAPLAR)
SELECT AVG(FinalNotu) FROM Ogrenci  
SELECT AVG(FinalNotu) FROM Ogrenci WHERE KayitTarihi >= '2024-12-12'

SELECT SUM(SinavNotu1) / COUNT(*) FROM Ogrenci
SELECT AVG(SinavNotu1) FROM Ogrenci   --SAME THINK
