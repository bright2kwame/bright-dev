import 'package:bright_portfolio/components/project_card.dart';
import 'package:bright_portfolio/util/app_colors.dart';
import 'package:flutter/material.dart';

class OpenSourceProjectsSection extends StatelessWidget {
  final bool isMobile;
  const OpenSourceProjectsSection({super.key, required this.isMobile});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Clearpath HQ',
      'description':
          'A friendly lightweight free product/project management tool for 1-20 team size startups.',
      'tech_tags': ['Python', 'Django', 'Web'],
      'link': 'https://github.com/Clearpath-HQ/Clearpath_backend',
    },
    {
      'title': 'Timeline History',
      'description':
          'A Flutter package for building interactive and visually appealing timeline interfaces for project management or history visualization.',
      'tech_tags': ['Dart', 'Flutter', 'UI'],
      'link': 'https://pub.dev/packages/timeline_tree',
    },
    {
      'title': 'Flutter Simple Toast',
      'description':
          'A Dart package that allows developers to easily display toast messages in their mobile applications with custom styling.',
      'tech_tags': ['Dart', 'Flutter', 'Mobile'],
      'link': 'https://pub.dev/packages/simple_toast_message',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title: "03. Open Source Projects"
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '03. ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.textOrangeColor,
              ),
            ),
            Text(
              'Open Source Projects',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.whiteColor,
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Decorative line
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 0.4,
                color: AppColors.subTextColor.withAlpha(100),
              ),
            ),
          ],
        ),

        SizedBox(height: isMobile ? 30 : 50),

        // Project Cards Layout
        isMobile
            ? Column(
                children: projects
                    .map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: ProjectCard(project: p, isMobile: isMobile),
                      ),
                    )
                    .toList(),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: projects
                    .map(
                      (p) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ProjectCard(project: p, isMobile: isMobile),
                        ),
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }
}
