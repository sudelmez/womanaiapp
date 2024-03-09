import 'package:flutter/material.dart';
import 'package:womanaiapp/core/base/state/state.dart';
import 'package:womanaiapp/core/base/state/view.dart';
import '../../core/base/navigation/service.dart';

class ChatPage extends StatefulWidget {
  final String? initialMessage;

  ChatPage({this.initialMessage});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends BaseState<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _addAutomaticMessage(widget.initialMessage ?? "Hello Sarah! How is it going?", isReceived: true);
  }

  void _sendMessage(String message) {
    _addMessage(message, isReceived: false);
    _addAutomaticMessage("This is an automated response.", isReceived: true);
    _textController.clear();
  }

  void _addMessage(String message, {bool isReceived = true}) {
    setState(() {
      _messages.insert(0, {"message": message, "isReceived": isReceived});
    });
  }

  void _addAutomaticMessage(String message, {bool isReceived = true}) {
    _addMessage(message, isReceived: isReceived);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      scaffoldBackgroundColor: colors.lightPurple,
      appBar: AppBar(
        title: const Text("AI Chat"),
        leading: IconButton(
            onPressed: () {
              NavigationService.instance.navigatePop();
            },
            icon: const Icon(
              Icons.chevron_left_outlined,
              size: 30,
            )),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              "assets/icons/person.png",
              height: 40,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index]["message"];
                final isReceived = _messages[index]["isReceived"];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0) + const EdgeInsets.symmetric(horizontal: 10),
                  child: isReceived
                      ? Row(
                          children: [
                            Image.asset("assets/icons/eden2.png", height: 50),
                            Container(
                              width: deviceWidth - 70,
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              decoration: BoxDecoration(
                                color: isReceived ? Colors.white : colors.lightPurple2,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(message),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Image.asset("assets/icons/person.png", height: 40),
                            const SizedBox(width: 10),
                            Container(
                              width: deviceWidth - 70,
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.symmetric(vertical: 4.0),
                              decoration: BoxDecoration(
                                color: isReceived ? Colors.white : colors.lightPurple2,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(message),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Enter your message...',
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _sendMessage(_textController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
