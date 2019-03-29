import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[Text('sssss')],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('provinces').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading............');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documets[index]),
          );
        },
      ),
    ));
  }
}
