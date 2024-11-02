import 'package:flutter/material.dart';
import 'package:mad_lesson1_2425/DatabaseHelper.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(NotesApp());
}
class NotesApp extends StatefulWidget {
  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  List<Note> _notes = [];
  late DatabaseHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await _dbHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  Future<void> _addNote() async {
    final note = Note(
      title: 'Sample Note',
      content: 'This is a sample note content.',
      createdAt: DateTime.now().toIso8601String(),
    );
    await _dbHelper.insertNote(note);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Notes')),
        body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            final note = _notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  await _dbHelper.deleteNote(note.id!);
                  _loadNotes();
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNote,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}