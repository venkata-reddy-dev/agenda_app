import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/features/agenda/add_agenda/widgets/app_bar_widget.dart';
import 'package:agenda_app/features/agenda/add_agenda/widgets/body_widget.dart';
import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class AddAgendaPage extends StatelessWidget {
  const AddAgendaPage._();
  static Page<void> page() => const MyPage<void>(child: AddAgendaPage._());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.inverseSurface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  AppBarWidget(
                    title: 'Agenda',
                    onBackTap: () => context.flow<AgendaNavState>().complete(),
                  ),
                  const SizedBox(height: 16),
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
  const _CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Text(
        'Calender view',
        style: context.textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
    );
  }
}
