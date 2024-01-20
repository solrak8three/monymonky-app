import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monymonky/core/core.dart';
import 'package:monymonky/features/notion/notion.dart';

class NotionResponsePage extends StatefulWidget {

  static const name = 'notion_response_page';
  const NotionResponsePage({super.key});

  @override
  State<NotionResponsePage> createState() => _NotionResponsePageState();
}

class _NotionResponsePageState extends State<NotionResponsePage> {

  @override
  void initState() {
    super.initState();
    locator<NotionDataCubit>().fetchNotionDB(FilterDto(removeFixed: false, onlyFixed: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notion Database'),
        leading: CustomLeading(
          route: '/',
          navigationStrategy: GoNavigation(),
        ),
      ),
      body: const _NotionResponseView(),
    );
  }
}


class _NotionResponseView extends ConsumerWidget {
  const _NotionResponseView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlyFixedFilter = ref.watch(onlyFixedFilterProvider);
    final removeFixedFilter = ref.watch(removeFixedFilterProvider);
    final startDateFilter = ref.watch(startDateFilterProvider);
    final endDateFilter = ref.watch(endDateFilterProvider);
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: sizeWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton.outlined(
                  onPressed: () {
                    final filter = FilterDto(
                        onlyFixed: onlyFixedFilter,
                        removeFixed: removeFixedFilter,
                        startDate: startDateFilter,
                        endDate: endDateFilter
                    );
                    locator<NotionDataCubit>().fetchNotionDB(filter);
                  },
                  icon: const Icon(Icons.refresh_outlined),
              ),
              const _TotalAmount(),
              IconButton.outlined(
                onPressed: () {
                  _showFullScreenModal(context);
                },
                icon: const Icon(Icons.filter_alt),
              ),
            ],
          ),
          const SizedBox(height: 30,),
          const _ListViewBuilder(),
        ],
      ),
    );
  }

  void _showFullScreenModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => const FilterModal(),
    );
  }
}

class _TotalAmount extends StatelessWidget {
  const _TotalAmount();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    return BlocBuilder<NotionDataCubit, NotionDataState>(
        builder: (context, state) {
          if (state is NotionDataLoaded) {
            return Text(
                '${state.records.amount}€',
                  style: textTheme.titleSmall?.copyWith(
                    color: colorTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            );

          } else {
            return const SizedBox();
          }
        },
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotionDataCubit, NotionDataState>(
      builder: (context, state) {
        if (state is NotionDataLoading) {
          return const _Loading();
        } else if (state is NotionDataLoaded) {
          return Expanded(
            flex: 1,
            child: _NotionDataResult(state.records),
          );
        } else if (state is NotionDataError){
          return _ErrorMessage(state.message);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage(this.errorMessage);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}

class _NotionDataResult extends StatelessWidget {
  final NotionRecordsDto notionRecordsDto;
  const _NotionDataResult(this.notionRecordsDto);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notionRecordsDto.records.length,
      itemBuilder: (context, index) => _RecordItem(record: notionRecordsDto.records[index]),
    );
  }
}

class _RecordItem extends StatelessWidget {
  const _RecordItem({
    required this.record,
  });

  final NotionRecord record;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 15,),
      child: NotionRecordCard(record: record,),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: CircularProgressIndicator(),
        ),
    );
  }
}
