# Pertemuan 5 — User Interaction, State Management & Navigation
Nurrahmadayeni, M.Kom. · Pemrograman Mobile USU

Kelanjutan kartu mata kuliah Pertemuan 4. Source project ini memiliki empat entrypoint:
- `lib/main_local.dart`: Tahap A, input nama, favorit, dan counter memakai setState.
- `lib/main_catalog.dart`: Tahap B, katalog dan pencarian dengan Provider.
- `lib/main_favorites.dart`: Tahap C, favorit bersama dan switch tampilan.
- `lib/main.dart`: Tahap D, pencarian, favorit bersama, detail, profil, validasi, dan hasil navigasi memakai Provider + go_router.

## Menjalankan dari ZIP ini
1. Ekstrak ZIP dan buka folder `mobile_usu_pertemuan5` di VS Code.
2. Periksa Flutter SDK dengan `flutter --version` dan `flutter doctor`.
3. Source ZIP tidak menyertakan folder platform hasil generator. Buat platform di folder proyek ini (tanpa --overwrite):

```sh
flutter create --project-name mobile_usu_pertemuan5 --platforms=android,web .
flutter pub get
```

Perintah generator mungkin menambahkan contoh `test/widget_test.dart` yang mengacu ke aplikasi counter bawaan. Hapus **hanya file contoh tersebut jika baru dibuat**; gunakan pengujian `test/course_store_test.dart` yang disertakan. Jangan memakai --overwrite karena dapat mengganti source latihan.

4. Tahap A:
```sh
flutter run -d chrome -t lib/main_local.dart
```
5. Tahap B dan C (hentikan run sebelumnya dahulu):
```sh
flutter run -d chrome -t lib/main_catalog.dart
flutter run -d chrome -t lib/main_favorites.dart
```
Jalankan satu perintah run per tahap, bukan bersamaan.

6. Tahap D:
```sh
flutter run -d chrome -t lib/main.dart
```
Untuk Android, gunakan ID dari `flutter devices` sebagai pengganti `chrome`.

## Melanjutkan proyek Pertemuan 4 milik Anda
Cadangkan proyek lama. Salin isi folder `lib` dari paket ini ke proyek latihan lanjutan, kemudian tambahkan `provider: ^6.1.5+1` dan `go_router: ^16.2.1` pada dependencies. Sesuaikan environment minimal Dart 3.7 / Flutter 3.29. Jalankan flutter pub get dan pilih main_local.dart dahulu. Jika nama package proyek berbeda, ubah import package pada file test agar mengikuti nama proyek Anda.

## Versi
Minimum yang dirujuk: Flutter 3.29 / Dart 3.7. Seri go_router 16 dipilih untuk latihan, bukan diklaim versi terbaru. Solver memilih versi dalam rentang pubspec yang kompatibel dengan SDK. Jika gagal, baca batas SDK pada pesan pub, jangan menghapus constraint sembarangan. Simpan pubspec.lock setelah resolusi sukses untuk kelas/kelompok Anda. Koneksi internet diperlukan saat pertama mengambil dependensi.

## Struktur
- main.dart: tema dan provider di atas router.
- main_local.dart: latihan state lokal.
- app_router.dart: rute, ShellRoute, penanganan URL salah.
- models/course.dart: model dan tiga data contoh (DEMO02/DEMO03 bukan kode MK resmi).
- state/course_store.dart: nama, query, favorit; notifikasi perubahan.
- pages/course_pages.dart: beranda, favorit, detail.
- pages/profile_pages.dart: profil, Form edit, hasil pop.
- widgets/app_shell.dart: AppBar dan bottom navigation.
- widgets/course_card.dart: kartu lanjutan dari Pertemuan 4.
- test/course_store_test.dart: validasi perilaku model.

## Skenario demonstrasi
1. Cari `mobile`; satu kartu sesuai ditampilkan. Cari `xyz`; tampil pesan kosong.
2. Tandai ILK3105 sebagai favorit; indikator dan tab Favorit harus sesuai.
3. Buka detail dari Favorit; ID dan parameter `from=favorites` terbaca.
4. Hapus favorit dari detail; kembali; daftar dan hitungan ikut berubah.
5. Edit profil: nama kosong/1 karakter ditolak; `  Rani  ` disimpan sebagai `Rani`.
6. Batal edit; nama lama tetap. Simpan edit; sapaan beranda ikut berubah.
7. Buka langsung `/#/course/ILK3105`; detail dapat mencari objek berdasarkan ID.
8. Buka `/#/course/tidak-ada`; pesan data tidak ditemukan, tanpa crash.
9. Buka `/#/edit-profile` tanpa extra; nama menggunakan fallback dari store.
10. Refresh penuh: state dalam memori direset. Tidak ada persistence/database/API.

Untuk web, contoh menggunakan hash routing bawaan. Browser Back/Forward serta refresh URL perlu diuji pada perangkat/host yang dipakai. ShellRoute menjaga layout bersama, bukan otomatis menyimpan stack independen setiap tab; bahasan lanjutan menggunakan StatefulShellRoute.

## Verifikasi lokal
```sh
flutter analyze
flutter test test/course_store_test.dart
```
Flutter SDK tidak tersedia di lingkungan penyusunan materi. Source telah ditinjau, tetapi flutter analyze, flutter test, dan build aplikasi belum dieksekusi di sana. Jalankan perintah di atas pada mesin kuliah. Demo HTML pada slide adalah simulasi konsep, bukan hasil build Flutter.

## Referensi
PDF unggahan: Interaksi Pengguna, State Management, Navigasi & Data Passing di Flutter (38 halaman).
https://docs.flutter.dev/cookbook/forms/validation
https://api.flutter.dev/flutter/widgets/State/setState.html
https://docs.flutter.dev/data-and-backend/state-mgmt/simple
https://pub.dev/packages/provider
https://pub.dev/packages/go_router/versions/16.2.1
https://pub.dev/documentation/go_router/latest/topics/Navigation-topic.html

## Panduan praktik dan tugas UTS
Baca PANDUAN_PRAKTIK.md secara berurutan: Bagian I teori, Bagian II praktik berdasarkan desain lalu kode dan hasil, Bagian III tugas individu/kelompok menuju UTS. Pada HTML, tombol Salin berkas lengkap menyalin seluruh source, sedangkan cuplikan kode digunakan untuk pembahasan. Tugas Study Planner, dua modul CRUD kelompok, milestone, rubrik, dan kriteria frontend selesai tetap tercantum. Empat entrypoint merupakan source inti pertemuan. CRUD aktivitas, loading/error simulasi, dan dua modul domain adalah pengembangan yang harus mahasiswa kerjakan, bukan fitur yang sudah diimplementasikan dalam source inti.
