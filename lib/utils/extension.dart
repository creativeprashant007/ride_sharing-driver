extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

DateTime getTimeAgo({String? date}) {
  final difference = DateTime.now().difference(DateTime.parse('$date'));
  final substract =
      DateTime.now().subtract(Duration(minutes: difference.inMinutes));
  return substract;
}
