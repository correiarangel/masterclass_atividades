import 'package:dio/dio.dart';

import '../../../shared/services/todo_service.dart';

class RemoteTodoDataSource {
  final TodoService service;

  RemoteTodoDataSource(this.service);

  Future<Response>? getTodos({required url}) async {
    final response = await service.get(url: url);
    response;
    return response;
  }

  Future<Response>? addTodo({
    required url,
    required Map<String, dynamic> param,
  }) async {
    final response = await service.post(
      url: url,
      jsonParam: param,
    );
    return response;
  }

  Future<Response>? excluir({
    required String id,
    required String url,
  }) async {
    final response = await service.delete(
      id: id,
      url: url,
    );
    return response;
  }

  Future<Response>? editar({
    required String id,
    required String url,
    required Map<String, dynamic> param,
  }) async {
    final response = await service.put(
      id: id,
      url: url,
      jsonParam: param,
    );
    return response;
  }
}
