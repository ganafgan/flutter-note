// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_note/models/note.dart';
import 'package:flutter_note/pages/form_page.dart';
import 'package:flutter_note/utils/notes_database.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final Note note;
  const DetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Note note;

  Future refreshNote() async {
    note = await NotesDatabase.instance.readNote(widget.note.id!);
    setState(() {});
  }

  Future deleteDb() async {
    await NotesDatabase.instance.delete(note.id!);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    setState(() {
      note = widget.note;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          note.title,
        ),
        actions: [
          InkWell(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return FormPage(
                      note: note,
                    );
                  },
                ),
              );
              refreshNote();
            },
            child: const Icon(Icons.edit_note),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: deleteDb,
            child: const Icon(Icons.delete),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              note.title,
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              note.description,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
