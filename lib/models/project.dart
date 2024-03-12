class Project {
  String name;
  DateTime startDate;
  DateTime endDate;
  String description;
  List<String> keywords;
  String teamLeader;
  List<String> members;

  Project({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.keywords,
    required this.teamLeader,
    required this.members,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'description': description,
      'keywords': keywords,
      'teamLeader': teamLeader,
      'members': members,
    };
  }
}
