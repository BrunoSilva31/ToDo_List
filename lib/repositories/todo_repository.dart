import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

const todoListKey = 'todo_list';

class TodoRepository {
  static SharedPreferences? _sharedPreferences;

  Future<void> _initSharedPreferences() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  Future<List<Todo>> getTodoList() async {
    await _initSharedPreferences();
    final String jsonString = _sharedPreferences?.getString(todoListKey) ?? '[]';

    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  Future<void> saveTodoList(List<Todo> todos) async {
    await _initSharedPreferences();
    final String jsonString = json.encode(todos.map((e) => e.toJson()).toList());
    _sharedPreferences?.setString(todoListKey, jsonString);
  }
}
