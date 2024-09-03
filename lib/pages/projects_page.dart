// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:portfolio_app/data/projects.dart';
// import 'package:portfolio_app/utils/constants.dart';
// import 'package:portfolio_app/utils/screen_helper.dart';
// import 'package:portfolio_app/utils/utils.dart';
// import 'package:responsive_framework/responsive_wrapper.dart';

// class ProjectsPage extends StatelessWidget {
//   const ProjectsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenHelper(
//       desktop: _buildUi(desktopMaxWidth, context),
//       tablet: _buildUi(tabletMaxWidth, context),
//       mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
//     );
//   }

//   Widget _buildUi(double width, BuildContext context) => ResponsiveWrapper(
//         maxWidth: width,
//         minWidth: width,
//         defaultScale: false,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: ScreenHelper.deviceMaxHeight(context) * 0.15),
//             Text(
//               'PROJECTS',
//               style: GoogleFonts.oswald(
//                 color: brightColor,
//                 fontWeight: FontWeight.w900,
//                 fontSize: 30,
//                 height: 1.3,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Wrap(
//               children: [
//                 Container(
//                   constraints: const BoxConstraints(maxHeight: 700),
//                   child: const Text(
//                     'These are my best projects and most successful apps.',
//                     style: TextStyle(color: brightColor, fontSize: 20),
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(height: 40),
//             LayoutBuilder(builder: (context, constraints) {
//               return Wrap(
//                 spacing: 20,
//                 runSpacing: 20,
//                 children: projects
//                     .map(
//                       (project) => InkWell(
//                         onTap: () {
//                           Utils.launchLink(project.appStoreLink);
//                         },
//                         hoverColor: Colors.transparent,
//                         child: SizedBox(
//                           width: constraints.maxWidth / 2.0 - 20.0,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.asset(
//                                 project.image,
//                                 width: 400,
//                                 height: 300,
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 project.description,
//                                 maxLines: 4,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   color: captionColor,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () =>
//                                         Utils.launchLink(project.playStoreLink),
//                                     icon: Image.asset(googlePlay,
//                                         width: constraints.maxWidth * 0.12,
//                                         fit: BoxFit.fitWidth),
//                                     color: const Color(0xFFD9DEEC),
//                                     iconSize: 24,
//                                   ),
//                                   IconButton(
//                                     onPressed: () =>
//                                         Utils.launchLink(project.appStoreLink),
//                                     icon: Image.asset(appStore,
//                                         width: constraints.maxWidth * 0.12,
//                                         fit: BoxFit.fitWidth),
//                                     color: const Color(0xFFD9DEEC),
//                                     iconSize: 24,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                     .toList(),
//               );
//             })
//           ],
//         ),
//       );
// }

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

  Widget _buildUi(double width, BuildContext context) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: ScreenHelper.deviceMaxHeight(context) * 0.15),
          Text(
            'PROJECTS',
            style: GoogleFonts.oswald(
              color: brightColor,
              fontWeight: FontWeight.w900,
              fontSize: ScreenHelper.isMobile(context) ? 24 : 30,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'These are my best projects and most successful apps.',
            style: TextStyle(color: brightColor, fontSize: 20),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              // Set dynamic column count based on screen size
              final int columnCount = _getColumnCount(constraints.maxWidth);
              final double itemWidth =
                  (constraints.maxWidth / columnCount) - 20;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: projects
                    .map(
                      (project) => SizedBox(
                        width: itemWidth,
                        child: InkWell(
                          onTap: () {
                            Utils.launchLink(project.appStoreLink);
                          },
                          hoverColor: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  project.image,
                                  width: itemWidth,
                                  height: itemWidth * 0.75, // 4:3 aspect ratio
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                project.description,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: brightColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        Utils.launchLink(project.playStoreLink),
                                    icon: Image.asset(
                                      googlePlay,
                                      width: constraints.maxWidth * 0.15,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        Utils.launchLink(project.appStoreLink),
                                    icon: Image.asset(
                                      appStore,
                                      width: constraints.maxWidth * 0.15,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  // Method to determine column count based on screen width
  int _getColumnCount(double width) {
    if (width > 500) {
      return 2;
    } else {
      return 1;
    }
  }
}
