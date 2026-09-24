import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../state/course_store.dart';
import '../widgets/course_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CourseStore>();
    final visible = store.filtered;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, ${store.name} 👋',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF006633),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Siap untuk belajar hari ini?',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () => context.go('/profile'),
                    child: Tooltip(
                      message: 'Buka Profil',
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.green.shade100,
                        child: const Icon(
                          Icons.person,
                          color: Color(0xFF006633),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextFormField(
              initialValue: store.query,
              decoration: InputDecoration(
                hintText: 'Cari aktivitas...',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              onChanged: (value) => context.read<CourseStore>().setQuery(value),
            ),
            const SizedBox(height: 32),
            Text(
              'Aktivitas Mendatang',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (visible.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'Aktivitas tidak ditemukan.',
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
              ),
            for (final course in visible)
              CourseCard(course: course, from: 'home'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade900,
        foregroundColor: Colors.green.shade100,
        elevation: 4,
        onPressed: () => context.pushNamed('activity_form'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
