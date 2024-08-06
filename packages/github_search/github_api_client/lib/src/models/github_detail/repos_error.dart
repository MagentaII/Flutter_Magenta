class ReposError implements Exception {
  final String message;

  ReposError({
    required this.message,
  });

  factory ReposError.fromJson(Map<String, dynamic> json) {
    return ReposError(
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'message': message};
}
