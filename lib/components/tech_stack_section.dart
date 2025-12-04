import 'package:bright_portfolio/components/tech_tag.dart';
import 'package:bright_portfolio/util/app_colors.dart';
import 'package:flutter/material.dart';

class TechStackSection extends StatefulWidget {
  final bool isMobile;
  const TechStackSection({super.key, required this.isMobile});

  @override
  State<TechStackSection> createState() => _TechStackSectionState();
}

class _TechStackSectionState extends State<TechStackSection> {
  final List<Map<String, dynamic>> technologies = const [
    {'name': 'Python', 'icon': Icons.data_object},
    {'name': 'Java', 'icon': Icons.code},
    {'name': 'Dart', 'icon': Icons.flutter_dash},
    {'name': 'Flutter', 'icon': Icons.flutter_dash},
    {'name': 'Swift', 'icon': Icons.mobile_friendly},
    {'name': 'Android', 'icon': Icons.android},
    {'name': 'iOS', 'icon': Icons.apple},
    {'name': 'SQL', 'icon': Icons.storage},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title: "02. Tech Stack"
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '02. ',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.textOrangeColor,
              ),
            ),
            Text(
              'Tech Stack',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.whiteColor,
                fontSize: widget.isMobile ? 28 : 36,
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
        SizedBox(height: widget.isMobile ? 30 : 50),

        // Tech Stack Tags (uses Wrap for responsiveness)
        Wrap(
          alignment: WrapAlignment.start,
          children: technologies.map((tech) {
            return TechTag(name: tech['name'].toString(), icon: tech['icon']);
          }).toList(),
        ),
      ],
    );
  }
}
