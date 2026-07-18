CREATE TABLE Ogrenci (
	OgrenciNo int NOT NULL,
	Ad varchar(30) NOT NULL, 
	Soyad varchar(30) NOT NULL,
	TCKimlikNo char(11) NOT NULL,
	KayitTarihi date NOT NULL,
	ErkekMi bit NOT NULL)


ALTER TABLE Ogrenci ADD DogumTarihi date 
ALTER TABLE Ogrenci ALTER COLUMN DogumTarihi date NOT NULL
