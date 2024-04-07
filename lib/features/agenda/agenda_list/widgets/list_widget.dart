import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/models/models.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
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
      height: 170,
      child: Card(
        elevation: .5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  agendaModel.title,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  agendaModel.description,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    agendaModel.date.toFormat(),
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.alarm,
                    size: 14,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${agendaModel.startTime?.format(context)} - ${agendaModel.endTime?.format(context)}',
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AvatarsRowWidget(
                avatarUrlList:
                    agendaModel.memberList.map((e) => e.photoUrl).toList(),
                visibleAvatars: 3,
                borderWidth: 2.4,
                avatarWidth: 50,
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
          backgroundColor: AppColors.blue,
          radius: 4,
        ),
      AgendaStatus.upcoming => const CircleAvatar(
          backgroundColor: AppColors.divider,
          radius: 4,
          child: CircleAvatar(
            radius: 2,
            backgroundColor: AppColors.white,
          ),
        ),
      AgendaStatus.inProgress => const CircleAvatar(
          backgroundColor: AppColors.blue,
          radius: 4,
          child: CircleAvatar(
            radius: 2.8,
            backgroundColor: AppColors.white,
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
    return DottedLine(
      direction: Axis.vertical,
      lineLength: 164,
      dashColor:
          agendaStatus == AgendaStatus.done ? Colors.black54 : Colors.black12,
    );
  }
}
