// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'api.enums.swagger.dart' as enums;
export 'api.enums.swagger.dart';

part 'api.swagger.chopper.dart';
part 'api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create(
      {ChopperClient? client,
      Authenticator? authenticator,
      String? baseUrl,
      Iterable<dynamic>? interceptors}) {
    if (client != null) {
      return _$Api(client);
    }

    final newClient = ChopperClient(
        services: [_$Api()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [HttpLoggingInterceptor()],
        authenticator: authenticator,
        baseUrl:
            baseUrl ?? 'https://habits-internship.doubletapp.ai/api');
    return _$Api(newClient);
  }

  ///Get habits
  ///@param Authorization token
  ///@param offset
  ///@param limit
  ///@param order_by
  ///@param order_direction
  ///@param type
  ///@param title filter by pattern
  Future<chopper.Response<Habits>> habitsGet(
      {String? authorization,
      int? offset,
      int? limit,
      String? orderBy,
      String? orderDirection,
      int? type,
      String? title}) {
    generatedMapping.putIfAbsent(Habits, () => Habits.fromJsonFactory);

    return _habitsGet(
        authorization: authorization,
        offset: offset,
        limit: limit,
        orderBy: orderBy,
        orderDirection: orderDirection,
        type: type,
        title: title);
  }

  ///Get habits
  ///@param Authorization token
  ///@param offset
  ///@param limit
  ///@param order_by
  ///@param order_direction
  ///@param type
  ///@param title filter by pattern
  @Get(path: '/habits')
  Future<chopper.Response<Habits>> _habitsGet(
      {@Header('Authorization') String? authorization,
      @Query('offset') int? offset,
      @Query('limit') int? limit,
      @Query('order_by') String? orderBy,
      @Query('order_direction') String? orderDirection,
      @Query('type') int? type,
      @Query('title') String? title});

  ///Add habits
  ///@param Authorization token
  ///@param requestBody
  Future<chopper.Response<Habit>> habitsPost(
      {String? authorization, required AddHabit? requestBody}) {
    generatedMapping.putIfAbsent(AddHabit, () => AddHabit.fromJsonFactory);
    generatedMapping.putIfAbsent(Habit, () => Habit.fromJsonFactory);

    return _habitsPost(authorization: authorization, requestBody: requestBody);
  }

  ///Add habits
  ///@param Authorization token
  ///@param requestBody
  @Post(path: '/habits')
  Future<chopper.Response<Habit>> _habitsPost(
      {@Header('Authorization') String? authorization,
      @Body() required AddHabit? requestBody});

  ///Delete habit
  ///@param Authorization token
  ///@param id
  Future<chopper.Response<Success>> habitsIdDelete(
      {String? authorization, required String? id}) {
    generatedMapping.putIfAbsent(Success, () => Success.fromJsonFactory);

    return _habitsIdDelete(authorization: authorization, id: id);
  }

  ///Delete habit
  ///@param Authorization token
  ///@param id
  @Delete(path: '/habits/{id}')
  Future<chopper.Response<Success>> _habitsIdDelete(
      {@Header('Authorization') String? authorization,
      @Path('id') required String? id});

  ///update habits
  ///@param Authorization token
  ///@param id
  ///@param requestBody Habit
  Future<chopper.Response<Success>> habitsIdPatch(
      {String? authorization,
      required String? id,
      required AddHabit? requestBody}) {
    generatedMapping.putIfAbsent(AddHabit, () => AddHabit.fromJsonFactory);
    generatedMapping.putIfAbsent(Success, () => Success.fromJsonFactory);

    return _habitsIdPatch(
        authorization: authorization, id: id, requestBody: requestBody);
  }

  ///update habits
  ///@param Authorization token
  ///@param id
  ///@param requestBody Habit
  @Patch(path: '/habits/{id}')
  Future<chopper.Response<Success>> _habitsIdPatch(
      {@Header('Authorization') String? authorization,
      @Path('id') required String? id,
      @Body() required AddHabit? requestBody});

  ///Tells that habit was completed
  ///@param Authorization token
  ///@param id
  ///@param requestBody HabitDone
  Future<chopper.Response> habitsIdCompletePost(
      {String? authorization,
      required String? id,
      required HabitDone? requestBody}) {
    generatedMapping.putIfAbsent(HabitDone, () => HabitDone.fromJsonFactory);

    return _habitsIdCompletePost(
        authorization: authorization, id: id, requestBody: requestBody);
  }

  ///Tells that habit was completed
  ///@param Authorization token
  ///@param id
  ///@param requestBody HabitDone
  @Post(path: '/habits/{id}/complete')
  Future<chopper.Response> _habitsIdCompletePost(
      {@Header('Authorization') String? authorization,
      @Path('id') required String? id,
      @Body() required HabitDone? requestBody});
}

