part of 'notion_data_cubit.dart';

abstract class NotionDataState extends Equatable {
  const NotionDataState();
  @override
  List<Object> get props => [];
}

class NotionDataInitial extends NotionDataState {}

class NotionDataLoading extends NotionDataState {}

class NotionDataError extends NotionDataState {
  final String message;
  const NotionDataError({required this.message});
}

class NotionDataLoaded extends NotionDataState {
  final NotionRecordsDto records;
  const NotionDataLoaded({required this.records});
}

class NotionFinish extends NotionDataState {}
