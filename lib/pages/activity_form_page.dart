import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../state/course_store.dart';

class ActivityFormPage extends StatefulWidget {
  final String? activityId;
  const ActivityFormPage({super.key, this.activityId});

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _lecturerController = TextEditingController();
  final _descController = TextEditingController();

  DateTime? _selectedDate;

  String _selectedCategory = 'Tugas';
  final List<String> _categories = [
    'Tugas',
    'Praktikum',
    'Proyek',
    'Ujian',
    'Belajar Mandiri',
    'Riset',
    'Organisasi',
    'Desain',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.activityId != null) {
      final store = context.read<CourseStore>();
      final existingActivity = store.allCourses.firstWhere(
        (c) => c.id == widget.activityId,
      );
      _titleController.text = existingActivity.title;
      _lecturerController.text = existingActivity.lecturer;
      _descController.text = existingActivity.description;
      _selectedDate = existingActivity.date;
      if (_categories.contains(existingActivity.category)) {
        _selectedCategory = existingActivity.category;
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _lecturerController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF006633)),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final store = context.read<CourseStore>();

      if (widget.activityId == null) {
        final newActivity = Course(
          id: 'ACT${DateTime.now().millisecondsSinceEpoch}',
          title: _titleController.text,
          lecturer:
              _lecturerController.text.trim().isEmpty
                  ? 'Umum'
                  : _lecturerController.text,
          description: _descController.text,
          category: _selectedCategory,
          date: _selectedDate,
        );
        store.addCourse(newActivity);
      } else {
        final oldData = store.allCourses.firstWhere(
          (c) => c.id == widget.activityId,
        );
        final updatedActivity = Course(
          id: oldData.id,
          title: _titleController.text,
          lecturer:
              _lecturerController.text.trim().isEmpty
                  ? 'Umum'
                  : _lecturerController.text,
          description: _descController.text,
          category: _selectedCategory,
          date: _selectedDate,
        );
        store.updateCourse(updatedActivity);
      }
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.activityId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Aktivitas' : 'Tambah Aktivitas'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              Text(
                isEditing
                    ? 'Perbarui informasi aktivitas'
                    : 'Buat jadwal aktivitas baru',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),

              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Nama Aktivitas',
                  hintText: 'Contoh: Slicing UI Flutter',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                validator:
                    (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Nama aktivitas wajib diisi'
                            : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _lecturerController,
                decoration: InputDecoration(
                  labelText: 'Mata Kuliah / Konteks',
                  hintText: 'Contoh: Pemrograman Mobile',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                validator:
                    (value) =>
                        (value == null || value.trim().isEmpty)
                            ? 'Mata kuliah atau konteks wajib diisi'
                            : null,
              ),
              const SizedBox(height: 20),

              InkWell(
                onTap: () => _pickDate(context),
                borderRadius: BorderRadius.circular(12),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Tanggal / Tenggat Waktu',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Pilih Tanggal'
                            : '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              _selectedDate == null
                                  ? Colors.grey.shade600
                                  : Colors.black87,
                        ),
                      ),
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF006633),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Kategori',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                items:
                    _categories
                        .map(
                          (cat) =>
                              DropdownMenuItem(value: cat, child: Text(cat)),
                        )
                        .toList(),
                onChanged:
                    (value) => setState(() => _selectedCategory = value!),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi',
                  hintText: 'Tuliskan detail tugas atau catatan...',
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                maxLines: 4,
                validator:
                    (value) =>
                        (value == null || value.trim().length < 5)
                            ? 'Deskripsi harus lebih dari 5 karakter'
                            : null,
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: _saveForm,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF006633),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    isEditing ? 'Simpan Perubahan' : 'Tambah Aktivitas',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
