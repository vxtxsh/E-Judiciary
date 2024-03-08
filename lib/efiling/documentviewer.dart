import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
class DocumentViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uploaded Documents'),
        backgroundColor: const Color.fromARGB(255, 58, 57, 57),
      ),
      body: DocumentList(),
    );
  }
}

class DocumentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('efiling').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

  
     var documents = snapshot.data?.docs ?? [];
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            var document = documents[index];
            var documentName = document['name'];
            var documentURL = document['fileDownloadURL'];

            return ListTile(
              title: Text(documentName),
              onTap: () {
                // Open the document URL (you can use a PDF viewer package here)
                // For simplicity, I'm just printing the URL for demonstration purposes.
                print('Document URL: $documentURL');
              },
            );
          },
        );
      },
    );
  }
}