import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_app/core/utils/app_colors.dart';
import 'package:mom_app/core/utils/media_query_values.dart';

import '../../../core/widgets/top_screen_color_line.dart';

class PersonalChatScreen extends StatefulWidget {
  final String chatPartnerName;
  final String chatPartnerAvatarUrl;

  PersonalChatScreen({required this.chatPartnerName, required this.chatPartnerAvatarUrl});

  @override
  _PersonalChatScreenState createState() => _PersonalChatScreenState();
}

class _PersonalChatScreenState extends State<PersonalChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Map<String, dynamic>> _chatMessages = [
    {'message': 'Hey, how are you?', 'isMe': false},
    {'message': 'I\'m good, thanks for asking. How about you?', 'isMe': true},
    {'message': 'I\'m doing great too, thanks!', 'isMe': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chatPartnerAvatarUrl),
            ),
            SizedBox(width: 8),
            Text(widget.chatPartnerName),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call,color:AppColors.greenChat),
            onPressed: () {},
          ),
          IconButton(
             icon: Icon(Icons.video_call,color:AppColors.greenChat,),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          topScreenColorLine(color:AppColors.greenChat),
          SizedBox(height: 20.0,),
          Center(child: Text("today",style: GoogleFonts.poppins(
            color: Colors.grey.shade400
          ),),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> message = _chatMessages[index];
                  return Align(
                    alignment: message['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      margin: EdgeInsets.symmetric( vertical: 10),
                      decoration: BoxDecoration(
                        color: message['isMe'] ? AppColors.greenChat: Colors.grey[300],
                        borderRadius: message['isMe']?BorderRadius.only(topLeft:Radius.circular(24),bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24)):
                  BorderRadius.only(topLeft:Radius.circular(24),bottomRight: Radius.circular(24),topRight: Radius.circular(24)),
                      ),
                      child: Text(
                        message['message'],
                        style: TextStyle(
                          fontSize: 16,
                          color: message['isMe']?Colors.white:Colors.black54
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 1
                          ),
                        ],
                      ),
                      child: TextField(

                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Type a message',

                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none

                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(16, 8, 48, 16), // Adjusted content padding
                          suffix: IconButton(
                            icon: Icon(Icons.keyboard_voice_outlined,color: Colors.grey.shade400,),
                            onPressed: () {
                            },
                          ) ,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              _sendMessage();
                            },
                          ),
                          suffixIconColor: AppColors.greenChat,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _chatMessages.add({'message': message, 'isMe': true});
      });
      _textEditingController.clear();
    }
  }
}