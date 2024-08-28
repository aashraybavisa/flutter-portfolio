import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/utils/constants.dart';
import 'package:portfolio_app/utils/screen_helper.dart';
import 'package:portfolio_app/utils/utils.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.amber,
    Colors.cyan,
    Colors.brown,
  ];
  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: _buildUi(desktopMaxWidth),
        tablet: _buildUi(tabletMaxWidth),
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context)),
      );
  _buildUi(double width) => Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            helloTag,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w100,
                              color: brightColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            name,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color: brightColor,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'I\'m',
                                  style: TextStyle(
                                    fontFamily: 'Horizon',
                                    fontSize: 40,
                                    color: brightColor,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Horizon',
                                    color: brightColor,
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      RotateAnimatedText('Passionate'),
                                      RotateAnimatedText('Creative'),
                                      RotateAnimatedText('Mobile Developer'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            miniDescription,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: brightColor,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                Utils.launchLink(resumeLink);
                              },
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                  width: 3,
                                  color: primaryColor,
                                ),
                                backgroundColor: backgroundColor,
                                padding: const EdgeInsets.all(20),
                              ),
                              child: const Text('Download CV',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 3,
                      child: Lottie.asset('assets/animation/yoga.json'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