@JsonSerializable(explicitToJson: true)
class Success {
  Success({
    this.success,
  });

  factory Success.fromJson(Map<String, dynamic> json) =>
      _$SuccessFromJson(json);

  @JsonKey(name: 'success')
  final bool? success;
  static const fromJsonFactory = _$SuccessFromJson;
  static const toJsonFactory = _$SuccessToJson;
  Map<String, dynamic> toJson() => _$SuccessToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.success, success) ||
                const DeepCollectionEquality().equals(other.success, success)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(success) ^ runtimeType.hashCode;
}

extension $SuccessExtension on Success {
  Success copyWith({bool? success}) {
    return Success(success: success ?? this.success);
  }
}

extension $SuccessWrappedExtension on Success {
  Success copyWith({Wrapped<bool?>? success}) {
    return Success(success: (success != null ? success.value : this.success));
  }
}

@JsonSerializable(explicitToJson: true)
class Error {
  Error({
    this.code,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$ErrorFromJson;
  static const toJsonFactory = _$ErrorToJson;
  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ErrorExtension on Error {
  Error copyWith({int? code, String? message}) {
    return Error(code: code ?? this.code, message: message ?? this.message);
  }
}

extension $ErrorWrappedExtension on Error {
  Error copyWith({Wrapped<int?>? code, Wrapped<String?>? message}) {
    return Error(
        code: (code != null ? code.value : this.code),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class Habits {
  Habits({
    this.count,
    this.habits,
  });

  factory Habits.fromJson(Map<String, dynamic> json) => _$HabitsFromJson(json);

  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'habits', defaultValue: <Habit>[])
  final List<Habit>? habits;
  static const fromJsonFactory = _$HabitsFromJson;
  static const toJsonFactory = _$HabitsToJson;
  Map<String, dynamic> toJson() => _$HabitsToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Habits &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.habits, habits) ||
                const DeepCollectionEquality().equals(other.habits, habits)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(habits) ^
      runtimeType.hashCode;
}

extension $HabitsExtension on Habits {
  Habits copyWith({int? count, List<Habit>? habits}) {
    return Habits(count: count ?? this.count, habits: habits ?? this.habits);
  }
}

extension $HabitsWrappedExtension on Habits {
  Habits copyWith({Wrapped<int?>? count, Wrapped<List<Habit>?>? habits}) {
    return Habits(
        count: (count != null ? count.value : this.count),
        habits: (habits != null ? habits.value : this.habits));
  }
}

@JsonSerializable(explicitToJson: true)
class Habit {
  Habit({
    this.color,
    this.count,
    this.date,
    this.description,
    this.doneDates,
    this.frequency,
    this.priority,
    this.title,
    this.type,
    this.uid,
  });

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);

  @JsonKey(name: 'color')
  final int? color;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'date')
  final int? date;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'done_dates', defaultValue: <int>[])
  final List<int>? doneDates;
  @JsonKey(name: 'frequency')
  final int? frequency;
  @JsonKey(name: 'priority')
  final int? priority;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'type')
  final int? type;
  @JsonKey(name: 'uid')
  final String? uid;
  static const fromJsonFactory = _$HabitFromJson;
  static const toJsonFactory = _$HabitToJson;
  Map<String, dynamic> toJson() => _$HabitToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Habit &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.doneDates, doneDates) ||
                const DeepCollectionEquality()
                    .equals(other.doneDates, doneDates)) &&
            (identical(other.frequency, frequency) ||
                const DeepCollectionEquality()
                    .equals(other.frequency, frequency)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(doneDates) ^
      const DeepCollectionEquality().hash(frequency) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(uid) ^
      runtimeType.hashCode;
}

