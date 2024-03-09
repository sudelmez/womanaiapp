import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:womanaiapp/core/base/navigation/service.dart';
import 'package:womanaiapp/core/base/state/state.dart';
import 'package:womanaiapp/core/base/state/view.dart';

import '../core/component/button_icon.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseState<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  final FlutterTts flutterTts = FlutterTts();
  bool tapped = false;
  bool tappedimg = false;

  @override
  void initState() {
    tappedimg = false;
    tapped = false;
    super.initState();
  }

  void _sendMessage(String message) {
    setState(() {
      _messages.insert(0, message);
      tapped = true;
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      scaffoldBackgroundColor: colors.lightPurple,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigationService.instance.navigatePop();
          },
          icon: const Icon(
            Icons.chevron_left_outlined,
            size: 30,
          ),
        ),
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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ButtonSpeech(
                    heigt: 200,
                    icon: Icons.record_voice_over_sharp,
                    onPressed: () {
                      _sendMessage("message");
                    }),
              ),
              Visibility(
                  visible: tapped,
                  child: const Text(
                    "...",
                    style: TextStyle(fontSize: 30),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0) + const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              tappedimg = true;
                            });
                          },
                          child: Image.asset("assets/icons/face.png", height: 40),
                        ),
                        Image.asset("assets/icons/chat.png", height: 50)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset("assets/icons/eden2.png", height: 50),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Text(
                            "Hello Sarah! How is it going?",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: _messages.isNotEmpty,
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Image.asset("assets/icons/eden2.png", height: 50),
                                  Container(
                                    width: deviceWidth - 70,
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: const Text(
                                      "AI Response",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: _messages.length),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: tappedimg,
            child: Center(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.white, border: Border.all(color: colors.lightPurple2)),
                height: deviceHeight - 150,
                width: deviceWidth - 40,
                child: Stack(
                  children: [
                    Image.asset("assets/icons/person.png"),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ButtonSpeech(
                            icon: Icons.record_voice_over_sharp,
                            onPressed: () {
                              _sendMessage("message");
                              tappedimg = false;
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
