import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/data/projects.dart';
import 'package:portfolio_app/utils/constants.dart';
import 'package:portfolio_app/utils/screen_helper.dart';
import 'package:portfolio_app/utils/utils.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(desktopMaxWidth, context),
      tablet: _buildUi(tabletMaxWidth, context),
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
    );
  }

  Widget _buildUi(double width, BuildContext context) => ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'PROJECTS',
              style: GoogleFonts.oswald(
                color: brightColor,
                fontWeight: FontWeight.w900,
                fontSize: 30,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 5),
            Wrap(
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 700),
                  child: const Text(
                    'These are my best projects and most successful apps.',
                    style: TextStyle(color: brightColor, fontSize: 20),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            LayoutBuilder(builder: (context, constraints) {
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: projects
                    .map(
                      (project) => InkWell(
                        onTap: () {
                          Utils.launchLink(project.appStoreLink);
                        },
                        hoverColor: Colors.transparent,
                        child: SizedBox(
                          width: constraints.maxWidth / 2.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                project.image,
                                width: 400,
                                height: 300,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                project.description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: captionColor,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        Utils.launchLink(project.playStoreLink),
                                    icon: Image.asset(googlePlay,
                                        width: constraints.maxWidth * 0.12,
                                        fit: BoxFit.fitWidth),
                                    color: const Color(0xFFD9DEEC),
                                    iconSize: 24,
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        Utils.launchLink(project.appStoreLink),
                                    icon: Image.asset(appStore,
                                        width: constraints.maxWidth * 0.12,
                                        fit: BoxFit.fitWidth),
                                    color: const Color(0xFFD9DEEC),
                                    iconSize: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            })
          ],
        ),
      );
}
