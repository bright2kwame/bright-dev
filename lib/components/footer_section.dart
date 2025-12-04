import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/app_strings.dart';
import 'package:bright_portfolio/util/util_service.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FooterSection extends StatelessWidget {
  final bool isMobile;
  const FooterSection({super.key, required this.isMobile});

  // Reusable icon button for social links
  Widget _buildSocialIcon(IconData icon, String label) {
    return IconButton(
      icon: Icon(icon, color: AppColors.subTextColor, size: isMobile ? 24 : 28),
      onPressed: () {
        String url = "";
        if (label.contains("LinkedIn")) {
          url = AppStrings.githubPageLink;
        }
        if (label.contains("GitHub")) {
          url = AppStrings.githubPageLink;
        }
        if (label.contains("Email")) {
          url = Uri(
            scheme: 'mailto',
            path: 'brightahedor@gmail.com',
          ).toString();
        }
        UtilService.launchInAppBrowser(url);
      },
      tooltip: label,
      hoverColor: AppColors.textOrangeColor.withOpacity(0.1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Social Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(LineIcons.github, 'GitHub'),
                    _buildSocialIcon(LineIcons.linkedin, 'LinkedIn'),
                    _buildSocialIcon(LineIcons.envelopeAlt, 'Email'),
                  ],
                ),
                const SizedBox(height: 15),
                // Copyright/Tagline
                Text(
                  'Built with passion & purpose.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    color: AppColors.subTextColor.withOpacity(0.7),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Copyright/Tagline
                Text(
                  'Built with passion & purpose.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    color: AppColors.subTextColor.withOpacity(0.7),
                  ),
                ),
                // Social Icons Row
                Row(
                  children: [
                    _buildSocialIcon(LineIcons.github, 'GitHub'),
                    _buildSocialIcon(LineIcons.linkedin, 'LinkedIn'),
                    _buildSocialIcon(LineIcons.envelopeAlt, 'Email'),
                  ],
                ),
              ],
            ),
    );
  }
}
