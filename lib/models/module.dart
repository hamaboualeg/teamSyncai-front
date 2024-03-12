class Module {
  final String module_id;
  final String module_name;
  List<String> taskIds;

  Module({
    required this.module_id,
    required this.module_name,
    required this.taskIds,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': module_id,
      'module_name': module_name,
      'taskIds': taskIds,
    };
  }

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      module_id: json['_id'],
      module_name: json['module_name'],
      taskIds: List<String>.from(json['taskIds'] ?? []),
    );
  }
}