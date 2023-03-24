// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_todolist/model/todo_item.dart';

class NetworkManager {
  late final Dio _dio;

  // final Dio _dio = Dio();

  final baseUrl =
      'https://0f9c-2001-448a-304a-16a1-e531-cbe0-16cb-369.ap.ngrok.io';

  NetworkManager() {
    _dio = Dio();
  }

  /* 
    Function Future bisa digunakan langsung tanpa harus mendefiniskan
    type datanya apa
  */

  Future<List<TodoItem>> getTodosIsDone(bool isDone) async {
    final result = await _dio.get(
      '$baseUrl/todos?isDone=$isDone',
    );

    return (result.data as List).map((e) => TodoItem.fromMap(e)).toList();
  }

  Future<TodoItem> postData(TodoItem item) async {
    final result = await _dio.post(
      '$baseUrl/todos',
      data: item.toMap(),
    );

    return TodoItem.fromMap(result.data);
  }

  Future<TodoItem> updateData(TodoItem item) async {
    final result = await _dio.put(
      '$baseUrl/todos/${item.id}',
      data: item.toMap(),
    );

    return TodoItem.fromMap(result.data);
  }

  Future<void> deleteData(TodoItem item) async {
    await _dio.delete(
      '$baseUrl/todos/${item.id}',
    );
  }
}
