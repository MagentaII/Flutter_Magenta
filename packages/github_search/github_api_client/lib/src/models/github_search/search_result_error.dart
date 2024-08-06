class SearchResultError implements Exception {
  final String message;

  SearchResultError({
    required this.message,
  });

  factory SearchResultError.fromJson(Map<String, dynamic> json) {
    return SearchResultError(
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'message': message};
}
