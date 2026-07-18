SELECT * FROM Ogrenci WHERE DogumTarihi <= '20060809'
SELECT OgrenciNo, Ad, Soyad FROM Ogrenci WHERE Soyad = 'KAŞİF'
  
CREATE TABLE Ogrenci (
OgrenciNo int NOT NULL,
Ad varchar(30) NOT NULL,
Soyad varchar(30) NOT NULL,
TCKimlikNo char(11) NOT NULL,
KayitTarihi date NOT NULL,
ErkekMi bit NOT NULL)
ALTER TABLE Ogrenci ALTER COLUMN DogumTarihi date NOT NULL
SELECT Ad, Soyad, KayitTarihi, DogumTarihi FROM Ogrenci Where OgrenciNo <= 600
