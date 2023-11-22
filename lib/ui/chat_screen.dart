import 'package:flutter/material.dart';
import '../models/message_model.dart';

//this is the chatscreen widget
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(currentUser.avatar ?? ""),
              radius: 20.0,
            ),
            const SizedBox(width: 10.0),
            Text(currentUser.name ?? ""),
          ],
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(top: 15.0),
                    itemCount: chats.length,
                    itemBuilder: (BuildContext, index) {
                      final Message message = chats[index];
                      final bool isMe = message.sender?.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    //this is the message widget
    final Row msg = Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          margin: isMe
              ? const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, right: 8.0, left: 40.0)
              : const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, right: 40.0, left: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).colorScheme.secondary
                : const Color(0xFFFFEFEE),
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message.time ?? "",
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(height: 8.0),
              Text(message.text ?? "",
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
        ),
        if (!isMe)
          IconButton(
            icon: message.isLiked!
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            iconSize: 30.0,
            color: message.isLiked!
                ? Theme.of(context).primaryColor
                : const Color(0xFFFFEFEE),
            onPressed: () {},
          ),
      ],
    );

    return msg;
  }
}

Widget _buildMessageComposer() {
  //this is the message composer widget
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    height: 70.0,
    color: Colors.white,
    child: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.photo),
          iconSize: 25.0,
          color: Colors.red,
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (String value) {},
            decoration: const InputDecoration.collapsed(
              hintText: 'Send a message...',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          iconSize: 25.0,
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    ),
  );
}
