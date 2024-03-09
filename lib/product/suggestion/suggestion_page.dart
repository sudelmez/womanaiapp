import 'package:flutter/material.dart';
import 'package:womanaiapp/core/base/state/state.dart';
import 'package:womanaiapp/core/base/state/view.dart';

import '../../core/base/navigation/service.dart';

class SugPage extends BaseStateless {
  final List<String> textSuggestions;

  SugPage({required this.textSuggestions});

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
            )),
        backgroundColor: Colors.transparent,
        title: const Text('Suggestions'),
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
      body: ListView.builder(
        itemCount: textSuggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                border: Border.all(color: colors.lightPurple2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/eden2.png",
                    height: 50,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      textSuggestions[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
