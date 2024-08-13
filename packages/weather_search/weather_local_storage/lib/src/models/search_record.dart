class SearchRecord {
  final int? id;
  final String city;

  SearchRecord({
    this.id,
    required this.city,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'city': city,
    };
  }

  factory SearchRecord.fromMap(Map<String, Object?> map) {
    return SearchRecord(
      id: map['id'] as int,
      city: map['city'] as String,
    );
  }
}
