// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Success _$SuccessFromJson(Map<String, dynamic> json) => Success(
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$SuccessToJson(Success instance) => <String, dynamic>{
      'success': instance.success,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

Habits _$HabitsFromJson(Map<String, dynamic> json) => Habits(
      count: json['count'] as int?,
      habits: (json['habits'] as List<dynamic>?)
              ?.map((e) => Habit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HabitsToJson(Habits instance) => <String, dynamic>{
      'count': instance.count,
      'habits': instance.habits?.map((e) => e.toJson()).toList(),
    };

Habit _$HabitFromJson(Map<String, dynamic> json) => Habit(
      color: json['color'] as int?,
      count: json['count'] as int?,
      date: json['date'] as int?,
      description: json['description'] as String?,
      doneDates: (json['done_dates'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      frequency: json['frequency'] as int?,
      priority: json['priority'] as int?,
      title: json['title'] as String?,
      type: json['type'] as int?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$HabitToJson(Habit instance) => <String, dynamic>{
      'color': instance.color,
      'count': instance.count,
      'date': instance.date,
      'description': instance.description,
      'done_dates': instance.doneDates,
      'frequency': instance.frequency,
      'priority': instance.priority,
      'title': instance.title,
      'type': instance.type,
      'uid': instance.uid,
    };

UpdateHabit _$UpdateHabitFromJson(Map<String, dynamic> json) => UpdateHabit(
      color: json['color'] as int?,
      count: json['count'] as int?,
      date: json['date'] as int?,
      description: json['description'] as String?,
      frequency: json['frequency'] as int?,
      priority: json['priority'] as int?,
      title: json['title'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$UpdateHabitToJson(UpdateHabit instance) =>
    <String, dynamic>{
      'color': instance.color,
      'count': instance.count,
      'date': instance.date,
      'description': instance.description,
      'frequency': instance.frequency,
      'priority': instance.priority,
      'title': instance.title,
      'type': instance.type,
    };

AddHabit _$AddHabitFromJson(Map<String, dynamic> json) => AddHabit(
      color: json['color'] as int?,
      count: json['count'] as int?,
      date: json['date'] as int?,
      description: json['description'] as String?,
      frequency: json['frequency'] as int?,
      priority: json['priority'] as int?,
      title: json['title'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$AddHabitToJson(AddHabit instance) => <String, dynamic>{
      'color': instance.color,
      'count': instance.count,
      'date': instance.date,
      'description': instance.description,
      'frequency': instance.frequency,
      'priority': instance.priority,
      'title': instance.title,
      'type': instance.type,
    };

HabitDone _$HabitDoneFromJson(Map<String, dynamic> json) => HabitDone(
      date: json['date'] as int?,
    );

Map<String, dynamic> _$HabitDoneToJson(HabitDone instance) => <String, dynamic>{
      'date': instance.date,
    };

HabitUID _$HabitUIDFromJson(Map<String, dynamic> json) => HabitUID(
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$HabitUIDToJson(HabitUID instance) => <String, dynamic>{
      'uid': instance.uid,
    };
