import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'documentviewer.dart';
class uploaddocuments extends StatefulWidget {
  const uploaddocuments({super.key});

  @override
  State<uploaddocuments> createState() => _uploaddocumentsState();
}

class _uploaddocumentsState extends State<uploaddocuments> {
  var title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Upload-documents'),
        backgroundColor: const Color.fromARGB(255, 58, 57, 57),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 15, 0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 5, 29, 101),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 72, 49, 41),
                      width: 2,
                    ),
                  ),
                  labelText: 'Document Title',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 5, 29, 101),
                  ),
                  hintText: 'Enter Document Title',
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 58, 57, 57),
                  ),
                  child: const Text('Browse'),
                  onPressed: () async {
                    await pickFiles();
                  },
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 20, 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 58, 57, 57),
                  ),
                  child: const Text('Uploaded Documents'),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DocumentViewer()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      if (file.extension == 'pdf') {
        String documentName = title.text.trim();

        if (documentName.isNotEmpty) {
          print('PDF file picked: ${file.name}');
          print('Document name entered: $documentName');

          // Upload the PDF file to Firebase Storage
          await uploadFile(file, documentName);
        } else {
          print('Please enter a document name before picking a PDF file.');
          // Handle the case where the user didn't enter a document name
        }
      } else {
        // File picked, but it's not a PDF
        print('Invalid file format. Please pick a PDF file.');
      }
    } else {
      // User canceled the picker
    }
  }

  Future<void> uploadFile(PlatformFile file, String documentName) async {
    try {
      firebase_storage.Reference storageReference =
          firebase_storage.FirebaseStorage.instance.ref().child('pdfs/$documentName.pdf');
      await storageReference.putData(file.bytes!);

      print('PDF file uploaded successfully');
    } catch (error) {
      print('Error uploading file: $error');
    }
  }
}