import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/router_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatelessWidget {
  final bool isMobile;
  final Function(String label) menuClicked;
  const CustomHeader({
    super.key,
    required this.isMobile,
    required this.menuClicked,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      // Mobile Header: Logo and a simple menu icon
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'B.Ahedor',
            style: TextStyle(
              color: AppColors.textOrangeColor,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
            icon: Icon(Icons.menu, color: AppColors.textColor),
            onPressed: () {
              context.go(AppRouter.root);
            },
          ),
        ],
      );
    } else {
      // Desktop Header: Logo and full navigation links
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'B.Ahedor',
            style: TextStyle(
              color: AppColors.textOrangeColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              _navItem(context, 'About'),
              _navItem(context, 'Skills'),
              _navItem(context, 'Projects'),
              _navItem(context, 'Contact'),
            ],
          ),
        ],
      );
    }
  }

  Widget _navItem(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
        ),
        onPressed: () {
          menuClicked(title);
        },
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.subTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
