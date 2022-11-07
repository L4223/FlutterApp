import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Favorites'),
        ),
        body: content());
  }

  Widget content() {
    final CollectionReference _favorites =
        FirebaseFirestore.instance.collection('favorites');

    return StreamBuilder(
        stream: _favorites.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                // separatorBuilder: (BuildContext context, int index) =>
                //     Divider(),
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['word']),
                    ),
                  );
                });
          } else {
            return Center(child: Text("Loading..."));
          }
        });
  }
}
