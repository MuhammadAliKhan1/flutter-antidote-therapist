import 'package:antidote/global.dart';
import 'package:antidote/models/inherited/therapist_data.dart';
import 'package:antidote/models/therapist_model.dart';
import 'package:antidote/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User patientData;

  const ChatScreen({
    Key key,
    @required this.patientData,
  }) : super(
          key: key,
        );
  @override
  _ChatScreenState createState() => _ChatScreenState(
        patientData: patientData,
      );
}

class _ChatScreenState extends State<ChatScreen> {
  final User patientData;
  Therapist therapistData;
  ChatUser user = ChatUser();

  _ChatScreenState({
    @required this.patientData,
  });

  @override
  void initState() {
    super.initState();
  }

  void onSend(ChatMessage message) {
    var documentReference = Firestore.instance
        .collection(FireStoreKeys.messagesCollection)
        .document(
          '${patientData.email}-${therapistData.mobileNumber}',
        )
        .collection(FireStoreKeys.chatCollection)
        .document(DateTime.now().millisecondsSinceEpoch.toString());
    Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        message.toJson(),
      );
    });
  }

  /* void uploadFile() async {
    File result = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 400,
      maxWidth: 400,
    );

    if (result != null) {
      String id = Uuid().v4().toString();

      final StorageReference storageRef =
          FirebaseStorage.instance.ref().child("chat_images/$id.jpg");

      StorageUploadTask uploadTask = storageRef.putFile(
        result,
        StorageMetadata(
          contentType: 'image/jpg',
        ),
      );
      StorageTaskSnapshot download = await uploadTask.onComplete;

      String url = await download.ref.getDownloadURL();

      ChatMessage message = ChatMessage(text: "", user: user, image: url);

      var documentReference = Firestore.instance
          .collection('messages')
          .document(DateTime.now().millisecondsSinceEpoch.toString());

      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          message.toJson(),
        );
      });
    }
  }
 */
  @override
  Widget build(BuildContext context) {
    final TherapistInherit inheritedData = TherapistInherit.of(context);

    user.name = inheritedData.therapistData.name;
    user.uid = inheritedData.therapistData.email;
    user.avatar = inheritedData.therapistData.photoUrl;
    therapistData = inheritedData.therapistData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dash Chat"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection(FireStoreKeys.messagesCollection)
            .document('${patientData.email}-${therapistData.mobileNumber}')
            .collection(FireStoreKeys.chatCollection)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            );
          } else {
            List<DocumentSnapshot> items = snapshot.data.documents;
            var messages =
                items.map((i) => ChatMessage.fromJson(i.data)).toList();
            return DashChat(
              user: user,
              messages: messages,
              inputDecoration: InputDecoration(
                hintText: "Message here...",
                border: InputBorder.none,
              ),
              onSend: onSend,
            );
          }
        },
      ),
    );
  }
}
