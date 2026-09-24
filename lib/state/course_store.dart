import 'package:flutter/foundation.dart';
import '../models/course.dart';

class CourseStore extends ChangeNotifier {
  final List<Course> _myCourses = List.from(courses);
  final Set<String> _favorites = {};
  String _name = 'Mahasiswa';
  String _query = '';

  String get name => _name;
  String get query => _query;
  int get favoriteCount => _favorites.length;
  List<Course> get allCourses {
    final list = [..._myCourses];
    list.sort((a, b) {
      if (a.date == null && b.date == null) return 0;
      if (a.date == null) return 1;
      if (b.date == null) return -1;
      return a.date!.compareTo(b.date!);
    });
    return list;
  }

  bool isFavorite(String id) => _favorites.contains(id);

  List<Course> get favorites =>
      allCourses.where((c) => isFavorite(c.id)).toList();

  List<Course> get filtered {
    final q = _query.trim().toLowerCase();
    return allCourses
        .where((c) => '${c.title} ${c.id}'.toLowerCase().contains(q))
        .toList();
  }

  void addCourse(Course course) {
    _myCourses.add(course);
    notifyListeners();
  }

  void updateCourse(Course updatedCourse) {
    final index = _myCourses.indexWhere((c) => c.id == updatedCourse.id);
    if (index != -1) {
      _myCourses[index] = updatedCourse;
      notifyListeners();
    }
  }

  void deleteCourse(String id) {
    _myCourses.removeWhere((c) => c.id == id);
    _favorites.remove(id);
    notifyListeners();
  }

  void setQuery(String value) {
    if (_query == value) return;
    _query = value;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    if (!_myCourses.any((c) => c.id == id)) return;
    if (!_favorites.remove(id)) _favorites.add(id);
    notifyListeners();
  }

  void updateName(String value) {
    final clean = value.trim();
    if (clean.length < 2 || clean.length > 40 || clean == _name) return;
    _name = clean;
    notifyListeners();
  }
}
