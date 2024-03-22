class Module {
  final String module_id; // Assuming you're storing _id as a String in Flutter
  final String module_name;
  final String projectID; // Add projectID property


  Module({
    required this.module_id,
    required this.module_name,
    required this.projectID, // Initialize projectID in the constructor
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': module_id, // Sending module_id back to backend as _id
      'module_name': module_name,
      'projectID': projectID, // Include projectID in JSON
    };
  }

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      module_id: json['_id'],
      module_name: json['module_name'],
      projectID: json['projectID'], // Initialize projectID from JSON

    );
  }
}
