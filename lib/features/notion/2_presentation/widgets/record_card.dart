import 'package:flutter/material.dart';
import 'package:monymonky/features/notion/notion.dart';

class NotionRecordCard extends StatelessWidget {
  final NotionRecord record;

  const NotionRecordCard({
    super.key,
    required this.record
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(record.info, style: textTheme.bodyMedium),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Chip(
                        label: Text(record.tag, style: textTheme.bodySmall,),
                        padding: const EdgeInsets.all(0),
                        backgroundColor: colors.background,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${record.price}€',
                  style: textTheme.labelLarge?.copyWith(
                  color: colors.secondary,
                  fontWeight: FontWeight.w500,),
                ),
                Text(
                  record.date,
                  style: textTheme.bodySmall?.copyWith(color: colors.secondary)
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
