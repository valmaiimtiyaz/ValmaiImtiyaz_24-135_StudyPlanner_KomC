# Pertemuan 5: Teori, praktik berdasarkan desain, dan tugas UTS

## Cara menggunakan
Pelajari teori terlebih dahulu. Pada praktik, amati desain lalu salin satu berkas lengkap melalui tombol di HTML. Cuplikan pada slide merupakan pembahasan bagian berkas, bukan program mandiri. Empat entrypoint tersedia untuk tahap lokal, katalog, favorit, dan integrasi.

## 1. User Interaction, State Management & Navigation
 ILK3105 · Pertemuan 5 User Interaction & Navigation State Management & Data Passing in Flutter Dari kartu statis menjadi aplikasi mata kuliah yang interaktif. Nurrahmadayeni, M.Kom. S1 Ilmu Komputer · USU Mata Kuliah USU PERTEMUAN 5 Halo, Rani! ⌕ Cari mata kuliah </> Pemrograman Mobile ILK3105 · Flutter ♥ Lihat materi Beranda Favorit Profil Proyek lanjutan Pertemuan 4 

Assalamu’alaikum warahmatullahi wabarakatuh. Selamat pagi atau siang, semuanya. Pada pertemuan sebelumnya, kita membuat tampilan kartu mata kuliah. Hari ini, kartu tersebut kita kembangkan supaya dapat merespons tindakan pengguna.

Pengguna akan bisa memasukkan nama, mencari mata kuliah, menandai favorit, serta berpindah ke halaman detail. Kita juga akan melihat bagaimana data diteruskan ketika halaman berubah. Jadi, proyek hari ini merupakan kelanjutan dari susunan widget yang sudah kalian pelajari. Fokus kita adalah memahami hubungan antara tindakan, perubahan data, dan hasil yang tampil di layar.

## 2. CPL, Sub-CPMK & tujuan pembelajaran
 Keterkaitan CPL Merancang dan mengimplementasikan antarmuka aplikasi yang merespons kebutuhan pengguna. Sub-CPMK pertemuan Mengimplementasikan interaksi, perubahan state, navigasi, dan pengiriman data pada aplikasi Flutter. Bukti capaian Form tervalidasi, favorit tersinkron, detail berdasarkan ID, dan hasil edit kembali ke halaman asal. Rumusan operasional pertemuan; kode CPL dan Sub-CPMK resmi mengikuti RPS. 

Capaian hari ini lebih jauh daripada membuat tampilan. Kalian diharapkan mampu menghubungkan input dengan perubahan data, memilih tempat penyimpanan state, dan meneruskan data antarhalaman. Rumusan pada slide menjelaskan target operasional kita; kode resminya mengikuti RPS.

Bukti pemahamannya terlihat dari perilaku aplikasi. Nama yang tidak valid harus ditolak, favorit harus konsisten, dan halaman detail harus menerima identitas mata kuliah yang benar. Saat menjelaskan hasil, kalian perlu menunjukkan bagian kode yang bertanggung jawab atas setiap perilaku tersebut.

## 3. Urutan pembahasan pertemuan
 I. Teori: interaksi, input, state, navigasi, dan pengiriman data. II. Praktik: lihat desain, salin kode, pahami alurnya, lalu coba hasil. III. Tugas: pengembangan individu dan frontend kelompok sampai UTS. 

Hari ini kita memisahkan pembahasan menjadi tiga bagian. Kita pahami dahulu teori yang akan dipakai. Setelah itu, kita masuk ke praktik dengan melihat desain sebelum menuliskan kode.

Pada bagian praktik, setiap desain diikuti berkas kode yang sesuai. Bagian terakhir berisi tugas individu dan kelompok sebagai kelanjutan pekerjaan menuju UTS.

## 4. I · Pokok teori yang perlu dipahami
 1. Interaksi: kejadian pengguna dan callback. 2. Input: TextField, controller, Form, dan validasi. 3. State: pemilik data, setState, Provider, dan notifikasi. 4. Navigasi: halaman, route, stack, dan perpindahan. 5. Data passing: parameter, payload, dan hasil form. 

Ada lima pokok teori yang kita bahas secara berurutan. Pertama, bagaimana aplikasi menerima tindakan pengguna. Kedua, bagaimana masukan dibaca dan diperiksa. Ketiga, bagaimana data yang berubah memengaruhi tampilan.

Setelah itu kita membahas perpindahan halaman dan data yang ikut berpindah. Perhatikan hubungan antarbagian ini. Seluruh konsep tersebut akan kita pakai kembali ketika membangun aplikasi mata kuliah.

## 5. 1.1 · Interaksi pengguna
 Interaksi dimulai dari tindakan pengguna pada antarmuka. Kejadian yang umum: mengetik, menekan tombol, memilih, dan menggeser. Aplikasi memproses kejadian melalui fungsi penanganan. Respons harus terlihat: teks berubah, pesan muncul, atau halaman berganti. Contoh: Menekan hati mengubah status favorit dan tampilan ikon. 

Interaksi adalah hubungan antara tindakan pengguna dan respons aplikasi. Ketika pengguna menekan tombol, ia mengharapkan sesuatu terjadi dan terlihat.

Misalnya pengguna menekan ikon hati. Aplikasi memperbarui status favorit dan memperlihatkan ikon yang berubah. Jika hanya datanya berubah tanpa respons visual, pengguna dapat mengira tindakannya gagal.

## 6. 1.2 · Event dan callback
 Event adalah kejadian, misalnya tombol ditekan. Callback adalah fungsi yang dijalankan ketika kejadian terjadi. onPressed menangani tombol; onChanged menangani perubahan input. Fungsi callback dapat mengubah state, memvalidasi, atau membuka halaman. Aksi pengguna dipasang sebagai fungsi, bukan dijalankan saat build. Contoh: onPressed menerima aksi Simpan; onChanged menerima teks terbaru. 

Event adalah kejadiannya, sedangkan callback adalah fungsi yang menangani kejadian tersebut. Satu callback dapat melakukan beberapa langkah yang saling terkait, misalnya memeriksa input lalu menyimpan nilai.

Perbedaan pentingnya adalah kapan fungsi dijalankan. Kita menyerahkan fungsi kepada widget agar dipanggil ketika pengguna bertindak. Jangan menjalankan aksi penyimpanan saat aplikasi sedang membangun tampilan.

## 7. 1.3 · Tombol dan gestur
 FilledButton atau ElevatedButton menonjolkan aksi utama. TextButton cocok untuk aksi sekunder seperti Batal. IconButton digunakan untuk aksi ringkas dan perlu tooltip yang jelas. GestureDetector menangkap tap, double tap, atau long press pada area custom. InkWell menyediakan respons tinta pada komponen Material. 

Jenis tombol membantu pengguna mengenali prioritas tindakan. Tombol Simpan perlu terlihat sebagai aksi utama, sedangkan Batal dapat mempunyai penekanan lebih rendah.

Gestur custom digunakan ketika komponen bawaan belum memenuhi kebutuhan. Hindari menyembunyikan tindakan penting hanya pada tekan lama tanpa petunjuk. Ikon juga perlu mempunyai makna yang jelas dan tooltip agar pengguna tidak perlu menebak.

## 8. 2.1 · Input teks dan dekorasi
 TextField menerima masukan teks dari pengguna. labelText menjelaskan data yang harus diisi. hintText memberi contoh masukan. keyboardType membantu memilih keyboard sesuai jenis data. obscureText menyamarkan tampilan teks, misalnya kata sandi. Contoh: Label Nama mahasiswa, hint Contoh: Rani. 

Input yang baik memberi konteks sebelum pengguna mengetik. Label menjelaskan data yang diminta, sedangkan hint memberi contoh. Keduanya mempunyai fungsi yang berbeda.

Keyboard yang sesuai membantu pengguna, tetapi tidak memvalidasi isi secara otomatis. Menampilkan keyboard email tidak menjamin alamat yang diketik benar. Demikian pula obscureText hanya menyamarkan tampilan teks, bukan menggantikan mekanisme keamanan data.

## 9. 2.2 · Membaca input
 onChanged cocok untuk merespons setiap perubahan teks. TextEditingController dapat membaca dan mengubah isi field lewat kode. Controller membantu mengisi nilai awal pada form edit. Nilai controller dapat diambil ketika pengguna menekan Simpan. Hindari dua sumber nilai yang saling tidak sinkron. Contoh: Pencarian memakai onChanged; edit nama memakai controller. 

Pilih cara membaca input berdasarkan perilaku yang diperlukan. Pencarian biasanya perlu langsung merespons setiap perubahan, sehingga onChanged cukup jelas. Form edit perlu menampilkan nilai lama dan membaca hasil saat Simpan, sehingga controller membantu.

Keduanya dapat dipakai bersama jika mempunyai tujuan yang jelas. Namun, jangan menyimpan nilai yang sama di beberapa tempat tanpa aturan sinkronisasi.

## 10. 2.3 · Siklus hidup controller
 Controller dimiliki oleh State halaman form. Buat satu kali, biasanya saat initState. Isi nilai awal dari data yang akan diedit. Jangan membuat controller baru pada setiap build. Panggil dispose ketika State tidak lagi digunakan. 

Controller merupakan objek yang memiliki masa penggunaan. Kita menyiapkannya ketika halaman dibuat dan membebaskannya ketika halaman selesai digunakan.

Jika controller dibuat di build, proses rebuild dapat membuat objek baru dan mengganggu isi atau posisi kursor. Pada praktik nanti, kalian akan melihat pasangan initState dan dispose pada halaman Edit Profil.

## 11. 2.4 · TextField, TextFormField, dan Form
 TextField menyediakan input teks umum. TextFormField menghubungkan input dengan pengelolaan Form. Form mengelompokkan field dan status validasinya. GlobalKey memberi akses ke FormState. Key disimpan pada State agar identitas form tetap stabil. 

TextFormField membantu ketika input menjadi bagian dari proses pengisian form. Form dapat meminta field-field di dalamnya untuk menjalankan validator.

TextField tetap dapat divalidasi secara manual, tetapi kita perlu mengelola pesan dan statusnya sendiri. Pada form edit profil, penggunaan Form dan TextFormField membuat proses pemeriksaan lebih mudah diikuti.

## 12. 2.5 · Validasi input
 Validator memeriksa nilai berdasarkan aturan data. Kembalikan teks pesan jika input tidak valid. Kembalikan null jika input valid. validate() memicu pemeriksaan field dalam Form. Penyimpanan dilanjutkan hanya jika pemeriksaan berhasil. Contoh: Nama satu huruf ditolak dengan pesan Nama minimal 2 karakter. 

Validator bukan fungsi penyimpanan. Tugasnya menentukan apakah nilai sudah memenuhi aturan. Pesan yang dikembalikan harus membantu pengguna memperbaiki masukan.

Ketika Simpan ditekan, kita meminta Form menjalankan validasi. Jika ada field yang salah, proses penyimpanan berhenti. Aturan latihan nama dua sampai empat puluh karakter akan kita gunakan secara konsisten dalam form dan store.

## 13. 2.6 · Respons setelah pengisian form
 Pesan error muncul dekat field yang salah. Input tetap tersedia agar pengguna dapat memperbaikinya. Batal membuang draf dan mempertahankan data tersimpan. Pesan berhasil muncul setelah pembaruan selesai. Submit dapat dinonaktifkan selama proses berjalan. 

Pengguna memerlukan kejelasan setelah menekan tombol. Ketika input salah, tunjukkan bagian yang perlu diperbaiki tanpa menghapus seluruh masukan. Ketika proses selesai, tampilkan konfirmasi yang sesuai.

Perilaku Batal juga harus benar. Data yang baru diketik tidak boleh langsung menjadi data resmi jika pengguna masih dapat membatalkan. Konsep draf ini akan berhubungan dengan state lokal pada bagian berikutnya.

## 14. 3.1 · Pengertian state
 State adalah data yang menentukan kondisi tampilan saat ini. Contohnya nama pengguna, query pencarian, dan status favorit. Tindakan pengguna dapat mengubah nilai state. UI membaca state untuk menentukan teks, ikon, dan daftar. Perubahan nilai harus diikuti mekanisme pembaruan UI. 

Bayangkan state sebagai data yang sedang dibaca oleh tampilan. Ikon hati penuh berarti nilai favorit aktif. Sapaan Rani berarti nama yang dibaca UI adalah Rani.

Mengubah variabel saja belum tentu memperbarui layar. Kita membutuhkan mekanisme yang memberi tahu framework bahwa bagian tampilan perlu membaca data kembali. Dua mekanisme yang kita bahas adalah setState dan notifikasi model.

## 15. 3.2 · StatelessWidget dan StatefulWidget
 StatelessWidget tidak memiliki objek State mutable sendiri. StatelessWidget tetap dapat rebuild ketika konfigurasi atau dependensinya berubah. StatefulWidget memiliki pasangan objek State. State menyimpan nilai yang berubah selama widget aktif. Pemilihan widget mengikuti kebutuhan kepemilikan state. 

StatelessWidget bukan berarti tampilannya tidak pernah berubah. Widget tersebut dapat dibangun ulang ketika parent memberikan konfigurasi baru atau dependensi yang didengarkan berubah.

