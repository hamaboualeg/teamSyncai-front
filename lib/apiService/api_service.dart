import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_dash/models/project.dart';
import '../models/module.dart';
import '../models/task.dart';

class ApiService {
  static const String baseURL = 'http://192.168.1.5:3000';

  static Future<Map<String, dynamic>> createProject(Project project) async {
    try {
      final response = await http.post(
        Uri.parse('$baseURL/projects/createProject'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(project.toJson()),
      );


      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> projectData = responseData['project'];
        if (projectData.containsKey('_id')) {
          // Extract the projectID from the _id field
          String projectId = projectData['_id'];
          return {'projectID': projectId};
        } else {
          throw Exception('Project data does not contain projectID field');
        }
      } else {
        throw Exception('Failed to create project');
      }

    } catch (e) {
      throw e;
    }
  }

  static Future<List<Module>> fetchModules(String projectId) async {
    try {

      final response = await http.get(
        Uri.parse('$baseURL/modules/project/$projectId'),
      );


      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> modulesData = data['modules'];
        return modulesData.map((json) => Module.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch modules');
      }
    } catch (e) {
      throw Exception('Error fetching modules and tasks: $e');
    }
  }

  static Future<List<Task>> fetchTasks(String moduleId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseURL/tasks/modul/$moduleId'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> tasksData = data['tasks'];
        return tasksData.map((json) => Task.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch tasks');
      }
    } catch (e) {
      throw Exception('Error fetching tasks: $e');
    }
  }


  static Future<void> updateModule(String moduleId, Module updatedModule) async {
    try {
      final response = await http.put(
        Uri.parse('$baseURL/modules/$moduleId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(updatedModule.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update module');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<void> deleteModule(String moduleId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseURL/modules/$moduleId'),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete module');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<void> updateTask(String taskId, Task updatedTask) async {
    try {
      final response = await http.put(
        Uri.parse('$baseURL/tasks/$taskId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(updatedTask.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update task');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<void> deleteTask(String taskId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseURL/tasks/$taskId'),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete task');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<Module> createDefaultModule(String projectId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseURL/modules/defaultM'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'projectId': projectId}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> moduleData = responseData['module'];
        return Module.fromJson(moduleData);
      } else {
        throw Exception('Failed to create default module');
      }
    } catch (e) {
      throw Exception('Error creating default module: $e');
    }
  }

  static Future<Task> createDefaultTask(String projectId, String moduleId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseURL/tasks/defaultT'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'projectID': projectId, 'module_id': moduleId}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final Map<String, dynamic> taskData = responseData['task'];
        return Task.fromJson(taskData);
      } else {
        throw Exception('Failed to create default task');
      }
    } catch (e) {
      throw Exception('Error creating default task: $e');
    }
  }



}
