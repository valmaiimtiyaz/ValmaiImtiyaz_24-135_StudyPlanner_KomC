import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_usu_pertemuan5/state/course_store.dart';
void main() {
  test('favorit memakai ID valid, dapat ditambah dan dihapus', () {
    final store = CourseStore();
    store.toggleFavorite('tidak-ada');
    expect(store.favoriteCount, 0);
    store.toggleFavorite('ILK3105');
    expect(store.favorites.single.id, 'ILK3105');
    store.toggleFavorite('ILK3105');
    expect(store.favoriteCount, 0);
    store.dispose();
  });
  test('pencarian mengabaikan kapital dan spasi luar', () {
    final store = CourseStore();
    store.setQuery('  MOBILE  ');
    expect(store.filtered.single.id, 'ILK3105');
    store.setQuery('tidak ditemukan');
    expect(store.filtered, isEmpty);
    store.dispose();
  });
  test('nama ditrim dan nilai tidak valid diabaikan', () {
    final store = CourseStore();
    store.updateName(' A ');
    expect(store.name, 'Mahasiswa');
    store.updateName('  Rani  ');
    expect(store.name, 'Rani');
    store.dispose();
  });
}
