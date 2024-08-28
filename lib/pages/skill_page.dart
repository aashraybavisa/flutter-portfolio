// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:portfolio_app/data/skill_list.dart';
// import 'package:portfolio_app/utils/constants.dart';
// import 'package:portfolio_app/utils/screen_helper.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// class SkillPage extends StatelessWidget {
//   const SkillPage({super.key});

//   @override
//   Widget build(BuildContext context) => ScreenHelper(
//         mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
//         tablet: _buildUi(tabletMaxWidth, context),
//         desktop: _buildUi(desktopMaxWidth, context),
//       );

//   Widget _buildUi(double width, BuildContext context) => SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: Center(
//           child: LayoutBuilder(builder: (context, constraints) {
//             // const style = TextStyle(color: brightColor, fontSize: 20);
//             return Expanded(
//               child: ResponsiveWrapper(
//                 maxWidth: width,
//                 minWidth: width,
//                 child: Flex(
//                   direction: ScreenHelper.isMobile(context)
//                       ? Axis.vertical
//                       : Axis.horizontal,
//                   children: [
//                     Expanded(
//                       flex: ScreenHelper.isMobile(context) ? 0 : 2,
//                       child: Lottie.asset(
//                         'assets/animation/skills.json',
//                         width: 500,
//                       ),
//                     ),
//                     const SizedBox(width: 40),
//                     Expanded(
//                       flex: ScreenHelper.isMobile(context) ? 0 : 4,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'SKILLS',
//                             style: GoogleFonts.oswald(
//                               color: brightColor,
//                               fontWeight: FontWeight.w900,
//                               fontSize: 28,
//                               height: 1.3,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           const Text(
//                             skill,
//                             style: TextStyle(color: captionColor, fontSize: 20),
//                           ),
//                           const SizedBox(height: 16),
//                           Column(
//                               children: skills
//                                   .map(
//                                     (skill) => Container(
//                                       margin: const EdgeInsets.only(bottom: 16),
//                                       child: Row(children: [
//                                         Expanded(
//                                           flex: skill.percentage,
//                                           child: Container(
//                                             padding:
//                                                 const EdgeInsets.only(left: 12),
//                                             alignment: Alignment.centerLeft,
//                                             height: 38,
//                                             color: brightColor,
//                                             child: Text(skill.skill),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           flex: 100 - skill.percentage,
//                                           child:
//                                               const Divider(color: brightColor),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Text(
//                                           '${skill.percentage}%',
//                                           style: const TextStyle(
//                                               color: brightColor, fontSize: 16),
//                                         )
//                                       ]),
//                                     ),
//                                   )
//                                   .toList())
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_app/data/skill_list.dart';
import 'package:portfolio_app/utils/constants.dart';
import 'package:portfolio_app/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context) => ScreenHelper(
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUi(tabletMaxWidth, context),
        desktop: _buildUi(desktopMaxWidth, context),
      );

  Widget _buildUi(double width, BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                defaultScale: false,
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Lottie.asset(
                        'assets/animation/skills.json',
                        width: constraints.maxWidth *
                            0.5, // Adjust width dynamically
                        height: constraints.maxHeight *
                            0.5, // Added height for control
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SKILLS',
                            style: GoogleFonts.oswald(
                              color: brightColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            skill,
                            style: TextStyle(color: captionColor, fontSize: 20),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            children: skills
                                .map(
                                  (skill) => Container(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: skill.percentage,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 12),
                                            alignment: Alignment.centerLeft,
                                            height: 38,
                                            color: brightColor,
                                            child: Text(skill.skill),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          flex: 100 - skill.percentage,
                                          child:
                                              const Divider(color: brightColor),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          '${skill.percentage}%',
                                          style: const TextStyle(
                                            color: brightColor,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
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
