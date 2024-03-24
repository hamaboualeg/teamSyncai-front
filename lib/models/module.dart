class Module {
  final String module_id;
  final String module_name;
  final String projectID;


  Module({
    required this.module_id,
    required this.module_name,
    required this.projectID,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': module_id,
      'module_name': module_name,
      'projectID': projectID,
    };
  }

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      module_id: json['_id'],
      module_name: json['module_name'],
      projectID: json['projectID'],

    );
  }
}
