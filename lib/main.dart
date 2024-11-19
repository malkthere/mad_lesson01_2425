import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'SQLite Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SqlDb sqlDb = SqlDb();

  // Controllers for input fields
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _updateController = TextEditingController();

  // Store fetched notes
  List<Map> _notes = [];

  @override
  void initState() {
    super.initState();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM notes");
    setState(() {
      _notes = response;
    });
  }

  Future<void> insertNote() async {
    if (_noteController.text.isNotEmpty) {
      await sqlDb.insertData(
          "INSERT INTO notes (note) VALUES ('${_noteController.text}')");
      _noteController.clear();
      fetchNotes();
    }
  }

  Future<void> updateNote(int id) async {
    if (_updateController.text.isNotEmpty) {
      await sqlDb.updateData(
          "UPDATE notes SET note = '${_updateController.text}' WHERE id = $id");
      _updateController.clear();
      fetchNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    await sqlDb.deleteData("DELETE FROM notes WHERE id = $id");
    fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Field for Adding Notes
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Enter a Note',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: insertNote,
              child: const Text('Add Note'),
            ),

            const Divider(),

            // Display Notes in a ListView
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  final note = _notes[index];
                  return Card(
                    child: ListTile(
                      title: Text(note['note']),
                      subtitle: Text('ID: ${note['id']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _updateController.text = note['note'];
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Update Note'),
                                  content: TextField(
                                    controller: _updateController,
                                    decoration: const InputDecoration(
                                      labelText: 'New Note',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        updateNote(note['id']);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Update'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteNote(note['id']),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