extension $HabitExtension on Habit {
  Habit copyWith(
      {int? color,
      int? count,
      int? date,
      String? description,
      List<int>? doneDates,
      int? frequency,
      int? priority,
      String? title,
      int? type,
      String? uid}) {
    return Habit(
        color: color ?? this.color,
        count: count ?? this.count,
        date: date ?? this.date,
        description: description ?? this.description,
        doneDates: doneDates ?? this.doneDates,
        frequency: frequency ?? this.frequency,
        priority: priority ?? this.priority,
        title: title ?? this.title,
        type: type ?? this.type,
        uid: uid ?? this.uid);
  }
}

extension $HabitWrappedExtension on Habit {
  Habit copyWith(
      {Wrapped<int?>? color,
      Wrapped<int?>? count,
      Wrapped<int?>? date,
      Wrapped<String?>? description,
      Wrapped<List<int>?>? doneDates,
      Wrapped<int?>? frequency,
      Wrapped<int?>? priority,
      Wrapped<String?>? title,
      Wrapped<int?>? type,
      Wrapped<String?>? uid}) {
    return Habit(
        color: (color != null ? color.value : this.color),
        count: (count != null ? count.value : this.count),
        date: (date != null ? date.value : this.date),
        description:
            (description != null ? description.value : this.description),
        doneDates: (doneDates != null ? doneDates.value : this.doneDates),
        frequency: (frequency != null ? frequency.value : this.frequency),
        priority: (priority != null ? priority.value : this.priority),
        title: (title != null ? title.value : this.title),
        type: (type != null ? type.value : this.type),
        uid: (uid != null ? uid.value : this.uid));
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateHabit {
  UpdateHabit({
    this.color,
    this.count,
    this.date,
    this.description,
    this.frequency,
    this.priority,
    this.title,
    this.type,
  });

  factory UpdateHabit.fromJson(Map<String, dynamic> json) =>
      _$UpdateHabitFromJson(json);

  @JsonKey(name: 'color')
  final int? color;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'date')
  final int? date;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'frequency')
  final int? frequency;
  @JsonKey(name: 'priority')
  final int? priority;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'type')
  final int? type;
  static const fromJsonFactory = _$UpdateHabitFromJson;
  static const toJsonFactory = _$UpdateHabitToJson;
  Map<String, dynamic> toJson() => _$UpdateHabitToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateHabit &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.frequency, frequency) ||
                const DeepCollectionEquality()
                    .equals(other.frequency, frequency)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(frequency) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UpdateHabitExtension on UpdateHabit {
  UpdateHabit copyWith(
      {int? color,
      int? count,
      int? date,
      String? description,
      int? frequency,
      int? priority,
      String? title,
      int? type}) {
    return UpdateHabit(
        color: color ?? this.color,
        count: count ?? this.count,
        date: date ?? this.date,
        description: description ?? this.description,
        frequency: frequency ?? this.frequency,
        priority: priority ?? this.priority,
        title: title ?? this.title,
        type: type ?? this.type);
  }
}