StatefulWidget digunakan ketika widget memerlukan objek State untuk mengelola nilai atau lifecycle, seperti controller pada form. Sementara itu, halaman yang membaca Provider dapat tetap menggunakan StatelessWidget jika tidak memerlukan state lokal sendiri.

## 16. 3.3 · Pembaruan lokal dengan setState
 setState dipanggil pada objek State. Callback-nya memperbarui nilai secara sinkron. Framework menjadwalkan build untuk membaca nilai terbaru. Simpan variabel state di luar method build. Hindari callback async di dalam setState. Contoh: favorite dibalik, kemudian ikon dibangun ulang berdasarkan nilai terbaru. 

setState memberi tahu framework bahwa kondisi yang memengaruhi tampilan sudah berubah. Callback di dalamnya sebaiknya berisi pembaruan nilai yang singkat.

Untuk operasi yang menunggu, lakukan proses async di luar callback tersebut. Setelah proses selesai dan State masih aktif, perbarui nilainya. Prinsip ini membantu menghindari perubahan setelah halaman ditutup.

## 17. 3.4 · State lokal dan state bersama
 State lokal hanya diperlukan oleh satu bagian atau satu halaman. State bersama dipakai oleh beberapa widget atau halaman. Draf input cocok disimpan lokal pada controller. Nama tersimpan dan favorit cocok dibagikan ke halaman terkait. Tentukan satu sumber data utama untuk setiap informasi. 

Pertanyaan yang kita ajukan adalah siapa yang memerlukan nilai tersebut. Draf nama biasanya hanya diperlukan form, sedangkan nama resmi dibaca Profil dan Beranda.

Jika setiap halaman membuat salinan favorit sendiri, nilainya mudah berbeda. Dengan sumber data yang sama, perubahan pada Detail dapat langsung terlihat pada daftar Favorit. Inilah alasan kita membutuhkan pengelolaan state bersama.

## 18. 3.5 · Provider dan ChangeNotifier
 Provider membantu menyediakan objek kepada widget turunannya. ChangeNotifier menyediakan mekanisme pemberitahuan perubahan. Store menampung data dan method untuk mengubahnya. notifyListeners() memberi tahu widget yang mendengarkan. Provider ditempatkan di atas seluruh widget yang memerlukan store. 

Provider dan ChangeNotifier mempunyai peran berbeda. Provider membantu akses ke objek, sedangkan ChangeNotifier memberi cara mengirim notifikasi perubahan.

Dalam proyek kita, CourseStore menyimpan nama, query, dan favorit. Method pada store mengubah nilai lalu memberi notifikasi. Posisi Provider penting karena context yang digunakan harus berada di bawah Provider yang sesuai.

## 19. 3.6 · watch, read, dan select
 watch membaca objek sekaligus mendengarkan perubahannya. read membaca objek tanpa berlangganan perubahan. select mendengarkan nilai tertentu yang dipilih dari objek. Gunakan read pada callback untuk menjalankan aksi store. Gunakan watch atau select ketika UI perlu mengikuti perubahan. 

Perbedaan ketiganya terletak pada kebutuhan untuk mendengarkan perubahan. Callback tombol biasanya hanya perlu memanggil method store, sehingga read sesuai.

Teks jumlah favorit harus berubah mengikuti data, sehingga perlu watch atau select. Select membantu ketika satu komponen hanya membutuhkan satu nilai, seperti status hati untuk satu ID mata kuliah.

## 20. 3.7 · Identitas data dan konsistensi UI
 Setiap data utama memiliki ID unik dan stabil. Favorit menyimpan ID, bukan posisi kartu dalam daftar. Pencarian menghasilkan daftar turunan tanpa menghapus data asli. Hitungan dan tampilan membaca sumber data yang sama. Data dalam memori kembali awal setelah restart atau refresh penuh. 

Posisi daftar dapat berubah ketika kita mencari atau mengurutkan data. Karena itu, identitas tidak boleh bergantung pada posisi. ID tetap menunjuk mata kuliah yang sama meskipun letaknya berubah.

Pada latihan ini data berada di memori. Kita belum menyimpan favorit ke database atau penyimpanan lokal. Batas ini perlu dipahami agar refresh yang mengembalikan data awal tidak dianggap sebagai fitur penyimpanan permanen yang gagal.

## 21. 4.1 · Halaman, route, dan navigasi
 Halaman menampilkan satu tujuan atau konteks pengguna. Route mendefinisikan lokasi dan halaman yang ditampilkan. Navigasi memindahkan pengguna dari satu tujuan ke tujuan lain. Peta rute dibuat sebelum menghubungkan tombol. Setiap halaman perlu perilaku kembali atau tujuan pengganti yang jelas. 

Navigasi merupakan bagian dari alur pengguna. Sebelum menulis router, kita tentukan halaman yang tersedia dan bagaimana pengguna mencapainya.

Beranda mengantar pengguna ke Detail, sedangkan Profil mengantar ke Edit Profil. Rute langsung juga perlu dipikirkan karena pengguna web dapat membuka URL tanpa melewati halaman awal.

## 22. 4.2 · Stack dan operasi navigasi
 Navigator mengelola tumpukan halaman. push menambahkan halaman baru untuk dikunjungi. pop menutup halaman teratas dan dapat membawa hasil. Pada go_router, go berpindah ke lokasi dengan susunan rute yang sesuai. Pilih operasi berdasarkan kebutuhan kembali dan tujuan navigasi. 

Stack membantu kita memahami tombol kembali. Ketika Detail didorong di atas Beranda, pengguna dapat kembali ke halaman sebelumnya dengan pop.

Pada go_router, go digunakan untuk menuju lokasi yang sesuai dengan konfigurasi rute. Jangan menganggap go selalu sama dengan menambah satu halaman. Pada proyek kita, perpindahan tab menggunakan go, sedangkan membuka Detail dan Edit Profil memakai push.

## 23. 4.3 · go_router dan ShellRoute
 GoRouter mendefinisikan daftar lokasi aplikasi. GoRoute menghubungkan path dengan builder halaman. ShellRoute menyediakan layout bersama untuk rute anak. Tab aktif diturunkan dari lokasi rute saat ini. ShellRoute tidak otomatis menyimpan stack independen setiap tab. 

ShellRoute memudahkan beberapa halaman berbagi AppBar atau bottom navigation. Halaman anak diberikan sebagai child pada layout tersebut.

Namun, layout bersama berbeda dengan mempertahankan seluruh state dan stack setiap tab. Untuk kebutuhan yang lebih lanjut, ada pola lain seperti StatefulShellRoute. Pada latihan ini, data bersama tetap dipertahankan melalui store.

## 24. 5.1 · Mengirim data melalui rute
 Path parameter membawa identitas sumber daya, misalnya ID mata kuliah. Query parameter membawa konteks opsional, misalnya asal halaman. extra membawa payload melalui navigasi aplikasi. Periksa tipe dan kemungkinan null sebelum memakai payload. ID di URL memungkinkan data dicari kembali saat rute dibuka langsung. Contoh: /course/ILK3105?from=favorites memisahkan identitas dan konteks. 

Tidak semua data perlu dikirim dengan cara yang sama. ID mata kuliah cocok menjadi bagian dari path agar halaman Detail dapat mencari datanya kembali. Informasi asal halaman bisa menjadi query karena hanya konteks tambahan.

Extra membantu mengirim nilai awal form, tetapi jangan menjadikannya satu-satunya sumber data untuk rute yang perlu dibuka langsung. Selalu siapkan fallback jika payload tidak tersedia.

## 25. 5.2 · Mengembalikan hasil form
 Halaman pemanggil membuka form dan menunggu hasil. Form mengelola draf serta validasinya sendiri. Simpan valid menutup form dengan nilai hasil. Batal menutup form tanpa hasil perubahan. Pemanggil memeriksa hasil dan mounted sebelum memperbarui UI/state. 

Form dapat berperan sebagai halaman yang mengembalikan keputusan pengguna. Ketika nama valid disimpan, nilai dikirim kembali ke halaman pemanggil. Jika pengguna membatalkan, pemanggil tidak perlu mengubah data resmi.

Karena pemanggil menunggu proses, kita juga memeriksa apakah context masih aktif setelah await. Pemeriksaan hasil null membedakan pembatalan dari penyimpanan.

## 26. 5.3 · Kondisi navigasi yang perlu ditangani
 ID tidak ditemukan menampilkan pesan yang jelas. Rute tidak dikenal menyediakan tombol menuju halaman utama. Halaman langsung tanpa stack memakai fallback navigasi. extra kosong tidak boleh menyebabkan cast gagal. Batal edit tidak boleh mengubah data bersama. 

Aplikasi harus dapat merespons kondisi selain jalur yang selalu berhasil. Pengguna dapat membuka URL yang salah atau masuk langsung ke halaman form.

Karena itu, kita menyiapkan pesan data tidak ditemukan, pengecekan canPop, dan fallback ke Profil atau Beranda. Semua kondisi ini menjadi bagian dari pengujian pada akhir praktik.

## 27. Ringkasan teori sebelum praktik
 Konsep Yang perlu diingat Dipakai pada Callback Menangani tindakan pengguna Tombol dan input Form Memeriksa aturan masukan Edit profil State Menentukan tampilan saat ini Nama, query, favorit Provider Membagikan model dan perubahan Beranda, Favorit, Profil Router & data Menghubungkan halaman dan nilai Detail dan hasil edit 

Sebelum praktik, pastikan hubungan setiap konsep sudah jelas. Input menghasilkan kejadian, callback memprosesnya, state menyimpan perubahan, dan UI membaca nilai tersebut.

Router kemudian menghubungkan beberapa halaman yang membutuhkan data itu. Setelah ini kita berhenti menambah teori baru dan mulai menerapkannya melalui desain serta kode aplikasi.

## 28. II · Praktik berdasarkan desain
 Desain 1: kartu dengan input nama dan tombol interaktif. Desain 2: katalog dengan pencarian. Desain 3: daftar favorit. Desain 4: layout navigasi, kartu, Beranda, Favorit, dan Detail. Desain 5: form Edit Profil dan hasil kembali. Penutup praktik: integrasi router, jalankan, dan uji alur lengkap. 

Sekarang kita masuk ke praktik. Kita melihat desain terlebih dahulu, kemudian membuka kode yang membentuk desain tersebut. Penjelasan kode akan menghubungkan komponen yang tampak di layar dengan widget dan data yang digunakan.

Desain satu sampai tiga dapat dijalankan sebagai entrypoint tersendiri. Desain empat dan lima menjadi integrasi dalam entrypoint utama, sehingga seluruh berkas integrasi perlu lengkap sebelum dijalankan.

## 29. Kelanjutan proyek Pertemuan 4
 Sebelumnya Pada pertemuan ini Kartu mata kuliah statis Kartu dapat ditandai sebagai favorit. Sapaan tetap Nama dapat diubah melalui form. Tombol memberi SnackBar Tombol membuka detail mata kuliah. Satu halaman Beranda, Favorit, Profil, Detail, dan Edit Profil. 

Coba ingat kembali kartu mata kuliah yang kita buat. Container memberikan pembungkus, Row menempatkan ikon di sebelah informasi, dan Column menyusun teks. Struktur visual itu tetap menjadi dasar proyek kita.

Perubahan hari ini terjadi pada perilakunya. Ikon hati dapat mengubah status, tombol dapat membuka detail, dan nama pengguna dapat diperbarui. Dengan mempertahankan konteks proyek, kalian bisa melihat bahwa interaksi dibangun di atas antarmuka yang sudah ada. Kita tidak perlu mengganti seluruh tampilan setiap menambahkan fitur baru.

## 30. Hasil akhir: aplikasi Mata Kuliah USU
 Mata Kuliah USU PERTEMUAN 5 Halo, Rani! ⌕ Cari mata kuliah </> Pemrograman Mobile ILK3105 · Flutter ♥ Lihat materi Beranda Favorit Profil Proyek lanjutan Pertemuan 4 Beranda: pencarian dan daftar mata kuliah. Favorit: daftar yang mengikuti pilihan pengguna. Detail: data berdasarkan ID mata kuliah. Profil: form edit nama dan hasil kembali. Data contoh tersimpan di memori; belum menggunakan API, login, atau database. 

Ini gambaran hasil yang akan kita bangun. Beranda menampilkan daftar mata kuliah, tab Favorit menampilkan pilihan pengguna, dan Profil digunakan untuk mengubah nama. Detail mata kuliah dapat dibuka dari daftar.

Data latihan disimpan di memori. Artinya, setelah aplikasi di-restart atau halaman web di-refresh penuh, data pilihan dapat kembali ke kondisi awal. Hal tersebut memang menjadi batas latihan kita. Hari ini kita ingin memastikan alur interaksi dan pembagian state dipahami sebelum membahas penyimpanan permanen atau data dari server.

## 31. Demo terintegrasi: mencoba alur pengguna
 Skenario yang dicoba Cari “mobile”, lalu kosongkan pencarian. Tambah favorit dan buka tab Favorit. Buka Detail lalu hapus favorit. Edit nama; uji Batal dan Simpan. Simulasi HTML untuk pengajaran. Implementasi Flutter tersedia dalam ZIP. Reset demo 

Sekarang kita mencoba alur secara utuh. Mulai dari pencarian, tandai sebuah mata kuliah, kemudian buka tab Favorit. Perhatikan bahwa daftar tersebut mengikuti tindakan sebelumnya.

