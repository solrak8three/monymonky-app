import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monymonky/app.dart';
import 'package:monymonky/core/di/locator.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/account/account_bloc.dart';
import 'package:monymonky/features/notion/2_presentation/presentation.dart';

void main() {
  initLocator();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<AccountBloc>()),
          BlocProvider(create: (context) => locator<NotionDataCubit>(),)
        ],
        child: const MyApp(),
    )
  );
}
