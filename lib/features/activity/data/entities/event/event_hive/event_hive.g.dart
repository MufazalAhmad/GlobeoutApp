// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveEventEntityAdapter extends TypeAdapter<HiveEventEntity> {
  @override
  final int typeId = 1;

  @override
  HiveEventEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveEventEntity(
      id: fields[10] as String,
      createdAt: fields[0] as String,
      userId: fields[1] as String,
      activities: (fields[2] as List).cast<String>(),
      inMinutes: fields[3] as int,
      forHours: fields[4] as int,
      forAllFriends: fields[5] as bool,
      lat: fields[6] as double,
      lng: fields[7] as double,
      updatedTime: fields[9] as String,
      user: fields[11] as UserEntity,
    );
  }

  @override
  void write(BinaryWriter writer, HiveEventEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.activities)
      ..writeByte(3)
      ..write(obj.inMinutes)
      ..writeByte(4)
      ..write(obj.forHours)
      ..writeByte(5)
      ..write(obj.forAllFriends)
      ..writeByte(6)
      ..write(obj.lat)
      ..writeByte(7)
      ..write(obj.lng)
      ..writeByte(9)
      ..write(obj.updatedTime)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(11)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveEventEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