Lanjutkan ke Detail dan hapus favorit dari sana. Ketika kembali, daftar harus sesuai. Terakhir, buka Profil dan edit nama. Coba Batal terlebih dahulu, lalu ulangi dengan Simpan. Perbandingan ini menunjukkan perbedaan antara draf lokal dan data bersama. Demo web ini membantu diskusi di kelas; kalian tetap perlu menjalankan source Flutter pada perangkat untuk memeriksa perilaku implementasinya.

## 32. Tahap 0: persiapan proyek
 1. Simpan salinan proyek Pertemuan 4 sebagai cadangan. 2. Siapkan folder kerja mobile_usu_pertemuan5. 3. Unduh dan ekstrak ZIP pendamping ke folder kerja. 4. Buka folder yang berisi pubspec.yaml di VS Code. 5. Pastikan Flutter SDK dan Chrome atau emulator tersedia. 

Kita tetap melanjutkan konteks kartu mata kuliah dari pertemuan sebelumnya. Simpan cadangan agar versi sebelumnya dapat dibandingkan. Source pendamping sudah memisahkan tahap lokal, katalog, favorit, dan integrasi, sehingga kalian bisa menjalankan satu tahap tanpa menunggu seluruh pembahasan.

Pastikan folder yang dibuka adalah akar proyek, yaitu folder yang memiliki pubspec.yaml. Jika terminal berada pada folder yang salah, perintah Flutter tidak akan menemukan konfigurasi proyek.

## 33. Tahap 0: pemeriksaan lingkungan
 flutter --version flutter doctor flutter devices Paket latihan: Flutter ≥ 3.29 dan Dart ≥ 3.7. Gunakan versi package pada pubspec.yaml. Chrome harus muncul untuk target -d chrome. Baca masalah pada doctor sebelum menjalankan aplikasi. 

Perintah pertama menunjukkan versi SDK. Perintah kedua memeriksa komponen lingkungan. Perintah terakhir menunjukkan perangkat yang bisa dipakai. Minimum ini mengikuti paket latihan, bukan pernyataan bahwa SDK tersebut adalah versi terbaru.

Jika menggunakan emulator, ganti chrome dengan ID perangkat dari flutter devices. Ketika ada kendala Android toolchain tetapi Chrome tersedia, latihan frontend dapat dimulai melalui Chrome.

## 34. Tahap 0: membuat platform dan dependensi
 flutter create --project-name mobile_usu_pertemuan5 --platforms=android,web . flutter pub get flutter run -d chrome -t lib/main_local.dart Jalankan perintah create sebagai SATU baris. Jalankan dari folder hasil ekstrak. Jangan tambahkan --overwrite. Perintah run pertama membuka Tahap A. 

Setelah mengekstrak source, kita perlu membuat berkas platform yang memang tidak disertakan dalam paket ringkas. Ketik perintah flutter create dalam satu baris, diakhiri titik. Hindari opsi overwrite agar source yang sudah ada tetap digunakan.

Kemudian ambil dependensi dan jalankan main_local. Bila mengganti entrypoint dari tahap satu ke tahap berikutnya, hentikan proses run lalu jalankan perintah baru. Hot reload tidak mengganti entrypoint.

## 35. Empat entrypoint yang dapat dijalankan
 Tahap Entrypoint Hasil A lib/main_local.dart Nama, hati, penghitung lokal B lib/main_catalog.dart Katalog dan pencarian C lib/main_favorites.dart Favorit dan tampilan tersaring D lib/main.dart Navigasi, detail, profil, form 

Keempat entrypoint ini memakai folder proyek yang sama. Tahap A hanya membutuhkan Flutter Material. Tahap B dan C mulai menggunakan model dan store. Tahap D menyatukan seluruh halaman melalui router.

Struktur ini memungkinkan kalian melihat hasil lebih cepat. Ketika ada kesalahan pada navigasi, misalnya, kalian tetap dapat kembali menjalankan tahap pencarian untuk memeriksa logikanya. Source lengkap tersedia melalui tombol Kode dan Proyek.

## 36. Cara menyalin kode dari materi
 Setiap slide kode mencantumkan lokasi berkas yang harus dibuat/diganti. Klik “Salin berkas lengkap” untuk menyalin seluruh isi berkas. Klik “Buka kode lengkap” untuk membaca, menyalin, atau mengunduh berkas. Cuplikan pada slide dipakai untuk pembahasan, bukan program terpisah. Pada berkas yang sama, salin versi lengkap sekali; slide berikutnya menjelaskan lanjutannya. Setelah berkas tahap tersebut lengkap, jalankan perintah run yang diberikan. 

Agar kode mudah digunakan, materi menyediakan dua cara. Kalian dapat langsung menyalin berkas lengkap atau membuka panel kode untuk membaca dan mengunduhnya. Lokasi berkas selalu dicantumkan.

Potongan di slide membantu kita membahas bagian yang sedang terlihat, tetapi seluruh import, class, dan penutup widget tersedia pada berkas lengkap. Jangan menempelkan satu berkas lengkap berkali-kali ke dalam berkas yang sama. Ganti seluruh isinya satu kali, lalu pelajari bagian-bagiannya.

## 37. Desain 1 · Kartu interaktif
 Ketik Rani, lihat sapaan. Tekan hati dua kali, status kembali semula. Tekan Lihat materi tiga kali, hitungan menjadi 3. Coba langsung pada slide. Jalankan source Flutter untuk memeriksa implementasi pada perangkat. 

Coba ketiga tindakan ini sebelum melihat kode. Sapaan mengikuti teks, hati dapat dibalik, dan hitungan bertambah setiap ketukan.

Nanti cocokkan setiap perubahan dengan variabel name, favorite, dan opened. Demo ini memberi target perilaku. Implementasi Flutter tahap A ada pada main_local.dart.

## 38. Desain 1 · Kode kartu interaktif (1/3)
 import 'package:flutter/material.dart'; void main() => runApp(MaterialApp( theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006633))), home: const LocalCoursePage(), )); class LocalCoursePage extends StatefulWidget { const LocalCoursePage({super.key}); @override State<LocalCoursePage> createState() => _LocalCoursePageState(); } class _LocalCoursePageState extends State<LocalCoursePage> { Buat berkas main_local.dart. MaterialApp membuka LocalCoursePage. createState membuat objek penyimpan state. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_local.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Bagian awal membuat aplikasi dan memilih halaman pertama. LocalCoursePage merupakan konfigurasi widget, sedangkan objek State menampung data yang berubah.

Ketik bagian ini terlebih dahulu, lalu lanjutkan class State pada slide berikutnya di berkas yang sama. Tunggu sampai semua bagian berkas lengkap sebelum menjalankannya.

## 39. Desain 1 · Kode kartu interaktif (2/3)
 String name = ''; bool favorite = false; int opened = 0; @override Widget build(BuildContext context) => Scaffold( appBar: AppBar(title: const Text('Pertemuan 5 · State lokal')), body: ListView(padding: const EdgeInsets.all(24), children: [ TextField(decoration: const InputDecoration(labelText: 'Nama mahasiswa'), onChanged: (value) => setState(() => name = value)), const SizedBox(height: 16), Text('Halo, ${name.trim().isEmpty ? "mahasiswa" : name.trim()}!'), const SizedBox(height: 16), Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(children: [ name menyimpan masukan pengguna. onChanged mengirim nilai terbaru. setState meminta UI membaca state kembali. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_local.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Tiga variabel berada pada class State, sehingga nilainya tidak dibuat ulang setiap build. Saat pengguna mengetik, callback menerima nilai lalu memperbarui name.

Sapaan membaca name yang sudah dirapikan. Ketika nama kosong atau hanya spasi, aplikasi memakai sapaan mahasiswa. Perhatikan bahwa kita hanya merapikan nilai untuk tampilan pada tahap ini, belum membuat form penyimpanan.

## 40. Desain 1 · Kode kartu interaktif (3/3)
 const Text('Pemrograman Mobile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), const Text('ILK3105 · Nurrahmadayeni, M.Kom.'), IconButton(tooltip: 'Ubah favorit', onPressed: () => setState(() => favorite = !favorite), icon: Icon(favorite ? Icons.favorite : Icons.favorite_border)), Text(favorite ? 'Ditandai favorit' : 'Belum favorit'), FilledButton(onPressed: () { setState(() => opened++); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Materi dipilih.'))); }, child: const Text('Lihat materi')), Text('Materi dibuka $opened kali'), ]))), ]), ); } favorite dibalik dengan !favorite. opened bertambah satu per ketukan. SnackBar memberi respons tindakan. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_local.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Ikon hati membaca nilai bool favorite. Ketika callback membalik nilainya, setState menjadwalkan build sehingga ikon dan teks status mengikuti nilai baru.

Tombol Lihat materi pada tahap A masih berupa respons lokal. Ia menambah hitungan dan menampilkan SnackBar. Pada tahap D, tindakan membuka materi akan berkembang menjadi navigasi ke detail.

## 41. Desain 1 · Penjelasan hubungan kode dan UI
 TextField menerima nama dan memanggil onChanged. State name menentukan sapaan di bawah input. State favorite menentukan ikon hati. State opened menentukan jumlah pembukaan materi. setState memperbarui tampilan setelah callback berjalan. 

Cocokkan setiap komponen pada desain dengan variabel yang membentuknya. Nama pada input menjadi sapaan, favorit menjadi ikon, dan opened menjadi hitungan.

Tombol Lihat materi di desain pertama masih menunjukkan SnackBar dan penghitung. Pada desain integrasi nanti, tombol tersebut berkembang menjadi navigasi ke halaman Detail.

## 42. Desain 1 · Demo hasil setelah kode input dan tombol
 Ketik Rani, lihat sapaan. Tekan hati dua kali, status kembali semula. Tekan Lihat materi tiga kali, hitungan menjadi 3. Coba langsung pada slide. Jalankan source Flutter untuk memeriksa implementasi pada perangkat. 

Setelah menjalankan kode, coba kembali tindakan pada demo ini dan bandingkan dengan aplikasi Flutter kalian. Coba ketiga tindakan ini sebelum melihat kode. Sapaan mengikuti teks, hati dapat dibalik, dan hitungan bertambah setiap ketukan.

Nanti cocokkan setiap perubahan dengan variabel name, favorite, dan opened. Demo ini memberi target perilaku. Implementasi Flutter tahap A ada pada main_local.dart.

## 43. Desain 1 · Run dan checkpoint
 Tindakan Hasil wajib Nama kosong Sapaan mahasiswa Ketik Rani Sapaan Rani Hati dua kali Status kembali awal Tombol 3 kali Hitungan 3 dan SnackBar flutter run -d chrome -t lib/main_local.dart 

Sekarang jalankan tahap A dan periksa empat kondisi. Catat hasil sebenarnya, bukan hanya menyatakan aplikasi berhasil terbuka.

Jika hitungan tidak bertambah, periksa callback dan setState. Jika nama selalu kembali kosong, periksa apakah variabel diletakkan di luar build. Simpan checkpoint A setelah seluruh kondisi sesuai.

## 44. Desain 2 · Katalog dan pencarian
 Ketik Mobile untuk menemukan mata kuliah. Ketik ILK3105 untuk mencari berdasarkan ID. Ketik xyz untuk melihat hasil kosong. Hapus query untuk mengembalikan semua data. Coba langsung pada slide. Jalankan source Flutter untuk memeriksa implementasi pada perangkat. 

Coba pencarian berdasarkan judul dan ID. Perhatikan bahwa ketiga data muncul kembali ketika query dihapus. Data asli tidak hilang selama proses pencarian.

Kondisi hasil kosong juga bagian dari desain. Pengguna perlu mendapat petunjuk untuk mencoba kata lain, bukan melihat layar putih tanpa penjelasan.

## 45. Desain 2 · Kode katalog (1/7)
 class Course { const Course({required this.id, required this.title, required this.lecturer, required this.description}); final String id; final String title; final String lecturer; final String description; } Buat folder lib/models. ID menjadi identitas stabil. Field final menjaga data contoh tetap. Buka kode lengkap Salin berkas lengkap Berkas: lib/models/course.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Buat folder models dan berkas course.dart. Model ini hanya mendeskripsikan satu mata kuliah, belum menyimpan state favorit. ID harus unik karena nantinya dipakai untuk navigasi dan pemilihan favorit.

Judul dapat berubah tanpa mengubah identitas. Itulah alasan kita tidak menggunakan posisi daftar atau judul sebagai kunci favorit.

## 46. Desain 2 · Kode katalog (2/7)
 const courses = [ Course(id: 'ILK3105', title: 'Pemrograman Mobile', lecturer: 'Nurrahmadayeni, M.Kom.', description: 'Pertemuan 5: interaksi pengguna, state, navigasi, dan data passing di Flutter.'), Course(id: 'DEMO02', title: 'Desain Antarmuka', lecturer: 'Dosen Contoh', description: 'Data latihan: hierarki visual, konsistensi, dan evaluasi antarmuka.'), Course(id: 'DEMO03', title: 'Proyek Aplikasi Kampus', lecturer: 'Dosen Contoh', description: 'Data latihan: pengembangan frontend aplikasi layanan kampus.'), ]; Course? findCourse(String id) { for (final course in courses) { if (course.id == id) return course; } return null; } Tambahkan data di bawah class Course. Data DEMO merupakan contoh latihan. findCourse mengembalikan null bila ID tidak ada. Buka kode lengkap Salin berkas lengkap Berkas: lib/models/course.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Tambahkan daftar courses dan fungsi findCourse setelah class. Ketika mengembangkan tugas, kalian perlu memperbanyak data dummy dengan ID yang unik.

