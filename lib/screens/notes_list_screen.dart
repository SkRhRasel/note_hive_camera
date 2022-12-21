import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_hive_camera/screens/add_notes_screen.dart';
import 'package:notes_hive_camera/screens/view_note_screen.dart';

import '../models/note.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('N O T E L Y'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Note>('note').listenable(),
          // builder: (BuildContext context, value, Widget? child) {},
          builder: (context, Box<Note> box, _) {
            // for without any child we can use underscore '_'
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (ctx, i) {
                final note = box.getAt(i);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ViewNoteScreen(
                                  title: note.title,
                                  description: note.description,
                                  imageUrl: note.imageUrl)));
                        },
                        leading: Image.file(
                          File(
                            note!.imageUrl.toString(),
                          ),
                        ),
                        title: Text(note.title.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            box.deleteAt(i);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const AddNoteScreen(),
            ),
          );
        },
        label: const Text('+ | Add Note'),
      ),
    );
  }
}
