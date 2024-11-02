# Pengantar
SQL adalah bahasa yang digunakan untuk mengelola dan memanipulasi basis data relasional. Dalam materi yang akan di pelajari kali ini yaitu GROUP BY , HAVING , dan COUNT. Pada SQL mereka adalah klausa penting yang sering digunakan untuk melakukan agregasi dan penyaringan data dalam kelompok.
# GROUP BY
## PENGERTIAN 
GROUP BY digunakan untuk mengelompokkan baris yang memiliki nilai yang sama dalam satu atau lebih kolom. Klausa ini sering digunakan bersama fungsi agregat (seperti COUNT , SUM , AVG , dll.) untuk melakukan operasi pada setiap kelompok.

## CONTOH KODE 
### SINTAKS
```SQL 
SELECT kolom1, fungsi_agregat(kolom2) FROM nama_tabel GROUP BY kolom1;
```
### contoh penggunaan
misalnya kita memiliki table pegawai 
![](asset/foto_6.png)
untuk menghitung jumlah pegawai yang ada, kita bisa menggunakan query berikut : 
```sql 
SELECT NoCab, COUNT(NIP) AS jumlah_pegawai FROM pegawai GROUP BY NoCab;
```
HASIL : 
![](asset/foto_8.png)
ANALISIS : 

# HAVING 
## PENGERTIAN 
HAVING digunakan untuk memfilter hasil dari GROUP BY . Klausa ini mirip dengan WHERE , tetapi digunakan untuk memfilter kelompok, bukan baris individu. Perbedaan antara `WHERE` dan `HAVING`
- **WHERE**: Digunakan untuk memfilter baris sebelum pengelompokan terjadi (sebelum GROUP BY dijalankan).
- **HAVING**: Digunakan untuk memfilter hasil setelah pengelompokan dan agregasi selesai (setelah GROUP BY dijalankan).
## CONTOH KODE
### SINTAKS
```SQL 
SELECT kolom1, fungsi_agregat(kolom2) FROM nama_tabel GROUP BY kolom1 HAVING fungsi_agregat(kolom2) operator nilai;
```

### Contoh penggunaan
Untuk menampilkan kolom gaji dan kolom jumlah pengawai lebih kecil dari atau sama dengan 10, kita bisa menggunakan query berikut : 

```sql
SELECT Gaji, COUNT(NIP) AS jumlahpegawai
FROM pegawai
GROUP BY NoCab HAVING COUNT(NIP) <= 10;
```
HASIL : 
![](asset/foto_7.png)

ANALISIS : 

# COUNT
## PENGERTIAN
**COUNT** dalam SQL digunakan untuk menghitung jumlah baris yang sesuai dengan kondisi tertentu dalam sebuah query. Fungsi ini sangat berguna untuk menghitung banyaknya data yang memenuhi syarat tertentu tanpa perlu menampilkan data itu sendiri.

## Contoh Kode
### sintaks 

```sql 
SELECT COUNT(kolom) FROM nama_tabel WHERE kondisi;
```

### contoh penggunaan

```sql 
SELECT NoCab, COUNT(NIP) AS jumlahpegawai FROM pegawai WHERE NoCab = 'C102'
```

HASIL 
![](asset/foto_9.png)
