class ReposOwner {
  final String avatarUrl;

  ReposOwner({
    required this.avatarUrl,
  });

  factory ReposOwner.fromJson(Map<String, dynamic> json) {
    return ReposOwner(
      avatarUrl: json['avatar_url'] as String,
    );
  }
}
