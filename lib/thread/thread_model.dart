class ThreadModel {
  final String id;
  final String riderName;
  final String numberPlate;
  final String location;
  String status; // 'Not Safe' or 'Safe'
  String post;
  String? safeReason;
  List<String> comments;

  ThreadModel({
    required this.id,
    required this.riderName,
    required this.numberPlate,
    required this.location,
    required this.post,
    this.status = 'Not Safe',
    this.comments = const [],
    this.safeReason,
  });
}
