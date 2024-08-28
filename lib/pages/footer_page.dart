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

  Widget _buildUi(double width, BuildContext context) => Center(
        heightFactor: width > 1200 ? 1 : 2,
        child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      bottom: 40,
                    ),
                    child: Wrap(
                      spacing: ScreenHelper.isMobile(context)
                          ? 0
                          : constraints.maxWidth * .05,
                      runSpacing: ScreenHelper.isMobile(context)
                          ? 0
                          : constraints.maxWidth * .05,
                      children: footerItems
                          .map(
                            (footerItem) => InkWell(
                              onTap: () {
                                Utils.launchURL(footerItem.link);
                              },
                              hoverColor: Colors.transparent,
                              child: SizedBox(
                                height: 120,
                                width: ScreenHelper.isMobile(context)
                                    ? constraints.maxWidth * .5
                                    : constraints.maxWidth * .2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                  const SizedBox(height: 20),
                  Flex(
                    direction: ScreenHelper.isMobile(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    mainAxisAlignment: ScreenHelper.isMobile(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          copyrightText,
                          style: TextStyle(color: captionColor),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Utils.launchURL(privacyLink);
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
                              Utils.launchURL(tncLink);
                            },
                            child: const MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                'Terms & Condition',
                                style: TextStyle(color: captionColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16)
                ],
              );
            },
          ),
        ),
      );
}