extension $UpdateHabitWrappedExtension on UpdateHabit {
  UpdateHabit copyWith(
      {Wrapped<int?>? color,
      Wrapped<int?>? count,
      Wrapped<int?>? date,
      Wrapped<String?>? description,
      Wrapped<int?>? frequency,
      Wrapped<int?>? priority,
      Wrapped<String?>? title,
      Wrapped<int?>? type}) {
    return UpdateHabit(
        color: (color != null ? color.value : this.color),
        count: (count != null ? count.value : this.count),
        date: (date != null ? date.value : this.date),
        description:
            (description != null ? description.value : this.description),
        frequency: (frequency != null ? frequency.value : this.frequency),
        priority: (priority != null ? priority.value : this.priority),
        title: (title != null ? title.value : this.title),
        type: (type != null ? type.value : this.type));
  }
}

@JsonSerializable(explicitToJson: true)
class AddHabit {
  AddHabit({
    this.color,
    this.count,
    this.date,
    this.description,
    this.frequency,
    this.priority,
    this.title,
    this.type,
  });

  factory AddHabit.fromJson(Map<String, dynamic> json) =>
      _$AddHabitFromJson(json);

  @JsonKey(name: 'color')
  final int? color;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'date')
  final int? date;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'frequency')
  final int? frequency;
  @JsonKey(name: 'priority')
  final int? priority;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'type')
  final int? type;
  static const fromJsonFactory = _$AddHabitFromJson;
  static const toJsonFactory = _$AddHabitToJson;
  Map<String, dynamic> toJson() => _$AddHabitToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddHabit &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.frequency, frequency) ||
                const DeepCollectionEquality()
                    .equals(other.frequency, frequency)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(frequency) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $AddHabitExtension on AddHabit {
  AddHabit copyWith(
      {int? color,
      int? count,
      int? date,
      String? description,
      int? frequency,
      int? priority,
      String? title,
      int? type}) {
    return AddHabit(
        color: color ?? this.color,
        count: count ?? this.count,
        date: date ?? this.date,
        description: description ?? this.description,
        frequency: frequency ?? this.frequency,
        priority: priority ?? this.priority,
        title: title ?? this.title,
        type: type ?? this.type);
  }
}

extension $AddHabitWrappedExtension on AddHabit {
  AddHabit copyWith(
      {Wrapped<int?>? color,
      Wrapped<int?>? count,
      Wrapped<int?>? date,
      Wrapped<String?>? description,
      Wrapped<int?>? frequency,
      Wrapped<int?>? priority,
      Wrapped<String?>? title,
      Wrapped<int?>? type}) {
    return AddHabit(
        color: (color != null ? color.value : this.color),
        count: (count != null ? count.value : this.count),
        date: (date != null ? date.value : this.date),
        description:
            (description != null ? description.value : this.description),
        frequency: (frequency != null ? frequency.value : this.frequency),
        priority: (priority != null ? priority.value : this.priority),
        title: (title != null ? title.value : this.title),
        type: (type != null ? type.value : this.type));
  }
}

@JsonSerializable(explicitToJson: true)
class HabitDone {
  HabitDone({
    this.date,
  });

  factory HabitDone.fromJson(Map<String, dynamic> json) =>
      _$HabitDoneFromJson(json);

  @JsonKey(name: 'date')
  final int? date;
  static const fromJsonFactory = _$HabitDoneFromJson;
  static const toJsonFactory = _$HabitDoneToJson;
  Map<String, dynamic> toJson() => _$HabitDoneToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HabitDone &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^ runtimeType.hashCode;
}

extension $HabitDoneExtension on HabitDone {
  HabitDone copyWith({int? date}) {
    return HabitDone(date: date ?? this.date);
  }
}

extension $HabitDoneWrappedExtension on HabitDone {
  HabitDone copyWith({Wrapped<int?>? date}) {
    return HabitDone(date: (date != null ? date.value : this.date));
  }
}

@JsonSerializable(explicitToJson: true)
class HabitUID {
  HabitUID({
    this.uid,
  });

  factory HabitUID.fromJson(Map<String, dynamic> json) =>
      _$HabitUIDFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  static const fromJsonFactory = _$HabitUIDFromJson;
  static const toJsonFactory = _$HabitUIDToJson;
  Map<String, dynamic> toJson() => _$HabitUIDToJson(this);

