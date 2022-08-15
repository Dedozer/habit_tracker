// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$Api extends Api {
  _$Api([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Api;

  @override
  Future<Response<Habits>> _habitsGet(
      {String? authorization,
      int? offset,
      int? limit,
      String? orderBy,
      String? orderDirection,
      int? type,
      String? title}) {
    final $url = '/habits';
    final $params = <String, dynamic>{
      'offset': offset,
      'limit': limit,
      'order_by': orderBy,
      'order_direction': orderDirection,
      'type': type,
      'title': title
    };
    final $headers = {
      if (authorization != null) 'Authorization': authorization,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<Habits, Habits>($request);
  }

  @override
  Future<Response<Habit>> _habitsPost(
      {String? authorization, required AddHabit? requestBody}) {
    final $url = '/habits';
    final $headers = {
      if (authorization != null) 'Authorization': authorization,
    };

    final $body = requestBody;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Habit, Habit>($request);
  }

  @override
  Future<Response<Success>> _habitsIdDelete(
      {String? authorization, required String? id}) {
    final $url = '/habits/${id}';
    final $headers = {
      if (authorization != null) 'Authorization': authorization,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<Success, Success>($request);
  }

  @override
  Future<Response<Success>> _habitsIdPatch(
      {String? authorization,
      required String? id,
      required AddHabit? requestBody}) {
    final $url = '/habits/${id}';
    final $headers = {
      if (authorization != null) 'Authorization': authorization,
    };

    final $body = requestBody;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Success, Success>($request);
  }

  @override
  Future<Response<dynamic>> _habitsIdCompletePost(
      {String? authorization,
      required String? id,
      required HabitDone? requestBody}) {
    final $url = '/habits/${id}/complete';
    final $headers = {
      if (authorization != null) 'Authorization': authorization,
    };

    final $body = requestBody;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
