import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/app_strings.dart';
import 'package:bright_portfolio/util/custom_button_style.dart';
import 'package:bright_portfolio/util/util_service.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // "Hi, my name is"
        Text(
          'Hi, my name is',
          style: theme.titleMedium!.copyWith(color: AppColors.textOrangeColor),
        ),
        const SizedBox(height: 16),

        // "John Developer."
        Text(
          'Bright Ahedor.',
          style: theme.headlineLarge!.copyWith(
            fontSize: isMobile ? 48 : 72,
            color: AppColors.whiteColor,
          ),
        ),
        const SizedBox(height: 10),

        // "I build things for the digital world."
        Text(
          'I build things for the digital world.',
          style: theme.headlineMedium!.copyWith(
            fontSize: isMobile ? 32 : 48,
            color: AppColors.subTextColor,
          ),
        ),
        const SizedBox(height: 30),

        // Description Paragraph
        Text(
          'Full-stack developer passionate about mobile & web applications. Open-source contributor, urban farmer, and finance content creator. Building software that makes a difference.',
          style: theme.bodyLarge!.copyWith(
            fontSize: isMobile ? 16 : 20,
            color: AppColors.subTextColor,
          ),
        ),
        const SizedBox(height: 50),

        // Action Buttons
        Row(
          mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
          children: [
            // Primary Button
            Expanded(
              flex: isMobile ? 1 : 0,
              child: ElevatedButton(
                onPressed: () {
                  UtilService.launchInAppBrowser(AppStrings.githubPageLink);
                },
                style: CustomButtonStyle.primaryColored(isMobile),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('View My Work'),
                    SizedBox(width: 8),
                    Icon(Icons.open_in_new, size: 18),
                  ],
                ),
              ),
            ),
            SizedBox(width: isMobile ? 10 : 20),

            // Secondary Button
            Expanded(
              flex: isMobile ? 1 : 0,
              child: OutlinedButton(
                onPressed: () {
                  final Uri path = Uri(
                    scheme: 'mailto',
                    path: 'brightahedor@gmail.com',
                  );
                  UtilService.launchInAppBrowser(path.toString());
                },
                style: CustomButtonStyle.primaryOutline(isMobile),
                child: const Text('Get In Touch'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
