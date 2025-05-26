import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:klero_app/api/response.dart';
import 'package:klero_app/data/models/task_model.dart';
import 'package:klero_app/domain/datasources/tasks_datasource.dart';
import 'package:klero_app/domain/entities/task.dart';

class FirestoreTasksDatasource implements TasksDatasource {
  final FirebaseFirestore _firestore;

  FirestoreTasksDatasource(this._firestore);

  static const String collection = 'tasks';

  @override
  Future<ResponseState> getTasks({
    String type = '',
    required String uid,
  }) async {
    try {
      List<String> types = ["to_do", 'in_review', 'complete'];
      Map<String, dynamic> counts = await countTypes(types, uid);

      Query<Map<String, dynamic>> query =
          _firestore.collection(collection).where('user_id', isEqualTo: uid);

      if (type.isNotEmpty) {
        query = query.where('type', isEqualTo: type);
      }

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await query.get();

      List<Task> tasks = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in querySnapshot.docs) {
        Map<String, dynamic> json = doc.data();
        json["id"] = doc.id;
        tasks.add(TaskModel.fromJson(json));
      }
      return ResponseSuccess(
        {
          "tasks": tasks,
          "counts": counts,
        },
        200,
      );
    } catch (e) {
      return ResponseFailed(DioException(
        requestOptions: RequestOptions(path: "firestore"),
        error: e,
        message: e.toString(),
      ));
    }
  }

  @override
  Future<ResponseState> createTask(Map<String, dynamic> task) async {
    try {
      task.remove('id');
      if (task['type'] == null) task.remove('type');

      DocumentReference docRef =
          await _firestore.collection(collection).add(task);
      DocumentSnapshot docSnapshot = await docRef.get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> taskAdded =
            docSnapshot.data() as Map<String, dynamic>;
        taskAdded['id'] = docSnapshot.id;
        TaskModel newTask = TaskModel.fromJson(taskAdded);
        return ResponseSuccess(newTask, 201);
      } else {
        return ResponseFailed(
          DioException(
            requestOptions: RequestOptions(path: "firestore"),
            error: null,
            message: "error get task added",
          ),
        );
      }
    } catch (e) {
      return ResponseFailed(
        DioException(
          requestOptions: RequestOptions(path: "firestore"),
          error: e,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResponseState> deleteTask(String taskId) async {
    try {
      await _firestore.collection(collection).doc(taskId).delete();
      return ResponseSuccess(null, 204);
    } catch (e) {
      return ResponseFailed(
        DioException(
          requestOptions: RequestOptions(path: "firestore"),
          error: e,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResponseState> promoteTask(String taskId, String promote) async {
    try {
      await _firestore.collection(collection).doc(taskId).update({
        "type": promote,
      });
      return ResponseSuccess(null, 204);
    } catch (e) {
      return ResponseFailed(
        DioException(
          requestOptions: RequestOptions(path: "firestore"),
          error: e,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResponseState> updateTask(TaskModel task) async {
    try {
      DocumentReference docRef = _firestore.collection(collection).doc(task.id);
      await docRef.update(task.toJson());

      DocumentSnapshot docSnapshot = await docRef.get();
      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> taskUpdated =
            docSnapshot.data() as Map<String, dynamic>;
        taskUpdated["id"] = docSnapshot.id;
        TaskModel task = TaskModel.fromJson(taskUpdated);
        return ResponseSuccess(task, 200);
      } else {
        return ResponseFailed(
          DioException(
            requestOptions: RequestOptions(path: "firestore"),
            error: null,
            message: "error get task updated",
          ),
        );
      }
    } catch (e) {
      return ResponseFailed(
        DioException(
          requestOptions: RequestOptions(path: "firestore"),
          error: e,
          message: e.toString(),
        ),
      );
    }
  }

  Future<Map<String, dynamic>> countTypes(
      List<String> types, String uid) async {
    Map<String, int> counts = {};
    for (String type in types) {
      try {
        final query = _firestore
            .collection(collection)
            .where('type', isEqualTo: type)
            .where('user_id', isEqualTo: uid);
        final AggregateQuerySnapshot snapshot = await query.count().get();
        counts[type] = snapshot.count ?? 0;
      } catch (e) {
        counts[type] = 0;
      }
    }
    return counts;
  }
}
