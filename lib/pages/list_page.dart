import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // List<String> words = nouns.take(20).toList();
  List<String> savedWords = <String>[];
  final _biggerFont = const TextStyle(fontSize: 20);
  final User? user = Auth().currentUser;
  final CollectionReference _favorites =
      FirebaseFirestore.instance.collection('favorites');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WTFact"),
        actions: <Widget>[
          Badge(
            badgeContent: Text('${savedWords.length}'),
            badgeColor: Colors.white,
            toAnimate: true,
            animationType: BadgeAnimationType.scale,
            position: BadgePosition.topEnd(top: 3, end: 5),
            child: IconButton(
                iconSize: 35,
                icon: Icon(Icons.bookmark),
                color: Colors.redAccent,
                onPressed: () => Get.toNamed("/favPage")),
          ),
          IconButton(onPressed: signOut, icon: Icon(Icons.logout))
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return StreamBuilder(
        stream: _favorites.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                String word = documentSnapshot['word'];
                bool isSaved = documentSnapshot['word'].contains(word);

                separatorBuilder:
                (BuildContext context, int index) => Divider();

                return _buildRow(word, isSaved);
              },
            );
          } else {
            return Center(child: Text("Loading..."));
          }
        });
  }

  Widget _buildRow(String word, bool isSaved) {
    return ListTile(
      title: Text(
        word,
        style: _biggerFont,
      ),
      trailing: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            savedWords.remove(word);
          } else {
            _favorites.add({"word": word});
            print(word);
            // savedWords.add(word);
          }
        });
      },
    );
  }
}

Future<void> signOut() async {
  await Auth().signOut();
  Get.toNamed("/login");
}
