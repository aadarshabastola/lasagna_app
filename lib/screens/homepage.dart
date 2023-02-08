import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lasagna_app/screens/failedpage.dart';
import 'package:lasagna_app/screens/successspage.dart';
import 'package:lasagna_app/widgets/main_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _phoneNumberFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _textBackNumberFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final TextEditingController _messageBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                          'Texts.',
                          textStyle: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'Uber',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4A148C),
                          ),
                        ),
                        TyperAnimatedText(
                          'Lasagna',
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
                  inputFormatters: [_phoneNumberFormatter],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.call),
                    hintText: 'Whom do you want to text?',
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: _messageBodyController,
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.start,
                  minLines: 6,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 100),
                      child: Icon(Icons.email_sharp),
                    ),
                    hintText: 'Message Body',
                    labelText: 'Message',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [_textBackNumberFormatter],
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
                  onTap: () => onButtonPress(),
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
    if (_phoneNumberFormatter.getUnmaskedText().length != 10) {
      unsuccessful('Please Enter a Valid Number to Send Text To');
      return;
    }

    if (_textBackNumberFormatter.getUnmaskedText().isNotEmpty) {
      if (_textBackNumberFormatter.getUnmaskedText().length != 10) {
        unsuccessful('Please Enter a Valid Text Back Number');
        return;
      }
    }

    if (_messageBodyController.text.isEmpty) {
      unsuccessful('Please Enter a Message Body');
      return;
    }

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
