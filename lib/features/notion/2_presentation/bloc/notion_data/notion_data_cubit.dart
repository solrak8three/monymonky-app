import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monymonky/features/notion/notion.dart';

part 'notion_data_state.dart';

class NotionDataCubit extends Cubit<NotionDataState> {

  final NotiontUseCases notiontUseCases;

  NotionDataCubit(this.notiontUseCases) : super(NotionDataInitial());

  Future<void> fetchNotionDB() async {
    emit(NotionDataLoading());
    try {
      final records = await notiontUseCases.getAllRecordsUsecase.call();
      emit(NotionDataLoaded(records: records));
    } on Exception catch(e) {
      final message = e.toString();
      emit(NotionDataError(message: message));
    }
  }
}
