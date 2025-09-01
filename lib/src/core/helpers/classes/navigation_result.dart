// ignore_for_file: public_member_api_docs, sort_constructors_first
class NavigationResult<T> {
  final String type;
  final T? data;

  NavigationResult({required this.type, this.data});

  @override
  String toString() =>
      'NavigationResult(type: $type, data: ${data.toString()})';
}
