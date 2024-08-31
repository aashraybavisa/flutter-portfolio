import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_app/utils/constants.dart';
import 'package:portfolio_app/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(desktopMaxWidth, context),
      tablet: _buildUi(tabletMaxWidth, context),
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  const TextStyle style = TextStyle(color: brightColor, fontSize: 20);

  return SizedBox(
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
                // Lottie animation container
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 3,
                  child: Lottie.asset(
                    'assets/animation/coder.json',
                    width: ScreenHelper.isMobile(context) ? 300 : 500,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 40), // Space between elements
                // Text content container
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABOUT',
                        style: GoogleFonts.oswald(
                          color: brightColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        aboutFirst,
                        style: style,
                      ),
                      const Text(
                        aboutSecond,
                        style: style,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
