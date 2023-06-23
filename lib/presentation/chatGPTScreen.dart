import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/chatmessage.dart';
import '../widgets/threedots.dart';

class ChatGPTScreen extends StatefulWidget {
  const ChatGPTScreen({Key? key}) : super(key: key);
  @override
  State<ChatGPTScreen> createState() => _ChatGPTPageState();
}

class _ChatGPTPageState extends State<ChatGPTScreen> {
  final _fullName = GetStorage().read('LoggedInUser');
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  late OpenAI? chatGPT;
  bool _isImageSearch = false;

  bool _isTyping = false;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: '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',
        baseOption: HttpSetup(receiveTimeout: Duration(seconds: 6)));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: _fullName,
      isImage: false,
    );
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });
    _controller.clear();
    // print('text'+ message.text);
    final request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: [Messages(role: Role.user, content: message.text)]);
    print(request);
    try {
      print('GPT');
      final ChatCTResponse? response =
          await chatGPT!.onChatCompletion(request: request);
      if (response != null) {
        // Convert response to JSON format
        var content = response!.choices[0].message!.content;
        print('GPT' + content);
        insertNewData(content, isImage: false);
      } else {
        insertNewData('Not getting data at this moment...', isImage: false);
      }
    } catch (err) {
      print(err);
      insertNewData('I am not available right now, Please try again later.',
          isImage: false);
    }
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "Maha Bot",
      isImage: isImage,
    );
    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Please type your question..."),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _isImageSearch = false;
                _sendMessage();
              },
            ),
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat with MahaBot!!"),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          color: Colors.orangeAccent.shade200,
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              )),
              if (_isTyping) const ThreeDots(),
              const Divider(
                height: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.canvasColor,
                ),
                child: _buildTextComposer(),
              )
            ],
          ),
        ));
  }
}
