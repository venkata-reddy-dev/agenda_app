import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_add_cubit.dart';
import 'package:agenda_app/features/agenda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeInputWidget extends StatelessWidget {
  const TimeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMsg = context
        .select<AgendaAddCubit, String?>((bloc) => bloc.state.timeErrorMsg);
    return Column(
      children: [
        const Row(
          children: [
            _StartTimeInputWidget(),
            Spacer(),
            _EndTimeInputWidget(),
            Spacer(),
          ],
        ),
        if (errorMsg != null) ...[
          const SizedBox(height: 12),
          Text(
            errorMsg,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
          ),
        ],
      ],
    );
  }
}

class _StartTimeInputWidget extends StatelessWidget {
  const _StartTimeInputWidget();

  @override
  Widget build(BuildContext context) {
    final startTime = context
        .select<AgendaAddCubit, TimeOfDay>((bloc) => bloc.state.startTime);

    return TimePickerWidget(
      label: 'Start Time',
      selectedTimeOfDay: startTime,
      onChange: (_) => context.read<AgendaAddCubit>().updateStartTime(_),
    );
  }
}

class _EndTimeInputWidget extends StatelessWidget {
  const _EndTimeInputWidget();

  @override
  Widget build(BuildContext context) {
    final endTime =
        context.select<AgendaAddCubit, TimeOfDay>((bloc) => bloc.state.endTime);

    return TimePickerWidget(
      label: 'End Time',
      selectedTimeOfDay: endTime,
      onChange: (_) => context.read<AgendaAddCubit>().updateEndTime(_),
    );
  }
}
