import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monymonky/core/core.dart';
import 'package:monymonky/features/notion/notion.dart';

part 'notion_data_state.dart';

class NotionDataCubit extends Cubit<NotionDataState> {

  final NotiontUseCases notiontUseCases;

  NotionDataCubit(this.notiontUseCases) : super(NotionDataInitial());

  Future<void> fetchNotionDB(FilterDto filters) async {
    emit(NotionDataLoading());
    try {
      //final FilterDto filters = _mockFilter();
      final records = await notiontUseCases.getAllRecordsUsecase.call(filters);
      final totalAmount = _totalAmount(records);
      final recordsDto = NotionRecordsDto(
        records: records,
        amount: NumberFormatter.formatToTwoDecimals(totalAmount),
      );
      emit(NotionDataLoaded(records: recordsDto));
    } on Exception catch(e) {
      final message = e.toString();
      emit(NotionDataError(message: message));
    }
  }
  
  double _totalAmount(List<NotionRecord> records) =>
      records.map((record) => record.price)
        .fold(0.0, (previousValue, currentValue) => previousValue + currentValue);

}
