import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/custom_button_style.dart';
import 'package:bright_portfolio/util/util_service.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  final bool isMobile;
  const ContactSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Section Title: "05. What's Next?"
        Text(
          "05. What's Next?",
          style: theme.titleMedium!.copyWith(
            fontSize: isMobile ? 16 : 18,
            color: AppColors.textOrangeColor,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: isMobile ? 15 : 20),

        // Headline: "Get In Touch"
        Text(
          'Get In Touch',
          style: theme.headlineLarge!.copyWith(
            color: AppColors.whiteColor,
            fontSize: isMobile ? 30 : 54,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: isMobile ? 10 : 20),

        // Description Paragraph
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            "I'm currently open to new opportunities and collaborations. Whether you have a project in mind or just want to say hi, my inbox is always open!",
            style: theme.bodyLarge!.copyWith(
              fontSize: isMobile ? 16 : 18,
              color: AppColors.subTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: isMobile ? 40 : 50),

        // Call-to-Action Button
        ElevatedButton.icon(
          onPressed: () {
            final Uri path = Uri(
              scheme: 'mailto',
              path: 'brightahedor@gmail.com',
            );
            UtilService.launchInAppBrowser(path.toString());
          },
          icon: const Icon(Icons.mail_outline, size: 20),
          label: const Text('Say Hello'),
          style: CustomButtonStyle.primaryColored(isMobile),
        ),
      ],
    );
  }
}
