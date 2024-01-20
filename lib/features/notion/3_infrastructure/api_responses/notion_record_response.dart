class NotionRecordResponse {
  final String origin;
  final List<Record> records;
  final double total;

  NotionRecordResponse({
    required this.origin,
    required this.records,
    required this.total,
  });


  factory NotionRecordResponse.fromJson(Map<String, dynamic> json) => NotionRecordResponse(
    origin: json["origin"],
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    total: json["total"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "origin": origin,
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
    "total": total,
  };
}

class Record {
  final DateTime date;
  final String info;
  final double price;
  final String tag;
  final bool stateToPayment;
  final bool fixed;

  Record({
    required this.date,
    required this.info,
    required this.price,
    required this.tag,
    required this.stateToPayment,
    required this.fixed,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    date: DateTime.parse(json["date"]),
    info: json["info"],
    price: json["price"]?.toDouble(),
    tag: json["tag"],
    stateToPayment: json["stateToPayment"],
    fixed: json["fixed"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "info": info,
    "price": price,
    "tag": tag,
    "stateToPayment": stateToPayment,
    "fixed": fixed,
  };
}
