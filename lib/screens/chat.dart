import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gup_chup/widget/chat_messages.dart';
import 'package:gup_chup/widget/new_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupNotification() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();
    final token = await fcm.getToken();
    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();

    setupNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ghup-Chup',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: IconButton.styleFrom(
                  focusColor: Theme.of(context).colorScheme.secondary),
              icon: Icon(Icons.exit_to_app_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            NewMessages(),
          ],
        ));
  }
}
