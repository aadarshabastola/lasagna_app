import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lasagna_app/screens/failedpage.dart';
import 'package:lasagna_app/screens/successspage.dart';
import 'package:lasagna_app/widgets/main_button.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: AnimatedTextKit(
                      repeatForever: false,
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Send',
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'Uber',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4A148C),
                          ),
                        ),
                        TyperAnimatedText(
                          'Anonymous',
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'Uber',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4A148C),
                          ),
                        ),
                        TyperAnimatedText(
                          'Texts',
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'Uber',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4A148C),
                          ),
                        ),
                        TyperAnimatedText(
                          'Lasagna.',
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'Uber',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4A148C),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.call),
                    hintText: 'Whom do you want to text?',
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email_sharp),
                    hintText: 'Message Body',
                    labelText: 'Message',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone_callback_sharp),
                    hintText: 'Phone number for reply texts',
                    labelText: 'Text Back Number (Optional)',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                MainButton(
                  onTap: () {
                    onButtonPress();
                  },
                  buttonTitleString: 'SEND',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onButtonPress() {
    // unsuccessful("This Error is Caused By Server Please Contact Admin");
    successful();
  }

  void successful() {
    Navigator.push(
      context,
      PageTransition(child: const SuccessPage(), type: PageTransitionType.fade),
    );
  }

  void unsuccessful(String errorMsg) {
    Navigator.push(
      context,
      PageTransition(
          child: FailedPage(
            errorMessage: errorMsg,
          ),
          type: PageTransitionType.fade),
    );
  }
}
