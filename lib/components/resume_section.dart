import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/app_strings.dart';
import 'package:bright_portfolio/util/custom_button_style.dart';
import 'package:bright_portfolio/util/util_service.dart';
import 'package:flutter/material.dart';

class ResumeSection extends StatelessWidget {
  final bool isMobile;
  const ResumeSection({super.key, required this.isMobile});

  final List<Map<String, String>> highlights = const [
    {
      'title': 'Lead FrontEnd Engineer',
      'subtitle':
          'Led re-deployment of legacy codebase (Java/Kotlin/Swift) for a Payment and Savings App.',
    },
    {
      'title': 'Open Source Maintainer',
      'subtitle':
          'Active contributor and maintainer of 3+ popular open-source packages and tools.',
    },
    {
      'title': 'Community & Tech Mentor',
      'subtitle':
          'Mentored 35+ startups at MEST Africa, providing strategic guidance and securing funding.',
    },
  ];

  Widget _buildHighlightItem(
    BuildContext context,
    Map<String, String> highlight,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 4.0),
            child: Icon(
              Icons.circle,
              color: AppColors.textOrangeColor,
              size: 8,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  highlight['title']!,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  highlight['subtitle']!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: isMobile ? 14 : 16,
                    color: AppColors.subTextColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title: "04. Resume"
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '04. ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.textOrangeColor,
              ),
            ),
            Text(
              'Resume',
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

        // Resume Card
        Container(
          padding: EdgeInsets.all(isMobile ? 24 : 40),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.subTextColor.withAlpha(100)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience Highlights',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.whiteColor,
                  fontSize: isMobile ? 22 : 28,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 25),

              // Highlights List
              ...highlights.map((h) => _buildHighlightItem(context, h)),

              const SizedBox(height: 15),

              // Download Button
              OutlinedButton.icon(
                onPressed: () {
                  UtilService.launchInAppBrowser(AppStrings.resumeLink);
                },
                icon: const Icon(Icons.download_rounded, size: 20),
                label: const Text('Download Full Resume'),
                style: CustomButtonStyle.primaryOutline(isMobile),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
