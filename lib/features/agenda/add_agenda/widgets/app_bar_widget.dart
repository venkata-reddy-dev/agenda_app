import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.onBackTap,
    required this.title,
  });
  final VoidCallback onBackTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onBackTap,
          child: CircleAvatar(
            backgroundColor: AppColors.appbarBgDart,
            radius: 20,
            child: const Icon(Icons.arrow_back),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style:
              context.textTheme.headlineSmall?.copyWith(color: AppColors.white),
        ),
        const Spacer(),
        const SizedBox(width: 40),
      ],
    );
  }
}
