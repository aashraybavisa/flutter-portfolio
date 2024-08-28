import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/data/footer_items.dart';
import 'package:portfolio_app/utils/constants.dart';
import 'package:portfolio_app/utils/screen_helper.dart';
import 'package:portfolio_app/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) => ScreenHelper(
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUi(tabletMaxWidth, context),
        desktop: _buildUi(desktopMaxWidth, context),
      );

  Widget _buildUi(double width, BuildContext context) {
    return SizedBox(
      height: ScreenHelper.isMobile(context)
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.height / 2, // Full height of the screen
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Ensures footer stays at the bottom
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 40), // Adjusted horizontal padding
                child: Wrap(
                  spacing: ScreenHelper.isMobile(context) ? 0 : width * .05,
                  runSpacing: ScreenHelper.isMobile(context) ? 0 : width * .05,
                  children: footerItems
                      .map(
                        (footerItem) => InkWell(
                          onTap: () {
                            Utils.launchLink(footerItem.link);
                          },
                          hoverColor: Colors.transparent,
                          child: SizedBox(
                            height: 120,
                            width: ScreenHelper.isMobile(context)
                                ? width * .5
                                : width * .2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(footerItem.iconPath,
                                        color: primaryColor, width: 25),
                                    const SizedBox(width: 15),
                                    Text(
                                      footerItem.title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: brightColor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${footerItem.text1}\n',
                                        style: const TextStyle(
                                          color: captionColor,
                                          height: 1.8,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          // Footer section with Copyright and T&C
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal:
                    16), // Maintains horizontal padding for the footer as well
            child: Column(
              children: [
                const Text(
                  copyrightText,
                  style: TextStyle(color: captionColor),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Utils.launchLink(privacyLink);
                      },
                      child: const MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(color: captionColor),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        '|',
                        style: TextStyle(color: captionColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Utils.launchLink(tncLink);
                      },
                      child: const MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(color: captionColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
