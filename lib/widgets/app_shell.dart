import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../state/course_store.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.location, required this.child});
  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final count = context.select<CourseStore, int>((s) => s.favoriteCount);

    int getIndex() {
      if (location.startsWith('/activities')) return 1;
      if (location.startsWith('/favorites')) return 2;
      if (location.startsWith('/profile')) return 3;
      return 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Planner'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(child: Text('$count favorit')),
          ),
        ],
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: getIndex(),
        type: BottomNavigationBarType.fixed,
        onTap:
            (i) => context.go(
              ['/home', '/activities', '/favorites', '/profile'][i],
            ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
