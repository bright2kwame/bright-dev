import 'package:bright_portfolio/components/about_section.dart';
import 'package:bright_portfolio/components/contact_section.dart';
import 'package:bright_portfolio/components/custom_header.dart';
import 'package:bright_portfolio/components/footer_section.dart';
import 'package:bright_portfolio/components/hero_section.dart';
import 'package:bright_portfolio/components/open_source_projects_section.dart';
import 'package:bright_portfolio/components/resume_section.dart';
import 'package:bright_portfolio/components/tech_stack_section.dart';
import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/app_numbers.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey _aboutContainerKey = GlobalKey();
  final GlobalKey _skillsContainerKey = GlobalKey();
  final GlobalKey _projectsContainerKey = GlobalKey();
  final GlobalKey _contactContainerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final horizontalPadding = isMobile
        ? AppNumbers.kMobilePadding
        : AppNumbers.kPadding * 4;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // ADDED: Bottom line/border for visual separation
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.1),
              child: Container(
                color: AppColors.whiteColor.withAlpha(100),
                height: 0.1,
              ),
            ),
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.background,
            surfaceTintColor: AppColors.background.withAlpha(100),
            elevation: 0.0,
            toolbarHeight: isMobile ? 60 : 80,
            title: Container(
              constraints: BoxConstraints(
                maxWidth: AppNumbers.kDesktopMaxWidth,
              ),
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 80),
                child: CustomHeader(
                  isMobile: isMobile,
                  menuClicked: _menuItemClicked,
                ),
              ),
            ),
          ),

          // 2. Scrollable Content (SliverList/SliverToBoxAdapter)
          SliverList(
            delegate: SliverChildListDelegate([
              // 2. Main Content
              Container(
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 60 : 80,
                ),
                child: HeroSection(isMobile: isMobile),
              ),

              //about section
              Container(
                key: _aboutContainerKey,
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 60 : 80,
                ),
                child: AboutSection(isMobile: isMobile),
              ),

              // Content Container for Tech Stack Section (New)
              Container(
                key: _skillsContainerKey,
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 0 : 80,
                ),
                child: TechStackSection(isMobile: isMobile),
              ),

              // Content Container for Open Source Projects Section
              Container(
                key: _projectsContainerKey,
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 60 : 80,
                ),
                child: OpenSourceProjectsSection(isMobile: isMobile),
              ),

              // Content Container for Resume Section (New)
              Container(
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 60 : 80,
                ),
                child: ResumeSection(isMobile: isMobile),
              ),

              // Content Container for Contact Section (New)
              Container(
                key: _contactContainerKey,
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 60 : 80,
                ),
                child: ContactSection(isMobile: isMobile),
              ),

              Container(
                height: 0.4,
                color: AppColors.subTextColor.withAlpha(100),
              ),

              // 6. Footer Section (New)
              Container(
                constraints: BoxConstraints(
                  maxWidth: AppNumbers.kDesktopMaxWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 20 : 40,
                ),
                child: FooterSection(isMobile: isMobile),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _menuItemClicked(String title) {
    debugPrint('$title clicked');
    if (title == "About") {
      _scrollToContainer(_aboutContainerKey);
    } else if (title == "Skills") {
      _scrollToContainer(_skillsContainerKey);
    } else if (title == "Projects") {
      _scrollToContainer(_projectsContainerKey);
    } else if (title == "Contact") {
      _scrollToContainer(_contactContainerKey);
    }
  }

  void _scrollToContainer(GlobalKey containerKey) {
    final context = containerKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500), // Adjust scroll duration
        curve: Curves.easeInOut, // Adjust scroll curve
      );
    }
  }
}
