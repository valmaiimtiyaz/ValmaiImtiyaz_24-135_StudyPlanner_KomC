import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/course_store.dart';
import '../widgets/course_card.dart';

class ActivityListPage extends StatelessWidget {
  const ActivityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CourseStore>();
    final allActivities = store.allCourses;

    return Scaffold(
      body: SafeArea(
        child:
            allActivities.isEmpty
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.event_note_outlined,
                            size: 48,
                            color: Color(0xFF006633),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Belum Ada Aktivitas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tambahkan aktivitas baru melalui tombol tambah di halaman beranda.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                )
                : ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Daftar Aktivitas',
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF006633),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${allActivities.length} Total',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF006633),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    for (final activity in allActivities)
                      CourseCard(course: activity, from: 'activities'),
                  ],
                ),
      ),
    );
  }
}
