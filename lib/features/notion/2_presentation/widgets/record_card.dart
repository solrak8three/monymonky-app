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

    return Card(
      elevation: 4.0, // Ajusta la elevación según sea necesario
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
                  child: Text(record.info, style: const TextStyle(fontSize: 16)),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Chip(
                        label: Text(record.tag),
                        padding: const EdgeInsets.all(0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${record.price}€', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(record.date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
