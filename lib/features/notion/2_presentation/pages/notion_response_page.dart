import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monymonky/core/core.dart';
import 'package:monymonky/features/account_management/router/router.dart';
import 'package:monymonky/features/notion/2_presentation/presentation.dart';
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
    locator<NotionDataCubit>().fetchNotionDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notion Database'),
        leading: CustomLeading(
          route: AccountRoutes.accounts,
          navigationStrategy: GoNavigation(),
        ),
      ),
      body: const _NotionResponseView(),
    );
  }
}


class _NotionResponseView extends StatelessWidget {
  const _NotionResponseView();

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: sizeWidth,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              locator<NotionDataCubit>().fetchNotionDB();
            },
            child: const Text('Get Data'),
          ),
          const SizedBox(height: 30,),
          const _ListViewBuilder(),
        ],
      ),
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
  final List<NotionRecord> records;
  const _NotionDataResult(this.records);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) => _RecordItem(record: records[index]),
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

    return Text(record.tag);
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
