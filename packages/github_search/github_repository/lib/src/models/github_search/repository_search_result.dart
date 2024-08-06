import 'package:equatable/equatable.dart';
import 'repository_result_item.dart';

class RepositorySearchResult extends Equatable {
  final List<RepositoryResultItem> items;

  const RepositorySearchResult({
    required this.items,
  });

  @override
  List<Object> get props => [items];

  factory RepositorySearchResult.fromJson(Map<String, dynamic> json) {
    return RepositorySearchResult(
      items: (json['items'] as List<dynamic>)
          .map((item) => RepositoryResultItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
