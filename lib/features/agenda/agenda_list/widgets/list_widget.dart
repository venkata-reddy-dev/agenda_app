import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/models/models.dart';
import 'package:agenda_app/features/agenda/widgets/avatars_row_widget.dart';
import 'package:collection/collection.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key, required this.dataList});
  final List<AgendaModel> dataList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StatusWidget(dataList: dataList),
              Expanded(
                child: Column(
                  children:
                      dataList.map((e) => _TileWidget(agendaModel: e)).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _TileWidget extends StatelessWidget {
  const _TileWidget({required this.agendaModel});
  final AgendaModel agendaModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(agendaModel.title),
              Text(agendaModel.description),
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Text(agendaModel.date.toFormat()),
                  const SizedBox(width: 24),
                  const Icon(Icons.alarm),
                  const SizedBox(width: 8),
                  Text(
                      '${agendaModel.startTime?.format(context)} - ${agendaModel.endTime?.format(context)}'),
                ],
              ),
              const SizedBox(height: 8),
              AvatarsRowWidget(
                avatarUrlList:
                    agendaModel.memberList.map((e) => e.photoUrl).toList(),
                visibleAvatars: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusWidget extends StatelessWidget {
  const _StatusWidget({required this.dataList});
  final List<AgendaModel> dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        ...dataList.mapIndexed(
          (index, item) {
            return <Widget>[
              _AgendaStatusDotWidget(agendaStatus: item.status),
              if (dataList.length != (index + 1)) ...[
                _AgendaStatusLineWidget(agendaStatus: item.status),
              ],
            ];
          },
        ).flattened,
      ],
    );
  }
}

class _AgendaStatusDotWidget extends StatelessWidget {
  const _AgendaStatusDotWidget({required this.agendaStatus});
  final AgendaStatus agendaStatus;

  @override
  Widget build(BuildContext context) {
    return switch (agendaStatus) {
      AgendaStatus.done => const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 4,
        ),
      AgendaStatus.upcoming => const CircleAvatar(
          backgroundColor: Colors.black12,
          radius: 4,
          child: CircleAvatar(
            radius: 2,
            backgroundColor: Colors.white,
          ),
        ),
      AgendaStatus.inProgress => const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 4,
          child: CircleAvatar(
            radius: 2,
            backgroundColor: Colors.white,
          ),
        ),
    };
  }
}

class _AgendaStatusLineWidget extends StatelessWidget {
  const _AgendaStatusLineWidget({required this.agendaStatus});
  final AgendaStatus agendaStatus;
  @override
  Widget build(BuildContext context) {
    return switch (agendaStatus) {
      AgendaStatus.done => const DottedLine(
          direction: Axis.vertical,
          lineLength: 190,
          dashColor: Colors.black54,
        ),
      _ => const DottedLine(
          direction: Axis.vertical,
          lineLength: 190,
          dashColor: Colors.black12,
        ),
    };
  }
}
