class RepositoryError implements Exception {
  final String message;

  RepositoryError({
    required this.message,
  });

  factory RepositoryError.fromJson(Map<String, dynamic> json) {
    return RepositoryError(
      message: json['message'] as String,
    );
  }
}
