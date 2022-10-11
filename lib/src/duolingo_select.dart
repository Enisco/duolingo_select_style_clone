import 'package:duolingo_select_style_clone/src/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

TextEditingController scienceController = TextEditingController();
TextEditingController theController = TextEditingController();

class DuolingoSelectStyleClone extends StatefulWidget {
  const DuolingoSelectStyleClone({super.key});

  @override
  State<DuolingoSelectStyleClone> createState() =>
      _DuolingoSelectStyleCloneState();
}

class _DuolingoSelectStyleCloneState extends State<DuolingoSelectStyleClone> {
  late FocusNode scienceNode;
  late FocusNode theNode;

  List<bool> boxHasFocus = [
    false,
    false,
  ];

  List<String> options = [
    'science',
    'pothos',
    'value',
    'the',
    'life',
  ];

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> selectedStrings = ['', ''];

  @override
  void initState() {
    super.initState();
    scienceNode = FocusNode();
    theNode = FocusNode();
  }

  @override
  void dispose() {
    scienceNode.dispose();
    theNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Duolingo Clone',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green.shade700,
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: size.width,
                height: size.height / 5,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    customspacer(),
                    InkWell(
                      onTap: (() {
                        for (int i = 0; i < boxHasFocus.length; i++) {
                          boxHasFocus[i] = false;
                        }

                        print('boxHasFocus: $boxHasFocus');
                        boxHasFocus[0] = true;
                        print('boxHasFocus: $boxHasFocus');
                      }),
                      child: customContainer(
                        Text(
                          selectedStrings[0],
                          style: textStyle,
                        ),
                      ),
                    ),
                    customspacer(),
                    Text(
                      'is',
                      style: textStyle,
                    ),
                    customspacer(),
                    InkWell(
                      onTap: (() {
                        for (int i = 0; i < boxHasFocus.length; i++) {
                          boxHasFocus[i] = false;
                        }
                        print('boxHasFocus: $boxHasFocus');
                        boxHasFocus[1] = true;
                        print('boxHasFocus: $boxHasFocus');
                      }),
                      child: customContainer(
                        Text(
                          selectedStrings[1],
                          style: textStyle,
                        ),
                      ),
                    ),
                    customspacer(),
                    Text(
                      'ethos of all',
                      style: textStyle,
                    ),
                  ],
                ),
              ),

              /// The selection buttons
              Wrap(
                children: [
                  for (int i = 0; i < options.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: ActionChip(
                        disabledColor: Colors.white,
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color:
                                isSelected[i] ? Colors.green : Colors.black54,
                            width: 2.0,
                          ),
                        ),
                        label: Text(
                          options[i],
                          style: TextStyle(
                            color: isSelected[i]
                                ? Colors.transparent
                                : Colors.green[800],
                          ),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              for (int index = 0;
                                  index < boxHasFocus.length;
                                  index++) {
                                if (boxHasFocus[index] == true) {
                                  isSelected[i] = true;
                                  selectedStrings[index] = options[i];
                                }
                              }
                            },
                          );
                        },
                      ),
                    )
                ],
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  /// RESET THE SCREEN
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DuolingoSelectStyleClone()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.refresh_thick,
                    size: 50,
                    color: Colors.red[700],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
