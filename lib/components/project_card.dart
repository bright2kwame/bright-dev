// --- NEW ProjectCard Widget for Hover Effect ---
import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/util_service.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final bool isMobile;

  const ProjectCard({super.key, required this.project, required this.isMobile});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = widget.isMobile;
    final Map<String, dynamic> project = widget.project;

    final TextStyle titleStyle = TextStyle(
      color: AppColors.textColor,
      fontSize: isMobile ? 16 : 20,
      fontWeight: FontWeight.normal,
    );
    final TextStyle descStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontSize: isMobile ? 12 : 14,
      color: AppColors.subTextColor,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedScale(
        scale: _isHovering ? 1.03 : 1.0, // Scale up slightly on hover
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: InkWell(
          onTap: () {
            debugPrint('Project clicked: ${project['link']}');
            UtilService.launchInAppBrowser(project['link']);
          },
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.subTextColor.withAlpha(100)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textOrangeColor.withAlpha(100),
                  blurRadius: _isHovering ? 0.2 : 0,
                  offset: Offset(0, _isHovering ? 0.2 : 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Header (Title and Icon)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(project['title'], style: titleStyle)),
                    Icon(
                      Icons
                          .folder_outlined, // Placeholder for GitHub/Project Icon
                      color: AppColors.subTextColor,
                      size: 32,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Description
                Text(
                  project['description'],
                  style: descStyle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 24),

                // Tech Tags
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: (project['tech_tags'] as List<String>).map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.subTextColor.withAlpha(100),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: AppColors.subTextColor,
                          fontSize: isMobile ? 12 : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
