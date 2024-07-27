import 'package:equatable/equatable.dart';

class RepositoryResultItem extends Equatable{
  final String fullName;
  final String avatarUrl;
  final String htmlUrl;

  const RepositoryResultItem({
    required this.fullName,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  @override
  List<Object> get props => [fullName, avatarUrl, htmlUrl];

  factory RepositoryResultItem.fromJson(Map<String, dynamic> json) {
    return RepositoryResultItem(
      fullName: json['full_name'] as String,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
    );
  }
}