Fungsi pencarian ini dipakai kembali oleh detail dan pemeriksaan favorit. Nilai null harus ditangani sebagai data tidak ditemukan, sehingga aplikasi tetap memberi respons yang jelas ketika menerima ID yang salah.

## 47. Desain 2 · Kode katalog (3/7)
 import 'package:flutter/foundation.dart'; import '../models/course.dart'; class CourseStore extends ChangeNotifier { final Set<String> _favorites = {}; String _name = 'Mahasiswa'; String _query = ''; String get name => _name; String get query => _query; int get favoriteCount => _favorites.length; bool isFavorite(String id) => _favorites.contains(id); List<Course> get favorites => courses.where((c) => isFavorite(c.id)).toList(); List<Course> get filtered { final q = _query.trim().toLowerCase(); return courses.where((c) => '${c.title} ${c.id}'.toLowerCase().contains(q)).toList(); } void setQuery(String value) { if (_query == value) return; Buat folder lib/state. filtered menghitung daftar dari query. Data favorit dan nama disiapkan untuk tahap berikutnya. Buka kode lengkap Salin berkas lengkap Berkas: lib/state/course_store.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Buat CourseStore pada folder state. Getter filtered mengambil query, merapikan spasi, lalu membandingkan judul dan ID menggunakan huruf kecil.

Di berkas yang sama terdapat properti nama dan favorit untuk tahap berikutnya. Saat mengetik ulang, lengkapi seluruh berkas melalui tombol source. Pada tahap B kita fokus memahami query dan filtered.

## 48. Desain 2 · Kode katalog (4/7)
 _query = value; notifyListeners(); } void toggleFavorite(String id) { if (findCourse(id) == null) return; setQuery menerima masukan field. Nilai sama tidak memerlukan notifikasi baru. notifyListeners memberi tahu pemakai store. Buka kode lengkap Salin berkas lengkap Berkas: lib/state/course_store.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Method setQuery adalah pintu perubahan query. Kita memeriksa apakah nilainya sama agar tidak mengirim notifikasi yang tidak diperlukan.

Setelah query berubah, notifyListeners memberi tahu widget yang mendengarkan store. Widget tersebut membaca filtered lagi sehingga daftar di layar mengikuti query baru. Lengkapi sisa CourseStore dari source lengkap sebelum menjalankan tahap B.

## 49. Desain 2 · Kode katalog (5/7)
 import 'package:flutter/material.dart'; import 'package:provider/provider.dart'; import 'state/course_store.dart'; void main() => runApp(ChangeNotifierProvider( create: (_) => CourseStore(), child: MaterialApp( theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006633))), home: const CatalogPage(), ), )); class CatalogPage extends StatelessWidget { Buat main_catalog.dart. Satu CourseStore membungkus MaterialApp. CatalogPage dapat membaca store. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_catalog.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada entrypoint katalog, kita meletakkan ChangeNotifierProvider di atas MaterialApp. Dengan posisi ini, halaman di dalam aplikasi dapat memperoleh CourseStore.

Import harus sesuai dengan lokasi berkas. Jika muncul kesalahan package tidak ditemukan, jalankan flutter pub get dari akar proyek. Lanjutkan class CatalogPage di berkas yang sama.

## 50. Desain 2 · Kode katalog (6/7)
 const CatalogPage({super.key}); @override Widget build(BuildContext context) { final store = context.watch<CourseStore>(); return Scaffold( appBar: AppBar(title: const Text('Katalog mata kuliah')), body: ListView(padding: const EdgeInsets.all(24), children: [ TextField( decoration: const InputDecoration( labelText: 'Cari mata kuliah', border: OutlineInputBorder()), onChanged: (value) => context.read<CourseStore>().setQuery(value), ), const SizedBox(height: 16), if (store.filtered.isEmpty) const Text('Mata kuliah tidak ditemukan.'), watch membaca data sekaligus mendengarkan. read menjalankan aksi dari callback. InputDecoration menampilkan label pencarian. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_catalog.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

CatalogPage memakai watch karena daftar harus berubah ketika store memberi notifikasi. Callback onChanged memakai read untuk memanggil setQuery.

Kedua penggunaan ini mempunyai tujuan berbeda. Kita mendengarkan saat membangun tampilan, dan menjalankan aksi saat pengguna mengetik. Jangan memanggil setQuery langsung di dalam build tanpa kejadian pengguna.

## 51. Desain 2 · Kode katalog (7/7)
 for (final course in store.filtered) Card(child: ListTile( title: Text(course.title), subtitle: Text(course.id), )), ]), ); } } Tampilkan pesan jika filtered kosong. Loop membuat Card untuk setiap Course. Selesaikan seluruh kurung pada class. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_catalog.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Bagian terakhir membentuk kartu untuk setiap data yang lolos filter. Sebelum loop, kita memeriksa kondisi kosong agar pengguna mendapat penjelasan.

Sekarang berkas katalog lengkap. Jalankan tahap B dan periksa pencarian berdasarkan judul, ID, dan kata yang tidak cocok. Gunakan source lengkap untuk mencocokkan struktur kurung jika editor menunjukkan error.

## 52. Desain 2 · Penjelasan alur pencarian
 Input mengirim query ke setQuery. Store menyimpan query dan memberi notifikasi. Getter filtered menyeleksi judul atau ID yang cocok. Halaman membuat kartu dari hasil filtered. Hasil kosong menampilkan pesan, data asli tetap tersedia. 

Baca alur ini dari input sampai hasil yang tampil. Pencarian tidak menghapus mata kuliah dari sumber data. Ia menghasilkan daftar yang sesuai query saat ini.

Ketika query dihapus, seluruh data muncul kembali. Itulah perilaku yang harus kalian periksa pada aplikasi Flutter setelah menyalin berkas desain kedua.

## 53. Desain 2 · Demo hasil setelah kode pencarian
 Ketik Mobile untuk menemukan mata kuliah. Ketik ILK3105 untuk mencari berdasarkan ID. Ketik xyz untuk melihat hasil kosong. Hapus query untuk mengembalikan semua data. Coba langsung pada slide. Jalankan source Flutter untuk memeriksa implementasi pada perangkat. 

Setelah menjalankan kode, coba kembali tindakan pada demo ini dan bandingkan dengan aplikasi Flutter kalian. Coba pencarian berdasarkan judul dan ID. Perhatikan bahwa ketiga data muncul kembali ketika query dihapus. Data asli tidak hilang selama proses pencarian.

Kondisi hasil kosong juga bagian dari desain. Pengguna perlu mendapat petunjuk untuk mencoba kata lain, bukan melihat layar putih tanpa penjelasan.

## 54. Desain 2 · Run dan checkpoint
 Tindakan Hasil wajib Ketik mobile atau MOBILE Hasil sama Ketik ILK3105 Pemrograman Mobile Ketik xyz Pesan tidak ditemukan Hapus query Semua data tampil flutter run -d chrome -t lib/main_catalog.dart 

Hentikan proses tahap A, kemudian jalankan main_catalog. Uji juga query dengan spasi di depan dan belakang karena getter filtered merapikan query sebelum mencari.

Simpan checkpoint B ketika semua hasil sesuai. Jangan melanjutkan ke favorit jika data belum tersaring dengan benar, karena tahap selanjutnya memakai store yang sama.

## 55. Desain 3 · Daftar favorit
 Tandai dua kartu, hitungan menjadi 2. Aktifkan Hanya favorit. Hapus satu favorit dari daftar tersebut. Hapus semua untuk melihat kondisi kosong. Coba langsung pada slide. Jalankan source Flutter untuk memeriksa implementasi pada perangkat. 

Coba memilih dua kartu lalu aktifkan Hanya favorit. Daftar sekarang memperlihatkan pilihan yang sama, bukan daftar favorit yang dibuat terpisah.

Hapus favorit saat filter aktif. Kartu tersebut harus hilang dari daftar dan hitungan berkurang. Jika keduanya tidak sesuai, berarti ada masalah pada sumber data atau widget yang mendengarkan.

## 56. Desain 3 · Kode favorit (1/4)
 if (!_favorites.remove(id)) _favorites.add(id); notifyListeners(); } void updateName(String value) { final clean = value.trim(); ID harus ditemukan pada data sumber. remove berhasil berarti ID sudah ada. Jika belum ada, tambahkan ID ke Set. Buka kode lengkap Salin berkas lengkap Berkas: lib/state/course_store.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Logika toggle dimulai dengan memeriksa ID. Kita menolak ID yang tidak ada dalam data contoh. Set kemudian memastikan satu ID tidak tersimpan berkali-kali.

Jika remove berhasil, ID sudah dihapus. Jika remove tidak menemukan ID, kita menambahkannya. Setelah perubahan selesai, store mengirim notifikasi sehingga ikon, hitungan, dan daftar dapat diperbarui.

## 57. Desain 3 · Kode favorit (2/4)
 import 'package:flutter/material.dart'; import 'package:provider/provider.dart'; import 'state/course_store.dart'; void main() => runApp(ChangeNotifierProvider( create: (_) => CourseStore(), child: MaterialApp( theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006633))), home: const FavoriteLab(), ), )); class FavoriteLab extends StatefulWidget { const FavoriteLab({super.key}); @override State<FavoriteLab> createState() => _FavoriteLabState(); } class _FavoriteLabState extends State<FavoriteLab> { Buat main_favorites.dart. Provider memakai CourseStore yang sama. FavoriteLab memiliki state switch lokal. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_favorites.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Bagian awal serupa dengan katalog, tetapi halaman pertama sekarang FavoriteLab. Gunakan berkas baru agar tahap sebelumnya tetap bisa dijalankan untuk perbandingan.

FavoriteLab memakai StatefulWidget karena switch tampilan mempunyai state lokal. Itu tidak bertentangan dengan penggunaan Provider. Kita memilih tempat state berdasarkan siapa yang memakainya.

## 58. Desain 3 · Kode favorit (3/4)
 bool onlyFavorites = false; @override Widget build(BuildContext context) { final store = context.watch<CourseStore>(); final items = onlyFavorites ? store.favorites : store.filtered; return Scaffold( appBar: AppBar(title: Text('${store.favoriteCount} favorit')), body: ListView(padding: const EdgeInsets.all(24), children: [ SwitchListTile(title: const Text('Hanya favorit'), value: onlyFavorites, onChanged: (value) => setState(() => onlyFavorites = value)), if (items.isEmpty) const Text('Belum ada favorit.'), onlyFavorites mengatur tampilan. items memilih favorites atau filtered. Hitungan membaca favoriteCount. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_favorites.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Switch mengubah onlyFavorites melalui setState. Data favorit tetap berasal dari store. Saat switch aktif, kita memilih getter favorites, sedangkan saat nonaktif kita menampilkan daftar filtered.

Karena tahap ini dijalankan sebagai aplikasi baru, query awal kosong. Pengguna melihat seluruh data sebelum memilih favorit. Hitungan selalu dihitung dari ID favorit dalam store.

## 59. Desain 3 · Kode favorit (4/4)
 for (final course in items) Card(child: ListTile( title: Text(course.title), subtitle: Text(course.id), trailing: IconButton( tooltip: 'Ubah favorit ${course.id}', onPressed: () => context.read<CourseStore>().toggleFavorite(course.id), icon: Icon(store.isFavorite(course.id) ? Icons.favorite : Icons.favorite_border), ), )), ]), ); } } Ikon membaca isFavorite(course.id). Callback memanggil toggleFavorite. Daftar kosong mendapat pesan. Buka kode lengkap Salin berkas lengkap Berkas: lib/main_favorites.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Setiap kartu menanyakan status favorit berdasarkan ID. Saat tombol diketuk, callback mengirim ID yang sama ke store.

Setelah notifikasi, halaman membaca items kembali. Karena itu, menghapus favorit dari tampilan Hanya favorit langsung menghilangkan kartu. Ini adalah contoh satu perubahan data yang memengaruhi beberapa bagian UI.

## 60. Desain 3 · Penjelasan konsistensi favorit
 IconButton mengirim ID Course ke toggleFavorite. Set menyimpan ID unik pilihan pengguna. Getter favorites menghasilkan daftar pilihan. Hitungan membaca jumlah ID pada Set. Switch hanya mengubah tampilan lokal, bukan isi favorit. 

Ketiga bagian utama, yaitu ikon, hitungan, dan daftar, harus membaca sumber data favorit yang sama. Switch hanya memilih daftar yang ingin dilihat.

Karena itu, menghapus favorit saat switch aktif langsung menghilangkan kartu tersebut. Perhatikan bahwa nama widget boleh berbeda, tetapi sumber datanya tetap satu.

## 61. Desain 3 · Demo hasil setelah kode favorit
 Tandai dua kartu, hitungan menjadi 2. Aktifkan Hanya favorit. Hapus satu favorit dari daftar tersebut. Hapus semua untuk melihat kondisi kosong. Coba langsung pada slide. Jalankan source Flutter untuk memeriksa implementasi pada perangkat. 

