"SELECT, WHERE OPERATORU"
SELECT * FROM Ogrenci WHERE DogumTarihi <= '20060809'
SELECT OgrenciNo, Ad, Soyad FROM Ogrenci WHERE Soyad = 'KAŞİF'
  
"CREATE, ALTER OPERATORU" 
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
  

"AND OPERATORU"
SELECT * FROM Ogrenci WHERE OgrenciNo > 500 AND ErkekMi = 1
SELECT * FROM Ogrenci WHERE Soyad = 'Eren' OR Ad = 'Ömer'

"IN OPERATORU"
SELECT * FROM Ogrenci WHERE OgrenciNo in (124, 11, 893)
SELECT * FROM Ogrenci WHERE OgrenciNo in (124, 11, 893) AND ErkekMi = 1

"LIKE OPERATORU ve % KULLANIMI"           "%, İÇİNDE ARAR. BAŞINA VE SONUNA EKLERSEN YERİ FARKETMEKSİZİN BULUNANLARI GÖSTERİR. SADECE SONUNA EKLERSEN BAŞINDA BULUNANLARI GÖSTERİR."
SELECT * FROM Ogrenci WHERE Ad like 'K%'
SELECT * FROM Ogrenci WHERE TCKimlikNo like '%34%'
