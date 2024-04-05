import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.onBackTap,
    required this.title,
    required this.onAddAgendaTap,
  });
  final VoidCallback onBackTap;
  final VoidCallback onAddAgendaTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onBackTap,
          child: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(.2),
            radius: 20,
            child: const Icon(Icons.arrow_back),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: context.textTheme.headlineSmall,
        ),
        const Spacer(),
        InkWell(
          onTap: onAddAgendaTap,
          child: CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(.2),
            radius: 20,
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 10,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
