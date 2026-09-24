import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../state/course_store.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key, required this.id, this.from});
  final String id;
  final String? from;

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CourseStore>();
    final courseList = store.allCourses.where((c) => c.id == id).toList();
    final course = courseList.isNotEmpty ? courseList.first : null;
    final favorite = store.isFavorite(id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Aktivitas'),
        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
      ),
      bottomNavigationBar:
          course == null
              ? null
              : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FilledButton.icon(
                    onPressed: () => store.toggleFavorite(id),
                    icon: Icon(
                      favorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    label: Text(favorite ? 'Hapus favorit' : 'Tambah favorit'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
      body: SafeArea(
        child:
            course == null
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Aktivitas tidak ditemukan.'),
                      const SizedBox(height: 8),
                      Text('ID: $id'),
                    ],
                  ),
                )
                : ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          course.category,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      course.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(
                          Icons.school_outlined,
                          size: 20,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            course.lecturer,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),

                    if (course.date != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.red.shade100),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 22,
                              color: Colors.red.shade700,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Tenggat: ${course.date!.day}-${course.date!.month}-${course.date!.year}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      course.description,
                      style: const TextStyle(fontSize: 15, height: 1.5),
                    ),
                    const SizedBox(height: 32),

                    Text(
                      'Asal halaman: ${from ?? "tautan langsung"}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
      ),
    );
  }
}
