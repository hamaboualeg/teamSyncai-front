class Task {
  final String taskId;
  final String moduleId;
  final String projectID; // Add projectID field
  final String task_description;

  Task({
    required this.taskId,
    required this.moduleId,
    required this.projectID, // Include projectID in the constructor
    required this.task_description,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': taskId,
      'module_id': moduleId,
      'projectID': projectID, // Include projectID in the JSON serialization
      'task_description': task_description,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json['_id'],
      moduleId: json['module_id'],
      projectID: json['projectID'], // Parse projectID from JSON
      task_description: json['task_description'],
    );
  }
}
