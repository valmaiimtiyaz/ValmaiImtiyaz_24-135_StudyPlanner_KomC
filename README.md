# Study Planner 
**Valmai Imtiyaz** - 241401135 - Kom C

Aplikasi perencana studi pribadi (Study Planner) berbasis Flutter dengan implementasi State Management menggunakan Provider dan routing menggunakan GoRouter.

## Daftar Versi Package
Sesuai dengan berkas `pubspec.yaml`, proyek ini bergantung pada:
- **Flutter SDK**: `>=3.29.0 <4.0.0`
- **provider**: `^6.1.5+1`
- **go_router**: `^16.2.1`

## Penjelasan Pemilik State dan Alur Data
Aplikasi ini menggunakan `ChangeNotifierProvider` melalui kelas `CourseStore` sebagai pemilik state utama yang berjalan di memori lokal. 
**Alur data pada fitur Tambah Favorit:** Saat pengguna menekan ikon hati pada komponen `CourseCard`, antarmuka akan memanggil fungsi `context.read<CourseStore>().toggleFavorite(id)`. Fungsi ini mengecek apakah ID aktivitas tersebut sudah ada di dalam Set `_favorites`. Jika belum, ID ditambahkan; jika sudah ada, ID dihapus. Setelah itu, `CourseStore` mengeksekusi `notifyListeners()`. Hal ini memicu semua widget yang memantau status (melalui `context.watch<CourseStore>()`) untuk merender ulang layarnya secara instan, mengubah warna ikon hati, dan memperbarui angka indikator di App Bar.

## Skenario Uji
Berikut adalah 12 skenario pengujian fungsional aplikasi:

1. **Load Beranda**
   - Aksi: Membuka aplikasi pertama kali.
   - Ekspektasi: Tampil halaman Beranda dengan daftar 10 data aktivitas bawaan.
   - Hasil Aktual: Beranda tampil beserta daftar aktivitas default.
   - Status: Pass

2. **Tambah Aktivitas Sukses**
   - Aksi: Isi seluruh field form dengan data valid, klik "Tambah Aktivitas".
   - Ekspektasi: Layar kembali ke Beranda, data baru muncul di daftar.
   - Hasil Aktual: Aktivitas baru sukses tersimpan dan dirender.
   - Status: Pass

3. **Validasi Form (Kosong)**
   - Aksi: Kosongkan field "Nama Aktivitas", lalu klik "Tambah Aktivitas".
   - Ekspektasi: Muncul teks peringatan merah "Nama aktivitas wajib diisi".
   - Hasil Aktual: Muncul pesan error di bawah field teks form.
   - Status: Pass

4. **Validasi Form (Karakter)**
   - Aksi: Isi field deskripsi dengan teks "tes", lalu klik "Tambah Aktivitas".
   - Ekspektasi: Muncul teks peringatan merah "Deskripsi harus lebih dari 5 karakter".
   - Hasil Aktual: Muncul pesan error validasi batas karakter.
   - Status: Pass

5. **Batal Input Form**
   - Aksi: Buka form tambah aktivitas, lalu tekan ikon panah kembali di AppBar.
   - Ekspektasi: Kembali ke layar sebelumnya tanpa ada penambahan data ke dalam state.
   - Hasil Aktual: Navigasi kembali berhasil, data state tidak berubah.
   - Status: Pass

6. **Edit Aktivitas**
   - Aksi: Klik opsi "Edit", ubah judul pada kolom "Nama Aktivitas", klik "Simpan Perubahan".
   - Ekspektasi: Nama aktivitas pada kartu berubah sesuai inputan teks terbaru.
   - Hasil Aktual: Data sukses diperbarui di layar tanpa duplikasi.
   - Status: Pass

7. **Hapus Aktivitas**
   - Aksi: Klik opsi "Hapus" pada salah satu kartu aktivitas, tekan "Ya" pada dialog konfirmasi.
   - Ekspektasi: Aktivitas tersebut lenyap dari seluruh daftar di berbagai layar aplikasi.
   - Hasil Aktual: Data terhapus sepenuhnya dari memori Provider.
   - Status: Pass

8. **Tambah Favorit**
   - Aksi: Klik ikon hati (abu-abu) pada salah satu kartu aktivitas.
   - Ekspektasi: Ikon hati berubah merah, aktivitas muncul di dalam menu halaman Favorit.
   - Hasil Aktual: Data sukses dimasukkan ke list favorit.
   - Status: Pass

9. **Hapus Favorit**
   - Aksi: Klik ikon hati (merah) pada aktivitas yang berada di dalam menu Favorit.
   - Ekspektasi: Ikon kembali abu-abu, aktivitas langsung lenyap dari halaman Favorit.
   - Hasil Aktual: Data sukses dihapus dari list favorit.
   - Status: Pass

10. **Buka Favorit Kosong**
    - Aksi: Hapus semua data di menu favorit, lalu buka kembali menu Favorit.
    - Ekspektasi: Muncul tampilan khusus bertuliskan "Belum Ada Favorit".
    - Hasil Aktual: Tampil indikator antarmuka layar kosong.
    - Status: Pass

11. **Filter Pencarian (Valid)**
    - Aksi: Ketik "Slicing" pada kolom pencarian di halaman Beranda.
    - Ekspektasi: Daftar di bawahnya hanya menampilkan aktivitas yang mengandung kata "Slicing".
    - Hasil Aktual: Daftar terfilter dengan akurat sesuai input teks.
    - Status: Pass

12. **Edit Profil Sukses**
    - Aksi: Buka menu Profil, ubah nama dari "Mahasiswa" menjadi "Valmai Imtiyaz", klik Simpan.
    - Ekspektasi: Teks sapaan di Beranda dan nama di halaman Profil berubah secara serentak.
    - Hasil Aktual: State string nama profil sukses diperbarui.
    - Status: Pass

## Link Video Demonstrasi
https://www.youtube.com/watch?v=cWOwf0kKIcM
