# GROUP BY, HAVING, dan COUNT dalam SQL

## 1. Pengantar
SQL adalah bahasa yang digunakan untuk mengelola dan memanipulasi basis data relasional. Dalam SQL, `GROUP BY`, `HAVING`, dan `COUNT` adalah klausa penting yang sering digunakan untuk melakukan agregasi dan penyaringan data dalam kelompok.

## 2. GROUP BY
### Pengertian
`GROUP BY` digunakan untuk mengelompokkan baris yang memiliki nilai yang sama dalam satu atau lebih kolom. Klausa ini sering digunakan bersama fungsi agregat (seperti `COUNT`, `SUM`, `AVG`, dll.) untuk melakukan operasi pada setiap kelompok.

### Sintaks
```sql
SELECT kolom1, fungsi_agregat(kolom2) FROM nama_tabel GROUP BY kolom1;
```
### Contoh
Misalkan kita memiliki tabel `Penjualan` dengan struktur sebagai berikut:

|ID_Penjualan|Produk|Jumlah|Tanggal_Penjualan|
|---|---|---|---|
|1|A|10|2024-08-01|
|2|B|15|2024-08-02|
|3|A|5|2024-08-03|
|4|C|7|2024-08-04|
|5|B|20|2024-08-05|

Untuk menghitung total jumlah penjualan untuk setiap produk, kita bisa menggunakan query berikut:

Program :
```sql
SELECT Produk, SUM(Jumlah) AS Total_Jumlah FROM Penjualan GROUP BY Produk;
```
### Hasil

|Produk|Total_Jumlah|
|---|---|
|A|15|
|B|35|
|C|7|

## 3. HAVING

### Pengertian

`HAVING` digunakan untuk memfilter hasil dari `GROUP BY`. Klausa ini mirip dengan `WHERE`, tetapi digunakan untuk memfilter kelompok, bukan baris individu.

### Sintaks
```sql
SELECT kolom1, fungsi_agregat(kolom2) FROM nama_tabel GROUP BY kolom1 HAVING fungsi_agregat(kolom2) operator nilai;
```
### Contoh

Untuk menampilkan hanya produk yang memiliki total jumlah penjualan lebih dari 10, kita bisa menggunakan query berikut:

```sql
SELECT Produk, SUM(Jumlah) AS Total_Jumlah FROM Penjualan GROUP BY Produk HAVING SUM(Jumlah) > 10;
```
### Hasil

|Produk|Total_Jumlah|
|---|---|
|A|15|
|B|35|

## 4. COUNT

### Pengertian

`COUNT` adalah fungsi agregat yang digunakan untuk menghitung jumlah baris dalam sebuah kelompok.

### Sintaks

```sql
SELECT COUNT(kolom) FROM nama_tabel WHERE kondisi;
```
### Contoh

Untuk menghitung jumlah produk yang terjual lebih dari 10 unit, kita bisa menggunakan query berikut:

```sql
SELECT COUNT(Produk) AS Jumlah_Produk FROM Penjualan WHERE Jumlah > 10;
```
### Hasil

|Jumlah_Produk|
|---|
|3|

## 5. Contoh Kasus Kombinasi GROUP BY, HAVING, dan COUNT

Misalkan kita ingin mengetahui berapa banyak produk yang memiliki total penjualan lebih dari 20 unit. Query-nya akan seperti ini:

```sql
SELECT Produk, COUNT(*) AS Jumlah_Transaksi, SUM(Jumlah) AS Total_Jumlah FROM Penjualan GROUP BY Produk HAVING SUM(Jumlah) > 20;
```
### Hasil

| Produk | Jumlah_Transaksi | Total_Jumlah |
| ------ | ---------------- | ------------ |
| B      | 2                | 35           |

## 6. Kesimpulan

- `GROUP BY` digunakan untuk mengelompokkan data berdasarkan kolom tertentu.
- `HAVING` digunakan untuk memfilter kelompok data setelah proses agregasi.
- `COUNT` digunakan untuk menghitung jumlah baris atau elemen dalam suatu kelompok.