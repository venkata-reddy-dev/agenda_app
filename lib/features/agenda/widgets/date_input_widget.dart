import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class DateInputWidget extends StatefulWidget {
  const DateInputWidget({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.selectedDay,
    required this.onDaySelected,
  });
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime selectedDay;
  final Function(DateTime selectedDate) onDaySelected;

  @override
  State<DateInputWidget> createState() => _DateInputWidgetState();
}

class _DateInputWidgetState extends State<DateInputWidget> {
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CalendarHeader(
          selectedDate: widget.selectedDay,
          onLeftArrowTap: () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          onRightArrowTap: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
        ),
        const SizedBox(height: 12),
        TableCalendar(
          firstDay: widget.firstDay,
          lastDay: widget.lastDay,
          focusedDay: widget.selectedDay,
          headerVisible: false,
          calendarFormat: CalendarFormat.week,
          selectedDayPredicate: (dateTime) =>
              dateTime.removeHMS == widget.selectedDay.removeHMS,
          onCalendarCreated: (controller) => _pageController = controller,
          onDaySelected: (date, _) => widget.onDaySelected(date),
          availableGestures: AvailableGestures.horizontalSwipe,
          calendarStyle: const CalendarStyle(isTodayHighlighted: false),
          daysOfWeekHeight: 42,
          rowHeight: 42,
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              final isSelected = day.removeHMS == widget.selectedDay.removeHMS;
              final text = DateFormat.E().format(day).substring(0, 2);
              final textWidget = Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              );

              return isSelected
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.selectedYellow,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: textWidget,
                    )
                  : Center(child: textWidget);
            },
            defaultBuilder: (_, day, ___) {
              return Center(
                child: Text(
                  '${day.day}',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
            selectedBuilder: (_, day, __) {
              final isSelected = day.removeHMS == widget.selectedDay.removeHMS;
              if (isSelected) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.selectedYellow,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    '${day.day}',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final DateTime selectedDate;

  const _CalendarHeader({
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          selectedDate.toFormat(format: 'd MMM'),
          style: context.textTheme.bodyLarge!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.white,
            size: 30,
          ),
          onPressed: onLeftArrowTap,
        ),
        IconButton(
          icon: const Icon(
            Icons.chevron_right,
            color: AppColors.white,
            size: 30,
          ),
          onPressed: onRightArrowTap,
        ),
      ],
    );
  }
}
