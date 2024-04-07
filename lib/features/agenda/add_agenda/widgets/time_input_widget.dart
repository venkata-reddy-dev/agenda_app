import 'package:agenda_app/features/agenda/bloc/agenda_create_cubit.dart';
import 'package:agenda_app/features/agenda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeInputWidget extends StatelessWidget {
  const TimeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMsg = context
        .select<AgendaCreateCubit, String?>((bloc) => bloc.state.timeErrorMsg);
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(width: 12),
            _StartTimeInputWidget(),
            Spacer(),
            _EndTimeInputWidget(),
            Spacer(),
          ],
        ),
        if (errorMsg != null) ...[
          const SizedBox(height: 12),
          Text(errorMsg),
        ],
      ],
    );
  }
}

class _StartTimeInputWidget extends StatelessWidget {
  const _StartTimeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final startTime = context
        .select<AgendaCreateCubit, TimeOfDay>((bloc) => bloc.state.startTime);

    return TimePickerWidget(
      label: 'Start Time',
      selectedTimeOfDay: startTime,
      onChange: (_) => context.read<AgendaCreateCubit>().updateStartTime(_),
    );
  }
}

class _EndTimeInputWidget extends StatelessWidget {
  const _EndTimeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final endTime = context
        .select<AgendaCreateCubit, TimeOfDay>((bloc) => bloc.state.endTime);

    return TimePickerWidget(
      label: 'End Time',
      selectedTimeOfDay: endTime,
      onChange: (_) => context.read<AgendaCreateCubit>().updateEndTime(_),
    );
  }
}
