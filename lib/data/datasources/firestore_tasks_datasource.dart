import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:klero_app/api/response.dart';
import 'package:klero_app/data/models/task_model.dart';
import 'package:klero_app/domain/datasources/tasks_datasource.dart';
import 'package:klero_app/domain/entities/task.dart';

class FirestoreTasksDatasource implements TasksDatasource {
  final FirebaseFirestore _firestore;

  FirestoreTasksDatasource(this._firestore);

  @override
  Future<ResponseState> getTasks({
    String type = '',
    required String uid,
  }) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection("tasks")
          .where("userUid", isEqualTo: uid)
          .get();

      List<Task> tasks = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in querySnapshot.docs) {
        tasks.add(TaskModel.fromJson(doc.data()));
      }
      return ResponseSuccess(tasks, 200);
    } catch (e) {
      return ResponseFailed(DioException(
        requestOptions: RequestOptions(path: "firestore"),
        error: e,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<ResponseState> deleteTask(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseState> promoteTask(String taskId, String promote) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseState> createTask(TaskModel task) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseState> updateTask(TaskModel task) {
    throw UnimplementedError();
  }
}
