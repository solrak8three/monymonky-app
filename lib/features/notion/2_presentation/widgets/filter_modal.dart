import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monymonky/core/core.dart';
import 'package:monymonky/features/notion/notion.dart';

class FilterModal extends ConsumerWidget {
  const FilterModal({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = Theme.of(context).colorScheme;
    final onlyFixedFilter = ref.watch(onlyFixedFilterProvider);
    final removeFixedFilter = ref.watch(removeFixedFilterProvider);
    final startDateFilter = ref.watch(startDateFilterProvider);
    final endDateFilter = ref.watch(endDateFilterProvider);
    //final tagsFilter = ref.watch(tagsFilterProvider);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: _Filters(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text("Applicator filtros"),
                  onPressed: () {
                    final filter = FilterDto(
                      onlyFixed: onlyFixedFilter,
                      removeFixed: removeFixedFilter,
                      startDate: startDateFilter,
                      endDate: endDateFilter
                    );
                    locator<NotionDataCubit>().fetchNotionDB(filter);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: colorTheme.onPrimary, backgroundColor: colorTheme.primary
                  ),
                ),
                ElevatedButton(
                  child: const Text("Clean filtros"),
                  onPressed: () => _cleanFilters(context, ref)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _cleanFilters(BuildContext context, WidgetRef ref) {
    ref.read(onlyFixedFilterProvider.notifier).state = false;
    ref.read(removeFixedFilterProvider.notifier).state = false;
    ref.read(startDateFilterProvider.notifier).state = null;
    ref.read(endDateFilterProvider.notifier).state = null;
    ref.read(tagsFilterProvider.notifier).state = [];
  }
}

class _Filters extends ConsumerWidget {
  const _Filters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlyFixedFilter = ref.watch(onlyFixedFilterProvider);
    final removeFixedFilter = ref.watch(removeFixedFilterProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () => _startShowDatePicker(context, ref),
                child: const Text('Fecha inicio'),
            ),
            ElevatedButton(
              onPressed: () => _endShowDatePicker(context, ref),
              child: const Text('Fecha fin'),
            ),
          ],
        ),
        const SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('onlyFixed'),
            Checkbox(
              value: onlyFixedFilter,
              onChanged: (value) {
                if (value == true) {
                  ref.read(removeFixedFilterProvider.notifier).update((value) => false);
                }
                ref.read(onlyFixedFilterProvider.notifier).update((value) => !value);
              },
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('removeFixed'),
            Checkbox(
              value: removeFixedFilter,
              onChanged: (value) {
                if (value == true) {
                  ref.read(onlyFixedFilterProvider.notifier).update((value) => false);
                }
                ref.read(removeFixedFilterProvider.notifier).update((value) => !value);
              },
            ),
          ],
        ),
      ],
    );
  }
  
  void _startShowDatePicker(BuildContext context, WidgetRef ref) async {
    final startDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
    );
    if (startDate == null) return;
    ref.read(startDateFilterProvider.notifier).state = startDate;

  }

  void _endShowDatePicker(BuildContext context, WidgetRef ref) async {
    final endDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2026),
    );
    if (endDate == null) return;
    ref.read(endDateFilterProvider.notifier).state = endDate;
  }
}