  @override
  String toString() => jsonEncode(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HabitUID &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^ runtimeType.hashCode;
}

extension $HabitUIDExtension on HabitUID {
  HabitUID copyWith({String? uid}) {
    return HabitUID(uid: uid ?? this.uid);
  }
}

extension $HabitUIDWrappedExtension on HabitUID {
  HabitUID copyWith({Wrapped<String?>? uid}) {
    return HabitUID(uid: (uid != null ? uid.value : this.uid));
  }
}

int? habitPriorityToJson(enums.HabitPriority? habitPriority) {
  return enums.$HabitPriorityMap[habitPriority];
}

enums.HabitPriority habitPriorityFromJson(
  Object? habitPriority, [
  enums.HabitPriority? defaultValue,
]) {
  if (habitPriority is int) {
    return enums.$HabitPriorityMap.entries
        .firstWhere((element) => element.value == habitPriority,
            orElse: () =>
                const MapEntry(enums.HabitPriority.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$HabitPriorityMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.HabitPriority.swaggerGeneratedUnknown;
}

List<int> habitPriorityListToJson(List<enums.HabitPriority>? habitPriority) {
  if (habitPriority == null) {
    return [];
  }

  return habitPriority.map((e) => enums.$HabitPriorityMap[e]!).toList();
}

List<enums.HabitPriority> habitPriorityListFromJson(
  List? habitPriority, [
  List<enums.HabitPriority>? defaultValue,
]) {
  if (habitPriority == null) {
    return defaultValue ?? [];
  }

  return habitPriority.map((e) => habitPriorityFromJson(e.toString())).toList();
}

int? habitTypeToJson(enums.HabitType? habitType) {
  return enums.$HabitTypeMap[habitType];
}

enums.HabitType habitTypeFromJson(
  Object? habitType, [
  enums.HabitType? defaultValue,
]) {
  if (habitType is int) {
    return enums.$HabitTypeMap.entries
        .firstWhere((element) => element.value == habitType,
            orElse: () =>
                const MapEntry(enums.HabitType.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$HabitTypeMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.HabitType.swaggerGeneratedUnknown;
}

List<int> habitTypeListToJson(List<enums.HabitType>? habitType) {
  if (habitType == null) {
    return [];
  }

  return habitType.map((e) => enums.$HabitTypeMap[e]!).toList();
}

List<enums.HabitType> habitTypeListFromJson(
  List? habitType, [
  List<enums.HabitType>? defaultValue,
]) {
  if (habitType == null) {
    return defaultValue ?? [];
  }

  return habitType.map((e) => habitTypeFromJson(e.toString())).toList();
}

int? updateHabitPriorityToJson(enums.UpdateHabitPriority? updateHabitPriority) {
  return enums.$UpdateHabitPriorityMap[updateHabitPriority];
}

enums.UpdateHabitPriority updateHabitPriorityFromJson(
  Object? updateHabitPriority, [
  enums.UpdateHabitPriority? defaultValue,
]) {
  if (updateHabitPriority is int) {
    return enums.$UpdateHabitPriorityMap.entries
        .firstWhere((element) => element.value == updateHabitPriority,
            orElse: () => const MapEntry(
                enums.UpdateHabitPriority.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$UpdateHabitPriorityMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.UpdateHabitPriority.swaggerGeneratedUnknown;
}

List<int> updateHabitPriorityListToJson(
    List<enums.UpdateHabitPriority>? updateHabitPriority) {
  if (updateHabitPriority == null) {
    return [];
  }

  return updateHabitPriority
      .map((e) => enums.$UpdateHabitPriorityMap[e]!)
      .toList();
}

List<enums.UpdateHabitPriority> updateHabitPriorityListFromJson(
  List? updateHabitPriority, [
  List<enums.UpdateHabitPriority>? defaultValue,
]) {
  if (updateHabitPriority == null) {
    return defaultValue ?? [];
  }

  return updateHabitPriority
      .map((e) => updateHabitPriorityFromJson(e.toString()))
      .toList();
}

int? updateHabitTypeToJson(enums.UpdateHabitType? updateHabitType) {
  return enums.$UpdateHabitTypeMap[updateHabitType];
}

enums.UpdateHabitType updateHabitTypeFromJson(
  Object? updateHabitType, [
  enums.UpdateHabitType? defaultValue,
]) {
  if (updateHabitType is int) {
    return enums.$UpdateHabitTypeMap.entries
        .firstWhere((element) => element.value == updateHabitType,
            orElse: () => const MapEntry(
                enums.UpdateHabitType.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$UpdateHabitTypeMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.UpdateHabitType.swaggerGeneratedUnknown;
}

List<int> updateHabitTypeListToJson(
    List<enums.UpdateHabitType>? updateHabitType) {
  if (updateHabitType == null) {
    return [];
  }

  return updateHabitType.map((e) => enums.$UpdateHabitTypeMap[e]!).toList();
}

List<enums.UpdateHabitType> updateHabitTypeListFromJson(
  List? updateHabitType, [
  List<enums.UpdateHabitType>? defaultValue,
]) {
  if (updateHabitType == null) {
    return defaultValue ?? [];
  }

  return updateHabitType
      .map((e) => updateHabitTypeFromJson(e.toString()))
      .toList();
}

int? addHabitPriorityToJson(enums.AddHabitPriority? addHabitPriority) {
  return enums.$AddHabitPriorityMap[addHabitPriority];
}

enums.AddHabitPriority addHabitPriorityFromJson(
  Object? addHabitPriority, [
  enums.AddHabitPriority? defaultValue,
]) {
  if (addHabitPriority is int) {
    return enums.$AddHabitPriorityMap.entries
        .firstWhere((element) => element.value == addHabitPriority,
            orElse: () => const MapEntry(
                enums.AddHabitPriority.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$AddHabitPriorityMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.AddHabitPriority.swaggerGeneratedUnknown;
}

List<int> addHabitPriorityListToJson(
    List<enums.AddHabitPriority>? addHabitPriority) {
  if (addHabitPriority == null) {
    return [];
  }

  return addHabitPriority.map((e) => enums.$AddHabitPriorityMap[e]!).toList();
}

List<enums.AddHabitPriority> addHabitPriorityListFromJson(
  List? addHabitPriority, [
  List<enums.AddHabitPriority>? defaultValue,
]) {
  if (addHabitPriority == null) {
    return defaultValue ?? [];
  }

  return addHabitPriority
      .map((e) => addHabitPriorityFromJson(e.toString()))
      .toList();
}

int? addHabitTypeToJson(enums.AddHabitType? addHabitType) {
  return enums.$AddHabitTypeMap[addHabitType];
}

enums.AddHabitType addHabitTypeFromJson(
  Object? addHabitType, [
  enums.AddHabitType? defaultValue,
]) {
  if (addHabitType is int) {
    return enums.$AddHabitTypeMap.entries
        .firstWhere((element) => element.value == addHabitType,
            orElse: () =>
                const MapEntry(enums.AddHabitType.swaggerGeneratedUnknown, 0))
        .key;
  }

  final parsedResult = defaultValue == null
      ? null
      : enums.$AddHabitTypeMap.entries
          .firstWhereOrNull((element) => element.value == defaultValue)
          ?.key;

  return parsedResult ??
      defaultValue ??
      enums.AddHabitType.swaggerGeneratedUnknown;
}

List<int> addHabitTypeListToJson(List<enums.AddHabitType>? addHabitType) {
  if (addHabitType == null) {
    return [];
  }

  return addHabitType.map((e) => enums.$AddHabitTypeMap[e]!).toList();
}

List<enums.AddHabitType> addHabitTypeListFromJson(
  List? addHabitType, [
  List<enums.AddHabitType>? defaultValue,
]) {
  if (addHabitType == null) {
    return defaultValue ?? [];
  }

  return addHabitType.map((e) => addHabitTypeFromJson(e.toString())).toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