Setelah menjalankan kode, coba kembali tindakan pada demo ini dan bandingkan dengan aplikasi Flutter kalian. Coba memilih dua kartu lalu aktifkan Hanya favorit. Daftar sekarang memperlihatkan pilihan yang sama, bukan daftar favorit yang dibuat terpisah.

Hapus favorit saat filter aktif. Kartu tersebut harus hilang dari daftar dan hitungan berkurang. Jika keduanya tidak sesuai, berarti ada masalah pada sumber data atau widget yang mendengarkan.

## 62. Desain 3 · Run dan checkpoint
 Tindakan Hasil wajib Tambah 2 favorit Hitungan 2 Aktifkan Hanya favorit Hanya 2 kartu Hapus 1 favorit Kartu hilang, hitungan 1 Hapus terakhir Pesan belum ada favorit flutter run -d chrome -t lib/main_favorites.dart 

Sekarang kita menguji konsistensi tiga bagian: ikon, hitungan, dan daftar. Lakukan tindakan yang sama beberapa kali agar terlihat apakah ID ganda dapat masuk.

Jika switch berubah tetapi favorit ikut hilang, periksa apakah kalian membuat store baru. Satu instance store harus melayani halaman ini selama aplikasi berjalan.

## 63. Desain 4A · Layout navigasi
 ‹ Mata Kuliah USU ⋮ Area halaman aktif Beranda / Favorit / Profil child dari router tampil pada area ini. Beranda Favorit Profil Contoh tampilan · ilustrasi UI Flutter AppBar menampilkan judul dan hitungan favorit. Body menampilkan halaman aktif. BottomNavigationBar memiliki tiga tujuan. Tab aktif mengikuti lokasi rute. 

Desain ini merupakan pembungkus halaman utama. AppShell menerima child dari router dan menempatkannya pada body.

Lihat posisi AppBar dan navigasi bawah. Keduanya dipakai bersama oleh Beranda, Favorit, dan Profil. Setelah desain ini, kita membaca kode AppShell yang membentuk susunan tersebut.

## 64. Desain 4A · Kode layout (1/2)
 import 'package:flutter/material.dart'; import 'package:go_router/go_router.dart'; import 'package:provider/provider.dart'; import '../state/course_store.dart'; class AppShell extends StatelessWidget { const AppShell({super.key, required this.location, required this.child}); final String location; final Widget child; @override Widget build(BuildContext context) { final count = context.select<CourseStore, int>((s) => s.favoriteCount); final index = location.startsWith('/favorites') ? 1 : location.startsWith('/profile') ? 2 : 0; return Scaffold( appBar: AppBar(title: const Text('Mata Kuliah USU'), Buat folder widgets. location menentukan tab aktif. child menerima halaman dari router. Buka kode lengkap Salin berkas lengkap Berkas: lib/widgets/app_shell.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian shell navigasi ini, kita mengerjakan berkas lib/widgets/app_shell.dart. Buat folder widgets. location menentukan tab aktif. child menerima halaman dari router.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 1 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 65. Desain 4A · Kode layout (2/2)
 actions: [Padding(padding: const EdgeInsets.all(16), child: Text('$count favorit'))]), body: SafeArea(child: child), bottomNavigationBar: BottomNavigationBar( currentIndex: index, onTap: (i) => context.go(['/home', '/favorites', '/profile'][i]), items: const [ BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'), BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'), BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'), ], ), ); } } Scaffold menyediakan AppBar dan body. onTap mengganti rute tab. Hitungan membaca favoriteCount. Buka kode lengkap Salin berkas lengkap Berkas: lib/widgets/app_shell.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian shell navigasi ini, kita mengerjakan berkas lib/widgets/app_shell.dart. Scaffold menyediakan AppBar dan body. onTap mengganti rute tab. Hitungan membaca favoriteCount.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 2 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 66. Desain 4B · Kartu pada daftar
 ‹ Kartu mata kuliah ⋮ Pemrograman Mobile ♡ ILK3105 Nurrahmadayeni, M.Kom. Lihat materi Contoh tampilan · ilustrasi UI Flutter Ikon hati berada di sisi informasi Course. Judul, ID, dan dosen berasal dari model. Lihat materi membuka detail dengan ID. Kartu yang sama dipakai Beranda dan Favorit. 

Perhatikan kartu ini sebagai komponen yang dipakai ulang. Kartu menerima data Course dan informasi asal halaman.

Ikon hati mengubah favorit, sedangkan tombol Lihat materi mengirim ID ke router. Dua aksi ini mempunyai tujuan berbeda meskipun berada pada kartu yang sama.

## 67. Desain 4B · Kode kartu (1/3)
 import 'package:flutter/material.dart'; import 'package:go_router/go_router.dart'; import 'package:provider/provider.dart'; import '../models/course.dart'; import '../state/course_store.dart'; class CourseCard extends StatelessWidget { const CourseCard({super.key, required this.course, required this.from}); final Course course; final String from; @override Widget build(BuildContext context) { final favorite = context.select<CourseStore, bool>((s) => s.isFavorite(course.id)); void openDetail() => context.pushNamed('course', pathParameters: {'id': course.id}, queryParameters: {'from': from}); return Card( CourseCard menerima Course dan asal halaman. select mendengarkan status hati untuk ID ini. pushNamed mengirim path dan query parameter. Buka kode lengkap Salin berkas lengkap Berkas: lib/widgets/course_card.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian kartu interaktif ini, kita mengerjakan berkas lib/widgets/course_card.dart. CourseCard menerima Course dan asal halaman. select mendengarkan status hati untuk ID ini. pushNamed mengirim path dan query parameter.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 1 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 68. Desain 4B · Kode kartu (2/3)
 margin: const EdgeInsets.only(bottom: 16), child: Padding( padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Row(children: [ const Icon(Icons.school, size: 36, color: Color(0xFF006633)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Text(course.title, style: Theme.of(context).textTheme.titleMedium), Text(course.id), Text(course.lecturer), ])), IconButton( tooltip: favorite ? 'Hapus dari favorit' : 'Tambah ke favorit', Card memakai susunan UI Pertemuan 4. Expanded memberi ruang untuk teks panjang. Tampilkan judul, ID, dan dosen. Buka kode lengkap Salin berkas lengkap Berkas: lib/widgets/course_card.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian kartu interaktif ini, kita mengerjakan berkas lib/widgets/course_card.dart. Card memakai susunan UI Pertemuan 4. Expanded memberi ruang untuk teks panjang. Tampilkan judul, ID, dan dosen.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 2 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 69. Desain 4B · Kode kartu (3/3)
 onPressed: () => context.read<CourseStore>().toggleFavorite(course.id), icon: Icon(favorite ? Icons.favorite : Icons.favorite_border), ), ]), const SizedBox(height: 12), FilledButton(onPressed: openDetail, child: const Text('Lihat materi')), ]), ), ); } } IconButton mengubah favorit. Lihat materi membuka detail. Satu kartu dipakai Beranda dan Favorit. Buka kode lengkap Salin berkas lengkap Berkas: lib/widgets/course_card.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian kartu interaktif ini, kita mengerjakan berkas lib/widgets/course_card.dart. IconButton mengubah favorit. Lihat materi membuka detail. Satu kartu dipakai Beranda dan Favorit.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 3 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 70. Desain 4C · Halaman Beranda
 ‹ Beranda ⋮ Halo, Mahasiswa! Cari mata kuliah Contoh: Mobile Pemrograman Mobile ♡ ILK3105 · Lihat materi Contoh tampilan · ilustrasi UI Flutter Sapaan membaca nama bersama. Pencarian memakai query dari store. Daftar menampilkan CourseCard. Pesan muncul jika hasil pencarian kosong. 

Beranda menggabungkan sapaan, input pencarian, dan komponen kartu yang sudah disusun. Kita memakai kembali logika katalog pada desain kedua.

Perbedaannya, kartu sekarang sudah terhubung ke Detail dan favorit bersama. Source HomePage memperlihatkan bagaimana komponen-komponen tersebut ditempatkan dalam ListView.

## 71. Desain 4C · Kode Beranda (1/2)
 import 'package:flutter/material.dart'; import 'package:go_router/go_router.dart'; import 'package:provider/provider.dart'; import '../models/course.dart'; import '../state/course_store.dart'; import '../widgets/course_card.dart'; class HomePage extends StatelessWidget { const HomePage({super.key}); @override Widget build(BuildContext context) { final store = context.watch<CourseStore>(); final visible = store.filtered; return ListView(padding: const EdgeInsets.all(24), children: [ Text('Halo, ${store.name}!', style: Theme.of(context).textTheme.headlineSmall), const SizedBox(height: 8), const Text('Pilih mata kuliah untuk belajar.'), const SizedBox(height: 16), Buat folder pages. watch memperoleh store dan perubahan data. Sapaan membaca nama bersama. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/course_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian halaman beranda ini, kita mengerjakan berkas lib/pages/course_pages.dart. Buat folder pages. watch memperoleh store dan perubahan data. Sapaan membaca nama bersama.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 1 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 72. Desain 4C · Kode Beranda (2/2)
 TextFormField( initialValue: store.query, decoration: const InputDecoration(labelText: 'Cari mata kuliah', prefixIcon: Icon(Icons.search)), onChanged: (value) => context.read<CourseStore>().setQuery(value), ), const SizedBox(height: 16), if (visible.isEmpty) const Text('Mata kuliah tidak ditemukan. Coba kata lain.'), for (final course in visible) CourseCard(course: course, from: 'home'), ]); } } initialValue mengambil query tersimpan. onChanged mengubah query di store. CourseCard menampilkan hasil filter. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/course_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian halaman beranda ini, kita mengerjakan berkas lib/pages/course_pages.dart. initialValue mengambil query tersimpan. onChanged mengubah query di store. CourseCard menampilkan hasil filter.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 2 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 73. Desain 4D · Halaman Favorit
 ‹ Favorit saya ⋮ Pemrograman Mobile ♥ ILK3105 · Lihat materi Jika kosong: Belum ada favorit. Tekan ikon hati pada kartu. Contoh tampilan · ilustrasi UI Flutter Daftar membaca store.favorites. CourseCard tetap memakai ID yang sama. Menghapus hati memperbarui daftar ini. Kondisi tanpa pilihan mempunyai pesan. 

Desain Favorit menggunakan kartu yang sama dengan Beranda. Data yang diberikan berbeda, yaitu hasil getter favorites.

Karena komponen dan sumber statusnya sama, tindakan dari halaman lain tetap tercermin di sini. Bandingkan source FavoritesPage dengan HomePage untuk melihat bagian yang digunakan ulang.

## 74. Desain 4D · Kode Favorit (1/1)
 const FavoritesPage({super.key}); @override Widget build(BuildContext context) { final items = context.watch<CourseStore>().favorites; return ListView(padding: const EdgeInsets.all(24), children: [ Text('Favorit saya', style: Theme.of(context).textTheme.headlineSmall), const SizedBox(height: 16), if (items.isEmpty) const Text('Belum ada favorit. Tekan ikon hati pada kartu.'), for (final course in items) CourseCard(course: course, from: 'favorites'), ]); } } class CourseDetailPage extends StatelessWidget { Tambahkan class di bawah HomePage. favorites mengambil data berdasarkan ID pilihan. Kondisi kosong tetap mempunyai penjelasan. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/course_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian halaman favorit ini, kita mengerjakan berkas lib/pages/course_pages.dart. Tambahkan class di bawah HomePage. favorites mengambil data berdasarkan ID pilihan. Kondisi kosong tetap mempunyai penjelasan.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 1 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 75. Desain 4E · Detail mata kuliah
 ‹ Detail mata kuliah ⋮ Pemrograman Mobile Nurrahmadayeni, M.Kom. Interaksi, state, navigasi, dan data passing. Tambah favorit Contoh tampilan · ilustrasi UI Flutter AppBar menyediakan aksi kembali. ID dari rute menentukan Course yang ditampilkan. Favorit membaca dan mengubah store bersama. ID salah menampilkan data tidak ditemukan. 

Desain Detail menampilkan informasi yang lebih lengkap. Data tidak diambil berdasarkan urutan kartu, melainkan menggunakan ID dari rute.

Perhatikan tombol kembali dan favorit. Tombol kembali mempunyai fallback jika halaman dibuka langsung, sedangkan favorit menggunakan store yang sama dengan halaman utama.

## 76. Desain 4E · Kode Detail (1/2)
 final String id; final String? from; @override Widget build(BuildContext context) { final course = findCourse(id); final favorite = context.select<CourseStore, bool>((s) => s.isFavorite(id)); return Scaffold( appBar: AppBar(title: const Text('Detail mata kuliah'), leading: IconButton( tooltip: 'Kembali', icon: const Icon(Icons.arrow_back), onPressed: () { if (context.canPop()) { context.pop(); } else { context.go('/home'); } }, )), body: SafeArea(child: ListView(padding: const EdgeInsets.all(24), children: [ if (course == null) ...[ const Text('Mata kuliah tidak ditemukan.'), Text('ID: $id'), ] else ...[ Detail menerima ID dan asal opsional. findCourse melakukan lookup. Kembali memakai pop atau fallback Beranda. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/course_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian halaman detail ini, kita mengerjakan berkas lib/pages/course_pages.dart. Detail menerima ID dan asal opsional. findCourse melakukan lookup. Kembali memakai pop atau fallback Beranda.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 1 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 77. Desain 4E · Kode Detail (2/2)
 Text(course.title, style: Theme.of(context).textTheme.headlineSmall), const SizedBox(height: 8), Text(course.lecturer), const SizedBox(height: 16), Text(course.description), const SizedBox(height: 8), Text('Asal halaman: ${from ?? "tautan langsung"}'), const SizedBox(height: 16), FilledButton.icon( onPressed: () => context.read<CourseStore>().toggleFavorite(id), icon: Icon(favorite ? Icons.favorite : Icons.favorite_border), label: Text(favorite ? 'Hapus favorit' : 'Tambah favorit'), ), ], ])), ); } } Tangani ID yang tidak ditemukan. Tampilkan data Course yang cocok. Tombol hati menggunakan store yang sama. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/course_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Pada bagian halaman detail ini, kita mengerjakan berkas lib/pages/course_pages.dart. Tangani ID yang tidak ditemukan. Tampilkan data Course yang cocok. Tombol hati menggunakan store yang sama.

