import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({
    super.key,
  });
  @override
  State<NewMessages> createState() {
    return _NewMessagesState();
  }
}

class _NewMessagesState extends State<NewMessages> {
  var _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void submitMessage() async {
    final message = _messageController.text;

    if (message.trim().isEmpty) {
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    final usercred = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('chats').add({
      'text': message,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': usercred.data()!['username'],
      'imageUrl': usercred.data()!['imageUrl']
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(label: Text('Write Your Message')),
              enableSuggestions: true,
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              controller: _messageController,
            ),
          ),
          IconButton(
            onPressed: submitMessage,
            color: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
