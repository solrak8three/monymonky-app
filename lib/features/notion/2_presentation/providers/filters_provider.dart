import 'package:flutter_riverpod/flutter_riverpod.dart';

final startDateFilterProvider = StateProvider<DateTime?>((ref) => null);

final endDateFilterProvider = StateProvider<DateTime?>((ref) => null);

final onlyFixedFilterProvider = StateProvider<bool>((ref) => false);

final removeFixedFilterProvider = StateProvider<bool>((ref) => false);

final tagsFilterProvider = StateProvider<List<String>>((ref) => []);
