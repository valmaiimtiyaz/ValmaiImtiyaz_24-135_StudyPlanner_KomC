class Course {
  final String id;
  final String title;
  final String lecturer;
  final String description;
  final String category;
  final DateTime? date;

  Course({
    required this.id,
    required this.title,
    required this.lecturer,
    required this.description,
    required this.category,
    this.date,
  });
}

List<Course> courses = [
  Course(
    id: 'ACT001',
    title: 'Mengerjakan Slicing UI Flutter',
    lecturer: 'Pemrograman Mobile',
    description:
        'Menyelesaikan tugas pertemuan 5: navigasi, integrasi state, dan routing di Flutter.',
    category: 'Tugas',
    date: DateTime.now().add(const Duration(days: 2)),
  ),
  Course(
    id: 'ACT002',
    title: 'Desain Wireframe & Prototype',
    lecturer: 'Proyek UI/UX Teenancial',
    description:
        'Membuat rancangan antarmuka pengguna dan UX copy menggunakan Figma.',
    category: 'Desain',
    date: DateTime.now().add(const Duration(days: 4)),
  ),
  Course(
    id: 'ACT003',
    title: 'Simulasi Topologi Jaringan',
    lecturer: 'Praktikum Jaringan Komputer',
    description:
        'Mengonfigurasi OSPF dan packet capture menggunakan Cisco Packet Tracer dan Wireshark.',
    category: 'Praktikum',
    date: DateTime.now().add(const Duration(days: 7)),
  ),
  Course(
    id: 'ACT004',
    title: 'Rapat Evaluasi Mading',
    lecturer: 'Organisasi IMILKOM',
    description: 'Membahas pembaruan konten mading organisasi bersama tim.',
    category: 'Organisasi',
    date: DateTime.now(),
  ),
  Course(
    id: 'ACT005',
    title: 'Menulis Laporan Analisis JST',
    lecturer: 'Metodologi Penelitian',
    description:
        'Menyusun bab metodologi untuk deteksi DDoS menggunakan model Multi-Layer Perceptron (MLP).',
    category: 'Riset',
    date: DateTime.now().add(const Duration(days: 3)),
  ),
  Course(
    id: 'ACT006',
    title: 'Latihan Query Relasional',
    lecturer: 'Praktikum Basis Data',
    description:
        'Mengerjakan studi kasus database menggunakan PostgreSQL dan pgAdmin.',
    category: 'Praktikum',
    date: null,
  ),
  Course(
    id: 'ACT007',
    title: 'Mempelajari Arsitektur Memori',
    lecturer: 'Komputasi Paralel',
    description: 'Membaca materi eksplorasi tentang OpenMP dan shared memory.',
    category: 'Belajar Mandiri',
    date: null,
  ),
  Course(
    id: 'ACT008',
    title: 'Persiapan Kuis Etika',
    lecturer: 'Etika Profesi',
    description:
        'Review materi tentang tanggung jawab dan profesionalisme di bidang TI.',
    category: 'Ujian',
    date: DateTime.now().add(const Duration(days: 1)),
  ),
  Course(
    id: 'ACT009',
    title: 'Pengembangan Backend Node.js',
    lecturer: 'Proyek TemuBarang',
    description:
        'Melanjutkan integrasi API dari backend Express.js ke frontend React.',
    category: 'Proyek',
    date: DateTime.now().add(const Duration(days: 14)),
  ),
  Course(
    id: 'ACT010',
    title: 'Review Konsep OOP',
    lecturer: 'Belajar Mandiri',
    description:
        'Mengulang kembali materi inheritance dan polymorphism menggunakan Java/C++.',
    category: 'Belajar Mandiri',
    date: null,
  ),
];
