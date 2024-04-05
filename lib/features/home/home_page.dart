import 'package:agenda_app/features/agenda/agenda_flow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda flow'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(AgendaFlow.route()),
          child: const Text('Open Agenda flow'),
        ),
      ),
    );
  }
}
