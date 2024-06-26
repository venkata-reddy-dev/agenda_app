import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
import 'package:agenda_app/features/agenda/add_agenda/widgets/app_bar_widget.dart';
import 'package:agenda_app/features/agenda/add_agenda/widgets/body_widget.dart';
import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_add_cubit.dart';
import 'package:agenda_app/features/agenda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAgendaPage extends StatelessWidget {
  const AddAgendaPage._();
  static Page<void> page() => const MyPage<void>(child: AddAgendaPage._());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  AppBarWidget(
                    title: 'Add Agenda',
                    onBackTap: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(height: 12),
                  const _CalenderView(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const Expanded(child: BodyWidget()),
          ],
        ),
      ),
    );
  }
}

class _CalenderView extends StatelessWidget {
  const _CalenderView();

  @override
  Widget build(BuildContext context) {
    final date =
        context.select<AgendaAddCubit, DateTime>((bloc) => bloc.state.date);
    return DateInputWidget(
      firstDay: DateTime.now(),
      lastDay: DateTime.now().addYMD(m: 3),
      selectedDay: date,
      onDaySelected: (_) => context.read<AgendaAddCubit>().updateDate(_),
    );
  }
}
