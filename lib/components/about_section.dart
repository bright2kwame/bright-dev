import 'package:bright_portfolio/util/app_colors.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final bool isMobile;
  const AboutSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title: "01. About Me"
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '01. ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.textOrangeColor,
              ),
            ),
            Text(
              'About Me',
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

        // Content Layout (Text and Cards)
        isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
      ],
    );
  }

  // Desktop Layout: Text on Left, Cards on Right
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column (Text)
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I'm a versatile software developer with expertise spanning mobile and backend development. My journey in tech has led me to work with diverse technologies, from building cross-platform mobile apps with Flutter to crafting native iOS experiences with Swift.",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.subTextColor),
              ),
              const SizedBox(height: 20),
              Text(
                "Beyond coding, I'm deeply involved in the open-source community, contributing to projects that help fellow developers. I believe in giving back and sharing knowledge.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.subTextColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "When I'm not writing code, you'll find me tending to my urban farm or creating content about personal finance and investment strategies. Life is about balance!",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.subTextColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 40),

        // Right Column (Cards)
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildInfoCard(
                context,
                icon: Icons.grass_outlined,
                title: 'Urban Farmer',
                subtitle:
                    'Growing organic produce and promoting sustainable living.',
              ),
              const SizedBox(height: 20),
              _buildInfoCard(
                context,
                icon: Icons.trending_up_outlined,
                title: 'Finance Creator',
                subtitle: 'Sharing financial insights and investment wisdom.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Mobile Layout: Text on Top, Cards on Bottom (Stacked)
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text Section
        Text(
          "I'm a versatile software developer with expertise spanning mobile and backend development. My journey in tech has led me to work with diverse technologies, from building cross-platform mobile apps with Flutter to crafting native iOS experiences with Swift.",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16,
            color: AppColors.subTextColor,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Beyond coding, I'm deeply involved in the open-source community, contributing to projects that help fellow developers. I believe in giving back and sharing knowledge.",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16,
            color: AppColors.subTextColor,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "When I'm not writing code, you'll find me tending to my urban farm or creating content about personal finance and investment strategies. Life is about balance!",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16,
            color: AppColors.subTextColor,
          ),
        ),

        SizedBox(height: isMobile ? 40 : 50),

        // Cards Section
        _buildInfoCard(
          context,
          icon: Icons.grass_outlined,
          title: 'Urban Farmer',
          subtitle: 'Growing organic produce and promoting sustainable living.',
        ),
        const SizedBox(height: 20),
        _buildInfoCard(
          context,
          icon: Icons.trending_up_outlined,
          title: 'Finance Creator',
          subtitle: 'Sharing financial insights and investment wisdom.',
        ),
      ],
    );
  }

  // Reusable Card Widget
  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.subTextColor.withAlpha(100)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColors.textOrangeColor,
            size: isMobile ? 28 : 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: isMobile ? 18 : 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.subTextColor,
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
