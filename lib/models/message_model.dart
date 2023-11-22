import 'user_model.dart';

//create message model for our chat ui app including user model like a sender
class Message {
  final String? text;
  final User? sender;
  final String? time;
  final bool? isLiked;
  final bool? unread;

  Message({
    this.text,
    this.sender,
    this.time,
    this.isLiked,
    this.unread,
  });
}

//create some dummy data for our chat ui app
// ignore: non_constant_identifier_names
final User currentUser = User(
  id: 0,
  name: 'Current User',
  avatar: 'images/greg.jpg',
);

//other users with a true name
// ignore: non_constant_identifier_names
final User greg = User(
  id: 1,
  name: 'Greg',
  avatar: 'images/greg.jpg',
);
// ignore: non_constant_identifier_names
final User james = User(
  id: 2,
  name: 'James',
  avatar: 'images/james.jpg',
);
// ignore: non_constant_identifier_names
final User john = User(
  id: 3,
  name: 'John',
  avatar: 'images/john.jpg',
);
// ignore: non_constant_identifier_names
final User olivia = User(
  id: 4,
  name: 'Olivia',
  avatar: 'images/olivia.jpg',
);
// ignore: non_constant_identifier_names
final User sam = User(
  id: 5,
  name: 'Sam',
  avatar: 'images/sam.jpg',
);
// ignore: non_constant_identifier_names
final User sophia = User(
  id: 6,
  name: 'Sophia',
  avatar: 'images/sophia.jpg',
);
// ignore: non_constant_identifier_names
final User steven = User(
  id: 7,
  name: 'Steven',
  avatar: 'images/steven.jpg',
);
// ignore: non_constant_identifier_names
final User mike = User(
  id: 8,
  name: 'Mike',
  avatar: 'images/mike.jpg',
);
// favorites contacts list
List<User> favorites = [sam, john, greg, james, sophia, mike];
//examples of chats in our chat ui app
List<Message> chats = [
  Message(
    sender: james,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'Good Morning Guys!',
    isLiked: true,
    unread: false,
  ),
  Message(
    sender: currentUser,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'Good Morning brother',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'How are you?',
    isLiked: true,
    unread: false,
  ),
  Message(
    sender: john,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'I m very fine and you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'I m fine too',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sam,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'It\'s a beautiful day',
    isLiked: true,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'Yes, it is!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'I\'m going to the gym. Wanna join?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: mike,
    time: '${DateTime.now().hour}:${DateTime.now().minute}',
    text: 'Yes, of course!',
    isLiked: false,
    unread: false,
  ),
];
