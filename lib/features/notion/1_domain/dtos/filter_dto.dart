class FilterDto {
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? onlyFixed;
  final bool? removeFixed;
  final List<String>? tags;

  FilterDto({
    this.startDate,
    this.endDate,
    this.onlyFixed,
    this.removeFixed,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (startDate != null) {
      data['startDate'] = startDate.toString();
    }
    if (endDate != null) {
      data['endDate'] = endDate.toString();
    }
    if (onlyFixed != null) {
      data['onlyFixed'] = onlyFixed;
    }
    if (tags != null) {
      data['tags'] = tags;
    }
    if (removeFixed != null) {
      data['removeFixed'] = removeFixed;
    }

    return data;
  }

}
