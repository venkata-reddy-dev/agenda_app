import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({
    super.key,
    required this.label,
    required this.selectedTimeOfDay,
    required this.onChange,
  });

  final String label;
  final TimeOfDay selectedTimeOfDay;
  final Function(TimeOfDay timeOfDay) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () async {
            final timeOfDay = await showTimePicker(
              initialTime: selectedTimeOfDay,
              helpText: 'Select $label',
              context: context,
            );

            if (timeOfDay == null) {
              return;
            }

            onChange(timeOfDay);
          },
          child: Row(
            children: [
              const Icon(Icons.access_alarm),
              const SizedBox(width: 4),
              Text(
                selectedTimeOfDay.format(context),
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