Cocokkan cuplikan dengan berkas lengkap melalui tombol source. Bagian 2 ini merupakan lanjutan dalam berkas yang sama. Setelah selesai, periksa nama class dan import sebelum berpindah. Kita menjalankan integrasi setelah halaman profil, router, dan root aplikasi juga lengkap.

## 78. Desain 5 · Profil dan form edit
 ‹ Edit profil ⋮ Nama sebelumnya: Mahasiswa Nama mahasiswa Rani Draf belum mengubah nama tersimpan. Batal Simpan Contoh tampilan · ilustrasi UI Flutter Halaman Profil menampilkan nama tersimpan. Edit membuka form dengan nilai awal. Nama setelah trim harus 2–40 karakter. Batal mempertahankan nama lama. Simpan mengembalikan hasil ke Profil. 

Lihat perbedaan nama lama dan teks yang sedang diketik. Rani pada input masih menjadi draf sampai Simpan berhasil.

Setelah desain ini kita membaca source halaman Profil dan EditProfilePage dalam berkas yang sama. Perhatikan bagaimana pemanggil menunggu hasil dan kapan store resmi diperbarui.

## 79. Desain 5 · Kondisi form salah dan benar
 ‹ Nama belum valid ⋮ Nama mahasiswa R Nama minimal 2 karakter. Batal Simpan Contoh tampilan · ilustrasi UI Flutter ‹ Nama valid ⋮ Nama mahasiswa Rani ✓ Nama berhasil diperbarui. Contoh tampilan · ilustrasi UI Flutter Error menghentikan penyimpanan. Pesan sukses diberikan setelah pembaruan selesai. 

Saat tombol Simpan ditekan, kita memanggil validate terlebih dahulu. Form akan memeriksa validator pada field yang terdaftar. Jika hasilnya false, proses berhenti sehingga data yang belum memenuhi aturan tidak dilanjutkan.

Jika valid, kita mengambil teks yang sudah dirapikan. Pesan kesalahan harus membantu pengguna memperbaiki isinya. Misalnya, Nama minimal dua karakter lebih jelas daripada sekadar Input salah. Pada proyek ini penyimpanan hanya ke state dalam memori. Jika nanti menggunakan server, server tetap harus memvalidasi data meskipun form di aplikasi sudah melakukan pemeriksaan.

Sekarang lihat perubahan dari R menjadi Rani. Saat nama masih satu huruf, proses berhenti. Setelah nama diperbaiki dan Simpan ditekan lagi, validator mengembalikan null sehingga proses dapat berlanjut. Pesan sukses pada ilustrasi adalah respons setelah pembaruan berhasil; validator sendiri tidak otomatis membuat pesan sukses tersebut.

