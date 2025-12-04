import 'package:bright_portfolio/util/app_colors.dart';
import 'package:flutter/material.dart';

class TechTag extends StatefulWidget {
  final String name;
  final IconData icon;
  const TechTag({super.key, required this.name, required this.icon});

  @override
  State<TechTag> createState() => _TechTagState();
}

class _TechTagState extends State<TechTag> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _shadowColorAnimation;

  @override
  void initState() {
    super.initState();
    // Use a short duration for a snappy hover effect
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    // Animate scale from 1.0 to 1.05 and back on hover (more noticeable than the old 1.03)
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _shadowColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: AppColors.textOrangeColor.withAlpha(500),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onEnter(PointerEvent details) {
    // Start the animation forward when hovered
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    // Reverse the animation back to the original state when hover ends
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedBuilder(
        animation: _controller, // Animate based on the controller's value
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.textOrangeColor.withAlpha(100),
                ),
                boxShadow: [
                  BoxShadow(
                    // Use the animated color for a glowing effect on hover
                    color: _shadowColorAnimation.value ?? Colors.transparent,
                    blurRadius: 15, // Increased blur for a better glow
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(widget.icon, color: AppColors.textOrangeColor, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
