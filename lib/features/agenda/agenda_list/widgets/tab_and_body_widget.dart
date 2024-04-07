import 'package:agenda_app/core/extentions/extentions.dart';
import 'package:agenda_app/core/utils/app_colors.dart';
import 'package:agenda_app/features/agenda/agenda_list/widgets/widgets.dart';
import 'package:agenda_app/features/agenda/bloc/agenda_flow_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabAndBodyWidget extends StatelessWidget {
  const TabAndBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AgendaFlowCubit>().state as Loaded;

    return DefaultTabController(
      length: state.tabs.length,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: AppColors.divider,
            dividerHeight: 2,
            indicatorColor: AppColors.blue,
            isScrollable: true,
            tabs: state.tabs
                .map((e) => Text(
                      '   Day ${e.id}   ',
                      style: context.textTheme.bodyLarge,
                    ))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children: state.tabs
                  .map((e) => ListWidget(dataList: e.dataList))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