## 80. Desain 5 · Kode profil dan form (1/7)
 import 'package:flutter/material.dart'; import 'package:go_router/go_router.dart'; import 'package:provider/provider.dart'; import '../state/course_store.dart'; class ProfilePage extends StatelessWidget { const ProfilePage({super.key}); @override Widget build(BuildContext context) { final name = context.select<CourseStore, String>((s) => s.name); return ListView(padding: const EdgeInsets.all(24), children: [ Text(name, style: Theme.of(context).textTheme.headlineSmall), const SizedBox(height: 16), FilledButton( onPressed: () async { final result = await context.push<String>('/edit-profile', extra: name); if (!context.mounted || result == null) return; context.read<CourseStore>().updateName(result); Profil membaca nama dengan select. push menunggu hasil Edit Profil. Periksa mounted sebelum memakai context kembali. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/profile_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Kita melanjutkan berkas profile_pages.dart. Profil membaca nama dengan select. push<String> menunggu hasil Edit Profil. Periksa mounted sebelum memakai context kembali.

Perhatikan perbedaan nilai draf dengan nilai pada CourseStore. Selama pengguna mengetik, controller menyimpan draf. Pembaruan store baru dilakukan setelah hasil form diterima atau melalui fallback ketika halaman dibuka langsung. Cek source lengkap untuk melihat hubungan antarbagian.

## 81. Desain 5 · Kode profil dan form (2/7)
 ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Nama berhasil diperbarui.'))); }, child: const Text('Edit profil'), ), const SizedBox(height: 16), const Text('Data latihan tersimpan di memori. Refresh atau restart akan mereset data.'), ]); } } class EditProfilePage extends StatefulWidget { const EditProfilePage({super.key, this.initialName}); final String? initialName; @override State<EditProfilePage> createState() => _EditProfilePageState(); } Hasil valid memperbarui store. SnackBar memberi konfirmasi. EditProfilePage menerima initialName opsional. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/profile_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Kita melanjutkan berkas profile_pages.dart. Hasil valid memperbarui store. SnackBar memberi konfirmasi. EditProfilePage menerima initialName opsional.

Perhatikan perbedaan nilai draf dengan nilai pada CourseStore. Selama pengguna mengetik, controller menyimpan draf. Pembaruan store baru dilakukan setelah hasil form diterima atau melalui fallback ketika halaman dibuka langsung. Cek source lengkap untuk melihat hubungan antarbagian.

## 82. Desain 5 · Kode profil dan form (3/7)
 class _EditProfilePageState extends State<EditProfilePage> { final _formKey = GlobalKey<FormState>(); late final TextEditingController _nameController; @override void initState() { super.initState(); _nameController = TextEditingController( text: widget.initialName ?? context.read<CourseStore>().name); } @override void dispose() { _nameController.dispose(); super.dispose(); } GlobalKey disimpan pada State. Controller diisi saat initState. dispose membebaskan controller. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/profile_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Kita melanjutkan berkas profile_pages.dart. GlobalKey disimpan pada State. Controller diisi saat initState. dispose membebaskan controller.

Perhatikan perbedaan nilai draf dengan nilai pada CourseStore. Selama pengguna mengetik, controller menyimpan draf. Pembaruan store baru dilakukan setelah hasil form diterima atau melalui fallback ketika halaman dibuka langsung. Cek source lengkap untuk melihat hubungan antarbagian.

## 83. Desain 5 · Kode profil dan form (4/7)
 void _save() { if (!(_formKey.currentState?.validate() ?? false)) return; final name = _nameController.text.trim(); if (context.canPop()) { context.pop(name); // Hasil diterima oleh pemanggil push<String>. } else { // Fallback jika halaman edit dibuka lewat URL langsung. context.read<CourseStore>().updateName(name); context.go('/profile'); } } validate memeriksa semua field. pop(name) mengembalikan hasil. URL langsung memakai fallback simpan ke store. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/profile_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Kita melanjutkan berkas profile_pages.dart. validate memeriksa semua field. pop(name) mengembalikan hasil. URL langsung memakai fallback simpan ke store.

Perhatikan perbedaan nilai draf dengan nilai pada CourseStore. Selama pengguna mengetik, controller menyimpan draf. Pembaruan store baru dilakukan setelah hasil form diterima atau melalui fallback ketika halaman dibuka langsung. Cek source lengkap untuk melihat hubungan antarbagian.

## 84. Desain 5 · Kode profil dan form (5/7)
 @override Widget build(BuildContext context) => Scaffold( appBar: AppBar(title: const Text('Edit profil'), leading: IconButton( tooltip: 'Batal', icon: const Icon(Icons.close), onPressed: () { if (context.canPop()) { context.pop(); } else { context.go('/profile'); } }, )), body: SafeArea(child: SingleChildScrollView( padding: const EdgeInsets.all(24), child: Form(key: _formKey, child: Column(children: [ TextFormField( controller: _nameController, maxLength: 40, decoration: const InputDecoration(labelText: 'Nama mahasiswa'), autovalidateMode: AutovalidateMode.onUserInteraction, Batal tidak memperbarui store. SingleChildScrollView membantu saat keyboard muncul. Form mengikat key dan field. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/profile_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Kita melanjutkan berkas profile_pages.dart. Batal tidak memperbarui store. SingleChildScrollView membantu saat keyboard muncul. Form mengikat key dan field.

Perhatikan perbedaan nilai draf dengan nilai pada CourseStore. Selama pengguna mengetik, controller menyimpan draf. Pembaruan store baru dilakukan setelah hasil form diterima atau melalui fallback ketika halaman dibuka langsung. Cek source lengkap untuk melihat hubungan antarbagian.

## 85. Desain 5 · Kode profil dan form (6/7)
 validator: (value) { final name = (value ?? '').trim(); if (name.length < 2) return 'Nama minimal 2 karakter.'; if (name.length > 40) return 'Nama maksimal 40 karakter.'; return null; }, onFieldSubmitted: (_) => _save(), ), const SizedBox(height: 16), FilledButton(onPressed: _save, child: const Text('Simpan')), ])), )), ); } validator mengembalikan teks error atau null. Enter dan tombol Simpan memanggil _save. Lengkapi penutup widget dan class. Buka kode lengkap Salin berkas lengkap Berkas: lib/pages/profile_pages.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Kita melanjutkan berkas profile_pages.dart. validator mengembalikan teks error atau null. Enter dan tombol Simpan memanggil _save. Lengkapi penutup widget dan class.

Perhatikan perbedaan nilai draf dengan nilai pada CourseStore. Selama pengguna mengetik, controller menyimpan draf. Pembaruan store baru dilakukan setelah hasil form diterima atau melalui fallback ketika halaman dibuka langsung. Cek source lengkap untuk melihat hubungan antarbagian.

## 86. Desain 5 · Kode profil dan form (7/7)
 if (clean.length < 2 || clean.length > 40 || clean == _name) return; _name = clean; notifyListeners(); } } trim merapikan spasi luar. Store memeriksa batas nama sekali lagi. notifyListeners memperbarui Profil dan Beranda. Buka kode lengkap Salin berkas lengkap Berkas: lib/state/course_store.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Method updateName menerima hasil yang sudah dikembalikan form. Store tetap memeriksa aturan data agar perubahan melalui pemanggil lain juga mengikuti batas yang sama.

Jika nilainya tidak valid atau sama dengan nama sebelumnya, method berhenti. Jika berubah, store menyimpan nama dan mengirim notifikasi. Sekarang kalian dapat menelusuri alur lengkap dari controller, validator, hasil pop, sampai pembaruan sapaan.

## 87. Desain 5 · Penjelasan alur Simpan/Batal
 Controller memegang draf nama. Form memeriksa validator saat Simpan. pop(name) mengirim hasil yang valid. Pemanggil menerima hasil dan memanggil updateName. Batal mengembalikan tanpa hasil, sehingga nama lama tetap. 

Sekarang hubungkan desain form dengan kode yang telah kita lihat. Controller menyimpan draf, validator memeriksa aturan, dan pop membawa hasil ketika pengguna menyimpan.

Pembatalan mengikuti alur yang berbeda karena tidak membawa nama baru. Inilah sebabnya data bersama tidak boleh diperbarui pada setiap ketikan form edit.

## 88. Demo: form dan pesan kesalahan
 ‹ Edit profil ⋮ Coba ketik langsung di sini Nama mahasiswa Simpan nama Coba kosong, satu huruf, lalu nama yang valid. Demo interaktif HTML · simulasi perilaku Flutter 1 · Kosong atau spasi Tekan Simpan → masukan ditolak. 2 · Ketik R Satu karakter → pesan kesalahan. 3 · Ketik Rani Nama valid → konfirmasi berhasil. Aturan proyek: minimal 2 karakter setelah trim, maksimal 40 karakter. 

Sekarang coba perhatikan respons form. Jika kita langsung menekan Simpan saat kosong, form seharusnya menunjukkan kesalahan. Kemudian coba satu huruf, dan terakhir nama yang memenuhi aturan.

Apa yang berubah pada pesannya? Pengguna harus dapat memahami apakah datanya diterima atau perlu diperbaiki. Coba juga memasukkan spasi di depan dan belakang nama. Kita merapikan spasi luar sebelum menyimpan. Demo pada slide ini menggunakan HTML untuk menunjukkan perilaku; kode Flutter yang setara ada pada halaman Edit Profil di paket proyek.

Form di kiri dapat langsung kita ketik. Ikuti tiga percobaan di kanan secara berurutan. Perhatikan bahwa masukan tidak dihapus ketika salah, sehingga pengguna cukup memperbaikinya.

## 89. Integrasi · Desain hubungan antarhalaman
 Lokasi Halaman Posisi /home Beranda Di dalam shell. /favorites Favorit Di dalam shell. /profile Profil Di dalam shell. /course/:id Detail mata kuliah Di luar shell. /edit-profile Form edit nama Di luar shell. 

Ini peta rute yang digunakan pada proyek kita. Tiga halaman utama berada dalam shell yang sama agar menggunakan AppBar dan navigasi bawah bersama. Detail serta Edit Profil diletakkan di luar shell.

Keputusan tersebut membuat navigasi bawah tidak tampil pada Detail dan Edit Profil. Kita ingin pengguna fokus pada informasi atau form, lalu kembali ke konteks asal. Penempatan ini merupakan keputusan desain proyek. Aplikasi lain boleh mempertahankan navigasi bawah pada detail jika memang sesuai dengan alur yang dirancang.

## 90. Integrasi · Kode router (1/2)
 import 'package:flutter/material.dart'; import 'package:go_router/go_router.dart'; import 'pages/course_pages.dart'; import 'pages/profile_pages.dart'; import 'widgets/app_shell.dart'; final appRouter = GoRouter( initialLocation: '/home', errorBuilder: (context, state) => Scaffold( appBar: AppBar(title: const Text('Halaman tidak ditemukan')), body: Center(child: FilledButton( onPressed: () => context.go('/home'), child: const Text('Ke beranda'))), ), routes: [ ShellRoute( builder: (context, state, child) => AppShell( Import seluruh halaman dan AppShell. initialLocation membuka Beranda. ShellRoute mempertahankan layout tab. Buka kode lengkap Salin berkas lengkap Berkas: lib/app_router.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Kini hubungkan halaman melalui router. ShellRoute memasukkan child ke AppShell, sehingga Beranda, Favorit, dan Profil memakai layout navigasi yang sama.

Error builder memberi jalan pulang ketika rute tidak dikenali. Selesaikan rute detail dan edit pada bagian berikutnya sebelum menutup daftar routes.

## 91. Integrasi · Kode router (2/2)
 location: state.uri.path, child: child), routes: [ GoRoute(path: '/home', builder: (_, __) => const HomePage()), GoRoute(path: '/favorites', builder: (_, __) => const FavoritesPage()), GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()), ], ), // Detail di luar shell: bottom navigation tidak ikut tampil. GoRoute(path: '/course/:id', name: 'course', builder: (context, state) => CourseDetailPage(id: state.pathParameters['id'] ?? '', from: state.uri.queryParameters['from'])), GoRoute(path: '/edit-profile', builder: (context, state) => EditProfilePage(initialName: state.extra is String ? state.extra as String : null)), ], ); Path :id membawa identitas mata kuliah. Query from bersifat opsional. extra diperiksa tipenya sebelum dipakai. Buka kode lengkap Salin berkas lengkap Berkas: lib/app_router.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Detail ditempatkan di luar shell agar bottom navigation tidak tampil di layar detail. ID berasal dari path, sedangkan informasi asal halaman dibaca dari query.

Untuk edit profil, extra boleh tidak tersedia, misalnya saat halaman dibuka langsung. Karena itu, kita memeriksa tipenya dan memberikan null jika tidak cocok. Halaman edit kemudian mengambil nama dari store sebagai fallback.

## 92. Integrasi · Kode aplikasi (1/2)
 import 'package:flutter/material.dart'; import 'package:provider/provider.dart'; import 'app_router.dart'; import 'state/course_store.dart'; void main() => runApp(ChangeNotifierProvider( create: (_) => CourseStore(), child: const CourseApp(), )); class CourseApp extends StatelessWidget { const CourseApp({super.key}); @override Provider membungkus seluruh aplikasi. ThemeData menyatukan gaya input dan warna. MaterialApp.router memakai appRouter. Buka kode lengkap Salin berkas lengkap Berkas: lib/main.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Bagian terakhir memasang root aplikasi integrasi. Satu CourseStore dibagikan ke seluruh halaman. Tema input yang sama membuat outline field konsisten.

Sekarang seluruh import yang dipakai main.dart sudah tersedia. Hentikan entrypoint sebelumnya dan jalankan lib/main.dart. Jika muncul class tidak dikenal, cocokkan nama serta lokasi berkas dengan daftar source.

## 93. Integrasi · Kode aplikasi (2/2)
 Widget build(BuildContext context) => MaterialApp.router( title: 'Mata Kuliah USU', debugShowCheckedModeBanner: false, theme: ThemeData( useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006633)), scaffoldBackgroundColor: const Color(0xFFF1F7F1), inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()), ), routerConfig: appRouter, ); } ThemeData menetapkan warna USU. InputDecorationTheme menyatukan outline. routerConfig menghubungkan appRouter. Buka kode lengkap Salin berkas lengkap Berkas: lib/main.dart · Potongan kode dibahas bertahap; tombol membuka berkas lengkap. 

Lanjutkan build MaterialApp.router pada bagian ini. Tema berlaku untuk seluruh aplikasi, sedangkan routerConfig memakai konfigurasi rute yang telah kita susun.

Sekarang class CourseApp lengkap. Jalankan entrypoint utama dan cocokkan tampilannya dengan demo target.

## 94. Demo ulang aplikasi akhir
 Cari Mobile dan tandai favorit. Buka Favorit, lalu Detail. Hapus favorit dan kembali. Edit nama, coba Batal lalu Simpan. Demo hasil integrasi. Cocokkan dengan flutter run -d chrome -t lib/main.dart. 

Sekarang coba kembali seluruh alur langsung pada demo ini. Cari mata kuliah, tambahkan favorit, lalu buka detail dari tab Favorit. Hapus favorit dan periksa daftar kembali.

Lanjutkan dengan edit nama. Bandingkan hasil Batal dan Simpan. Kali ini jelaskan juga file, method, dan state yang bekerja di balik setiap tindakan. Demo HTML ini menjadi pembanding perilaku untuk aplikasi Flutter yang kalian jalankan.

## 95. Integrasi · Run dan checkpoint navigasi
 Tindakan Hasil wajib Tab Favorit / Profil Halaman dan tab aktif sesuai Detail ILK3105 Judul Pemrograman Mobile Kembali dari detail Alur kembali tersedia ID salah Pesan data tidak ditemukan flutter run -d chrome -t lib/main.dart 

Kita mulai pengujian integrasi dari navigasi. Buka detail dari Beranda lalu dari Favorit. Keduanya harus memperlihatkan data dengan ID yang sama.

Periksa juga kondisi ID salah. Halaman harus memberi penjelasan, bukan memaksa membaca data null. Simpan hasil pengujian agar kalian dapat menunjukkan bukti saat demonstrasi.

## 96. Integrasi · Checkpoint nama dan favorit
 Tindakan Hasil wajib Favorit di detail Beranda dan Favorit ikut berubah Edit R lalu Simpan Pesan minimal 2 karakter Edit Rani lalu Batal Nama lama tetap Simpan “ Rani ” Profil dan sapaan menjadi Rani flutter analyze flutter test test/course_store_test.dart 

Setelah navigasi benar, uji konsistensi state. Nama yang valid harus muncul pada Profil dan Beranda. Membatalkan edit harus mempertahankan nilai lama.

Perintah analyze memeriksa kode, sedangkan test yang disebutkan memeriksa model store. Pengujian UI melalui perangkat tetap perlu dilakukan. Paket ini perlu kalian jalankan pada Flutter SDK di lingkungan kuliah karena kompilasi Flutter belum diverifikasi pada lingkungan penyusunan materi.

## 97. Debugging: input dan state
 Gejala Pemeriksaan Teks tidak berubah Apakah state diperbarui dan ada mekanisme rebuild? Nilai kembali ke awal Apakah variabel atau controller dibuat di build? ProviderNotFoundException Apakah context berada di bawah Provider yang benar? Favorit berbeda antarhalaman Apakah setiap halaman membuat store sendiri? setState after dispose Periksa lifecycle, callback tertunda, dan mounted. 

Jika antarmuka tidak berubah, mulai dari alur data. Apakah callback benar-benar dipanggil? Apakah nilai state berubah? Apakah widget mendengarkan perubahan tersebut? Menjawab urutan ini lebih membantu daripada mengganti banyak kode sekaligus.

Jika muncul ProviderNotFoundException, periksa posisi Provider dan context yang dipakai. Jika favorit berbeda antarhalaman, cari kemungkinan ada beberapa instance store. Sementara itu, pesan setState setelah dispose menunjukkan pekerjaan yang mencoba memperbarui State yang sudah tidak aktif. Catat pesan error lengkap agar pemeriksaannya tepat.

## 98. Debugging: navigasi dan package
 Gejala Pemeriksaan Halaman tidak ditemukan Cocokkan path, nama rute, dan kapitalisasi. Cast extra gagal Periksa tipe dan sediakan fallback null. Tab aktif tidak sesuai Turunkan index dari lokasi rute. Tidak bisa kembali Periksa canPop dan fallback tujuan utama. pub get gagal Baca konflik versi SDK atau dependency. 

Pada masalah navigasi, cocokkan lokasi yang dikirim dengan rute yang didefinisikan. Perbedaan nama atau huruf besar-kecil dapat menghasilkan tujuan yang tidak dikenali. Untuk extra, periksa jenis data sebelum melakukan cast.

Jika tombol kembali tidak bekerja setelah membuka tautan langsung, stack sebelumnya mungkin tidak ada. Itulah alasan kita menyediakan fallback. Untuk kegagalan pub get, jangan langsung menghapus seluruh batas versi. Baca dependency mana yang tidak cocok dengan SDK, lalu sesuaikan lingkungan atau versi secara terencana bersama kelompok.

## 99. III · Tugas lanjutan menuju UTS
 Individu: perluasan aplikasi Study Planner untuk menguji pemahaman sendiri. Kelompok: penyelesaian seluruh frontend sesuai ide aplikasi. Kerjakan fitur berdasarkan milestone dan bukti perilaku. Gunakan kriteria selesai, matriks uji, dan paket demonstrasi yang ditetapkan. 

Praktik memberi fondasi yang bisa kalian pakai kembali. Tugas individu memastikan setiap mahasiswa dapat mengembangkan alur sendiri, sedangkan tugas kelompok menyelesaikan frontend proyek yang lebih luas.

Ketentuan tugas berikut tetap menjadi target menuju UTS. Gunakan source pertemuan sebagai referensi, kemudian perluas model dan perilakunya sesuai kebutuhan tugas.

## 100. Tugas individu: aplikasi aktivitas belajar
 Kembangkan proyek menjadi “Study Planner” pribadi. Minimal 6 layar: Beranda, Daftar aktivitas, Detail, Tambah/Edit, Favorit, Profil. Minimal 10 data dummy dengan ID unik dan kategori. CRUD aktivitas berjalan pada state di memori. Gunakan Provider, router, validasi, dan komponen kartu yang dapat dipakai ulang. 

Tugas individu sekarang mengembangkan kemampuan setiap orang sampai satu aplikasi kecil benar-benar berfungsi. Tema Study Planner masih dekat dengan mata kuliah, sehingga model Course dapat menjadi konteks untuk aktivitas belajar.

Enam layar ini harus mempunyai fungsi. Tambah dan Edit boleh memakai satu layar form dengan mode berbeda. CRUD berarti kalian bisa membuat, membaca, mengubah, dan menghapus aktivitas selama sesi aplikasi berjalan. Backend belum menjadi kewajiban pada tahap ini.

## 101. Individu: kontrak data aktivitas
 Field Aturan Widget / penggunaan id Unik, stabil, dibuat aplikasi Identitas detail dan edit title Wajib, 3–80 karakter TextFormField category Salah satu pilihan tersedia DropdownButtonFormField dueDate Wajib, tanggal dipilih pengguna Date picker description Opsional, maksimal 300 karakter Input multiline isDone / isFavorite Nilai boolean Checkbox / IconButton 

Gunakan kontrak ini sebelum menambah widget. ID harus tetap sama ketika aktivitas diedit. Judul dan deskripsi mempunyai batas agar UI serta pesan validasinya jelas.

Tanggal harus dipilih melalui date picker dan ditampilkan dalam format yang mudah dipahami. Aktivitas selesai dan favorit merupakan dua status berbeda. Jangan memakai satu variabel untuk kedua makna tersebut.

## 102. Individu: perilaku yang wajib selesai
 Tambah valid memasukkan aktivitas baru ke daftar. Edit membuka data lama dan menyimpan perubahan pada ID yang sama. Batal tambah/edit tidak mengubah data tersimpan. Hapus memakai dialog konfirmasi dan memperbarui daftar. Pencarian dapat digabung dengan filter kategori/status. Favorit dan jumlah aktivitas selesai konsisten antarlayar. 

Periksa setiap perilaku ini sebagai satu alur. Setelah menambah aktivitas, buka detailnya, edit judulnya, lalu kembali ke daftar. Semua layar harus menunjukkan nilai yang sama.

Pada penghapusan, konfirmasi menjadi kesempatan pengguna membatalkan. Setelah penghapusan berhasil, detail yang memakai ID tersebut juga harus ditangani jika diakses kembali. Filter tidak boleh menghapus data asli.

## 103. Individu: urutan pengerjaan
 Urutan Pekerjaan Bukti selesai 1 Model dan 10 data dummy Daftar dan detail sesuai ID 2 Form tambah + validator Data baru muncul 3 Form edit + Batal Perubahan pada ID yang sama 4 Hapus + dialog Batal aman, hapus berhasil 5 Filter, favorit, status selesai Hitungan konsisten 6 Uji ukuran layar dan edge case Catatan uji beserta perbaikan 

Kerjakan tugas berdasarkan urutan ini. Jangan menambahkan semua fitur sekaligus karena kesalahan akan sulit dilacak. Selesaikan daftar serta detail terlebih dahulu, lalu form tambah, kemudian edit dan hapus.

Setiap tahap mempunyai bukti perilaku. Kalian boleh membuat commit atau salinan checkpoint setelah tahap selesai. Bukti tersebut membantu menjelaskan proses kerja, bukan hanya menunjukkan hasil akhir.

## 104. Individu: paket pengumpulan
 Source Flutter beserta README dan daftar versi package. Video 4–6 menit: tambah, edit, batal, hapus, filter, favorit. Minimal 12 skenario uji dengan input, ekspektasi, hasil aktual, status. Screenshot minimal 6 layar dan 3 kondisi error/kosong. Penjelasan pemilik state dan alur data pada satu fitur. 

Pengumpulan harus memungkinkan aplikasi dijalankan ulang. README menjelaskan cara memasang dependensi, menjalankan aplikasi, dan keterbatasan yang masih ada.

Video harus memperlihatkan interaksi, bukan hanya perpindahan screenshot. Dua belas skenario uji mencakup jalur berhasil serta kondisi gagal. Jelaskan satu fitur menggunakan nama berkas dan method agar terlihat bahwa kalian memahami implementasinya.

## 105. Tugas kelompok: seluruh frontend sebelum UTS
 Gunakan ide aplikasi kelompok yang telah disepakati. Tetapkan 1 persona utama dan minimal 3 alur pengguna lengkap. Minimal 8 layar fungsional, termasuk daftar, detail, form, profil/pengaturan. Minimal 2 modul CRUD dengan data simulasi dan relasi ID. Minimal 20 record utama dan 5 record referensi/kategori. Semua tombol utama, validasi, navigasi, dan state bekerja. 

Kelompok melanjutkan ide aplikasinya sendiri. Kalian tidak harus membuat Study Planner. Contohnya peminjaman ruang, layanan kampus, katalog kegiatan, atau pengelolaan inventaris.

Tetapkan persona dan tiga alur yang benar-benar dibutuhkan. Dua modul CRUD harus bermakna untuk domain tersebut. Delapan layar dihitung berdasarkan fungsi, sehingga mengganti judul pada layar yang sama tidak dianggap menambah kelengkapan.

## 106. Kelompok: contoh cakupan aplikasi kampus
 Alur Layar terlibat Hasil akhir Peminjaman ruang Katalog, Detail, Form peminjaman Permintaan muncul di daftar saya Pengelolaan permintaan Daftar saya, Detail, Edit, Konfirmasi hapus Status dan jumlah diperbarui Pengelolaan data ruang Daftar ruang, Tambah/Edit ruang Katalog memakai data terbaru Preferensi pengguna Profil, Edit profil / Pengaturan Preferensi tersimpan dalam sesi 

Tabel ini adalah contoh penerapan untuk aplikasi peminjaman ruang. Kalian boleh mengganti domain, tetapi kompleksitas alur harus setara. Permintaan mengacu pada ID ruang agar hubungan antardata jelas.

Jika ruang sudah dipakai oleh permintaan, tentukan aturan penghapusan, misalnya menolak penghapusan dengan pesan. Jangan membiarkan relasi menjadi rusak. Kebijakan sederhana yang konsisten lebih baik daripada alur yang tidak terdefinisi.

## 107. Kelompok: kualitas UI dan interaksi
 Tema warna, tipografi, spacing, dan bentuk tombol konsisten. Komponen bersama: kartu, field, tombol utama, empty state. Form utama minimal 5 field dan 3 jenis input yang relevan. Dialog untuk aksi destruktif, pesan sukses untuk aksi selesai. Input mempunyai label, pesan error spesifik, dan urutan fokus wajar. Teks panjang dan keyboard tidak menutupi aksi utama. 

Kualitas frontend terlihat dari konsistensi dan kemampuan menangani kondisi nyata. Tentukan komponen yang dipakai ulang sebelum setiap anggota membuat halaman masing-masing.

Pilih jenis input berdasarkan data. Kategori memakai pilihan, tanggal memakai pemilih tanggal, dan catatan dapat memakai teks multiline. Jangan memaksa semua data menjadi input teks hanya karena lebih cepat dibuat.

## 108. Kelompok: state loading, kosong, dan gagal
 Sediakan repository data simulasi sebagai sumber data. Simulasikan jeda pemuatan, tampilkan indikator loading. Sediakan skenario daftar kosong dengan petunjuk tindakan. Sediakan skenario gagal dengan tombol Coba lagi. Nonaktifkan submit selama proses simulasi berjalan. Cegah data ganda akibat ketukan berulang. 

Walaupun belum memakai server, kalian dapat menguji perilaku UI saat menunggu dan gagal melalui repository simulasi. Misalnya, gunakan delay untuk loading dan pengaturan skenario error yang dapat diulang.

Tombol Coba lagi harus menjalankan proses kembali. Jangan hanya menutup pesan. Setelah retry berhasil, daftar tampil dan indikator loading hilang. Tulis bahwa mekanisme ini merupakan simulasi, bukan bukti aplikasi sudah terhubung ke backend.

## 109. Contoh pola repository simulasi
 Future<List<Course>> loadCourses({ bool simulateError = false, }) async { await Future<void>.delayed( const Duration(milliseconds: 700), ); if (simulateError) { throw Exception('Simulasi gagal memuat'); } return List<Course>.of(courses); } Pengembangan tugas, belum ada pada source inti. Bungkus pemanggilan dengan try/catch. State: loading, data, dan error. Tombol retry memanggil fungsi lagi. 

Ini contoh fungsi repository simulasi yang bisa kalian adaptasi. UI perlu menyimpan kondisi loading sebelum pemanggilan, mengisi data saat berhasil, dan menyimpan pesan saat menangkap error.

Saat proses selesai, matikan loading. Jika menggunakan State setelah await, periksa mounted. Contoh ini sengaja menjadi pengembangan tugas; source inti pertemuan masih menggunakan data sinkron di memori.

## 110. Milestone kelompok sampai UTS
 Milestone Target selesai Bukti M1 · Setelah P5 Peta layar, model, shell, daftar/detail Semua rute inti bisa dibuka M2 · Pertemuan berikutnya Dua CRUD, validasi, state bersama Tiga alur utama dapat dijalankan M3 · Sebelum UTS Loading/error/empty, responsif, integrasi Minimal 20 skenario uji M4 · Saat UTS Frontend final tanpa aksi utama buntu Demo, source, README, laporan 

Milestone ini menyusun pekerjaan mundur dari target UTS. Pada milestone pertama, seluruh rute inti harus sudah ada. Pada milestone kedua, alur utama berfungsi. Setelah itu, fokus pada kondisi khusus dan integrasi.

Tanggal persis mengikuti jadwal kelas. Jangan menunggu mendekati UTS untuk menggabungkan halaman dari tiap anggota karena konflik state dan navigasi biasanya baru terlihat setelah integrasi.

## 111. Pembagian kerja dan integrasi kelompok
 Satu anggota menjaga kontrak model, ID, dan repository. Anggota lain menangani fitur secara utuh, dari UI sampai pengujian. Sepakati nama rute dan API store sebelum pembagian halaman. Gabungkan perubahan kecil secara rutin, bukan menjelang UTS. Semua anggota wajib memahami minimal satu alur lintas halaman. 

Pembagian kerja tidak cukup berupa pembagian jumlah halaman. Setiap fitur memerlukan model, state, tampilan, dan pengujian. Sepakati kontrak bersama agar halaman hasil kerja anggota dapat dihubungkan.

Satu orang dapat menjaga konsistensi model dan router, tetapi semua anggota tetap bertanggung jawab memahami alur. Saat UTS, setiap anggota perlu mampu menjelaskan bagian yang dikerjakan beserta hubungannya dengan fitur lain.

## 112. Matriks uji wajib sebelum UTS
 Area Skenario minimal CRUD Tambah valid, edit, batal, hapus, batal hapus Validasi Kosong, batas panjang, pilihan/tanggal tidak valid Data & state Filter gabungan, hasil kosong, sinkron antarlayar Navigasi Back, ID salah, akses rute langsung Async simulasi Loading, gagal, retry, cegah submit ganda Tampilan Lebar 360, 768, 1280 px dan teks panjang 

Jadikan area ini dasar dua puluh skenario kelompok. Setiap skenario harus memiliki langkah, input, hasil yang diharapkan, dan hasil aktual. Bila ditemukan masalah, catat perbaikan lalu uji ulang.

Ukuran layar tidak berarti desain harus identik. Pada layar kecil, konten dapat disusun satu kolom. Yang penting tidak ada overflow, teks terpotong tanpa alasan, atau tombol utama yang tidak bisa dijangkau.

## 113. Definisi frontend selesai saat UTS
 Seluruh layar dan tiga alur utama berjalan dari awal sampai akhir. Dua modul CRUD, validasi, dan data simulasi berfungsi konsisten. Loading, error, kosong, sukses, dan konfirmasi tersedia sesuai kebutuhan. Tidak ada tombol utama kosong atau rute yang buntu. Aplikasi dapat dijalankan ulang dari README. Masalah kritis ditutup dan seluruh anggota siap menjelaskan source. 

Frontend selesai berarti pengguna dapat menyelesaikan tujuan utamanya. Kita menilai perilaku, bukan hanya jumlah halaman atau kemiripan screenshot dengan desain.

Data boleh kembali awal setelah aplikasi di-restart selama keterbatasan tersebut dijelaskan. Penyimpanan permanen dan autentikasi nyata menjadi tahap lanjutan jika belum masuk cakupan kuliah. Namun, seluruh alur frontend yang disepakati harus sudah bekerja.

## 114. Rubrik individu dan kelompok
 Aspek Individu Kelompok Kelengkapan fitur dan alur 30% 30% State, navigasi, integritas data 25% 25% UI, validasi, kondisi khusus 20% 20% Pengujian dan reproduksibilitas 15% 15% Penjelasan source / kontribusi 10% 10% Rubrik kerja untuk tugas frontend; penetapan nilai akhir mengikuti ketentuan mata kuliah. 

Rubrik memberi bobot terbesar pada fitur yang benar dan alur data yang konsisten. Tampilan tetap dinilai, tetapi tidak dapat menggantikan fungsi inti yang belum bekerja.

Untuk individu, bagian terakhir menilai kemampuan menjelaskan source. Untuk kelompok, bagian tersebut juga mencakup kontribusi dan pemahaman lintas fitur. Sertakan bukti pengujian serta petunjuk menjalankan supaya hasil dapat diperiksa ulang.

## 115. Paket demonstrasi UTS
 Satu perwakilan mengunggah ZIP source kelompok. README: setup, perintah run, data dummy, skenario simulasi. Dokumen ringkas: persona, peta layar, model data, pembagian kontribusi. Matriks minimal 20 uji beserta bukti perbaikan. Video 8–10 menit dan demonstrasi langsung tiga alur utama. Hindari folder build, .dart_tool, dan kredensial dalam ZIP. 

Siapkan paket yang rapi sehingga pemeriksa dapat menjalankan aplikasi tanpa menebak langkahnya. Satu perwakilan mengumpulkan berkas kelompok, tetapi identitas dan kontribusi setiap anggota harus jelas.

Video memperlihatkan alur lengkap dan kondisi gagal yang dapat dipulihkan. Saat demonstrasi langsung, gunakan data simulasi yang konsisten agar hasil dapat diulang. Simpan juga daftar keterbatasan yang belum termasuk cakupan frontend.

## 116. Referensi dan paket pendamping
 Bahan utama: PDF unggahan “Interaksi Pengguna, State Management, Navigasi & Data Passing di Flutter”, 38 halaman. Form validation · Flutter StatelessWidget dan State.setState · Flutter API Simple app state management · Flutter Provider · dokumentasi package go_router 16.2.1 · seri paket latihan Navigasi dan ShellRoute · dokumentasi go_router Unduh proyek Flutter Buka kode lengkap Salin berkas lengkap 

Materi hari ini mengembangkan PDF referensi yang telah disediakan. Untuk memeriksa detail API, gunakan dokumentasi resmi Flutter dan package terkait. Beberapa penjelasan diperjelas, terutama tentang StatelessWidget, notifikasi perubahan state, dan batas penggunaan extra.

Paket pendamping menyediakan source untuk tahap lokal dan tahap integrasi, beserta petunjuk menjalankan serta checklist pengujian. Perhatikan catatan verifikasi di README. Demo pada slide adalah simulasi web untuk pengajaran; source Flutter perlu dijalankan dan diperiksa pada lingkungan kuliah kalian. Gunakan dokumentasi sebagai tempat memeriksa perilaku API ketika mengembangkan proyek lebih lanjut.
