import 'search_result_item.dart';

class SearchResult {
  final List<SearchResultItem> items;

  SearchResult({
    required this.items,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      items: (json['items'] as List<dynamic>)
          .map(
            (dynamic item) =>
                SearchResultItem.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
