import 'package:flutter/material.dart';
import 'package:womanaiapp/core/base/navigation/service.dart';
import 'package:womanaiapp/core/base/state/state.dart';
import 'package:womanaiapp/core/base/state/view.dart';
import 'package:womanaiapp/core/component/answer_button.dart';
import 'package:womanaiapp/core/component/button_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      scaffoldBackgroundColor: colors.lightPurple,
      body: Padding(
        padding: const EdgeInsets.all(10.0) + const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              const Text("Welcome Sarah...", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              Text("How are you feeling today?", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: colors.lightPurple2, fontStyle: FontStyle.italic)),
              const SizedBox(height: 20),
              AnswerCard(
                  text: "Great!",
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationPaths.sug, arguments: {
                      "text": ["You being happy makes me happy too!", "Here is a song for today!\nHappy - Pharrell Williams", "Here is a movie for today!\nThe Grand Budapest Hotel"]
                    });
                  }),
              AnswerCard(
                  text: "Normal",
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationPaths.sug, arguments: {
                      "text": [
                        "I'm here to help. Is there anything I can do for you? I'll do my best to make you happy.",
                        "Here is a song for today!\nHappy - Pharrell Williams",
                        "Here is a movie for today!\nThe Grand Budapest Hotel"
                      ]
                    });
                  }),
              AnswerCard(
                  text: "Not good...",
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationPaths.sug, arguments: {
                      "text": [
                        "I'm here to help. Is there anything I can do for you? I'll do my best to make you happy.",
                        "Take Some Time for Yourself: Taking time for yourself during difficult times is important. Find a quiet space to relax and unwind.",
                        "Share Your Feelings: Sharing your feelings is an important way to seek support during tough times. Talk to a trusted friend or loved one about what you're going through."
                            "Think Positively: Maintaining a positive mindset can help improve difficult situations. Try to focus on the good things in your life and look towards a hopeful future."
                            "Go for a Nature Walk or Exercise: Spending time outdoors or engaging in physical activity can improve your mood and energy levels. Take a walk in nature or go for a jog to clear your mind."
                            "Rest and Sleep: Getting enough rest and sleep is crucial for your mental and emotional well-being. Make sure you're getting adequate sleep each night and allow yourself time to rest when needed."
                      ]
                    });
                  }),
              AnswerCard(
                  text: "Too bad.",
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationPaths.chat, arguments: {"text": "What is bothering you?"});
                  }),
              const SizedBox(height: 20),
              Divider(
                thickness: 2,
                indent: 30,
                endIndent: 30,
                color: colors.lightPurple2,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonSpeech(
                      icon: Icons.chat,
                      onPressed: () {
                        NavigationService.instance.navigateToPage(path: NavigationPaths.chat, arguments: {"text": "Hello Sarah! How is it going?"});
                      }),
                  ButtonSpeech(
                      icon: Icons.phone,
                      onPressed: () {
                        NavigationService.instance.navigateToPage(path: NavigationPaths.voice);
                      })
                ],
              ),
              const SizedBox(height: 130),
              Image.asset("assets/icons/leaf.png", height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
