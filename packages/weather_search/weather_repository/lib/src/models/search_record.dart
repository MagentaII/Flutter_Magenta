import 'package:weather_local_storage/weather_local_storage.dart'
    as weather_local_storage;

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

  factory SearchRecord.fromLocalStorage(
    weather_local_storage.SearchRecord searchRecord,
  ) {
    return SearchRecord(
      id: searchRecord.id,
      city: searchRecord.city,
    );
  }

  weather_local_storage.SearchRecord toLocalStorage() {
    return weather_local_storage.SearchRecord(id: id, city: city);
  }
}
