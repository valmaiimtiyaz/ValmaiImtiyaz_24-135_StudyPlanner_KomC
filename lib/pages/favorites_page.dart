import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/course_store.dart';
import '../widgets/course_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CourseStore>();
    final items = store.favorites;

    return Scaffold(
      body: SafeArea(
        child:
            items.isEmpty
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            size: 48,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Belum Ada Favorit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tekan ikon hati pada aktivitas untuk menambahkannya ke sini.',
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
                    Text(
                      'Favorit Saya',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF006633),
                      ),
                    ),
                    const SizedBox(height: 24),
                    for (final course in items)
                      CourseCard(course: course, from: 'favorites'),
                  ],
                ),
      ),
    );
  }
}
