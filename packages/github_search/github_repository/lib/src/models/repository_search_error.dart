import 'package:equatable/equatable.dart';

class RepositorySearchError implements Exception {
  final String message;

  const RepositorySearchError({
    required this.message,
  });

  factory RepositorySearchError.fromJson(Map<String, dynamic> json) {
    return RepositorySearchError(
      message: json['message'] as String,
    );
  }
}
