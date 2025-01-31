import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gup_chup/widget/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final authenTicateUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .orderBy(
              'createdAt',
              descending: true,
            )
            .snapshots(),
        builder: (ctx, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No messages here...'),
            );
          }
          if (chatSnapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong.'),
            );
          }
          final loadedChat = chatSnapshot.data!.docs;
          return ListView.builder(
            padding: EdgeInsets.only(bottom: 40, left: 13, right: 13),
            reverse: true,
            itemCount: loadedChat.length,
            itemBuilder: (ctx, index) {
              final chatmessage = loadedChat[index].data();
              final nextChat = index + 1 < loadedChat.length
                  ? loadedChat[index + 1].data()
                  : null;
              final currentChatUser = chatmessage['userId'];
              final nextChatuser = nextChat != null ? nextChat['userId'] : null;
              final nextUserSame = nextChatuser == currentChatUser;

              if (nextUserSame) {
                return MessageBubble.next(
                    message: chatmessage['text'],
                    isMe: authenTicateUser.uid == currentChatUser);
              } else {
                return MessageBubble.first(
                    userImage: chatmessage['imageUrl'],
                    username: chatmessage['username'],
                    message: chatmessage['text'],
                    isMe: authenTicateUser.uid == currentChatUser);
              }
            },
          );
        });
  }
}
