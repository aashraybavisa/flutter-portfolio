import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/utils/constants.dart';
import 'package:portfolio_app/utils/globals.dart';
import 'package:portfolio_app/utils/screen_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({
    super.key,
    required this.opacity,
    required this.itemsScrollController,
  });

  final double opacity;
  final ItemScrollController itemsScrollController;

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final desktopheader = PreferredSize(
        child: DesktopTabBar(
          widget: widget,
          screenSize: screenSize,
          itemsScrollController: widget.itemsScrollController,
        ),
        preferredSize: Size(screenSize.width, 70));

    return ScreenHelper(
      desktop: desktopheader,
      tablet: desktopheader,
      mobile: buildMobileHeader(),
    );
  }
}

class DesktopTabBar extends StatelessWidget {
  const DesktopTabBar(
      {super.key,
      required this.screenSize,
      required this.widget,
      this.itemsScrollController});

  final Size screenSize;
  final TopBarContents widget;
  final ItemScrollController? itemsScrollController;

  InkWell menuItem(
      {required int toPage, required String title, required Color color}) {
    return InkWell(
      onTap: () => itemsScrollController?.scrollTo(
        index: toPage,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: brightColor.withOpacity(widget.opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 24),
            menuItem(toPage: 0, title: 'Home', color: brightColor),
            const SizedBox(width: 24),
            menuItem(toPage: 1, title: 'About', color: brightColor),
            const SizedBox(width: 24),
            menuItem(toPage: 2, title: 'Projects', color: brightColor),
            const SizedBox(width: 24),
            menuItem(toPage: 3, title: 'Education', color: brightColor),
            const SizedBox(width: 24),
            menuItem(toPage: 4, title: 'Skills', color: brightColor),
            const SizedBox(width: 24),
            menuItem(toPage: 5, title: 'Contact Me', color: primaryColor)
          ],
        ),
      ),
    );
  }
}

Widget buildMobileHeader() => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              onTap: () => Globals.scaffoldKey.currentState!.openEndDrawer(),
              child: const Icon(
                Icons.menu,
                color: brightColor,
                size: 28,
              ),
            )
          ],
        ),
      ),
    );

class HeaderLogo extends StatelessWidget {
  HeaderLogo({super.key});

  final style = GoogleFonts.oswald(
    color: brightColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Image.asset(
        'assets/192.png',
        color: primaryColor,
        fit: BoxFit.contain,
      ));
}
