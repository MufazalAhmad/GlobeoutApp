// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserEntityAdapter extends TypeAdapter<HiveUserEntity> {
  @override
  final int typeId = 3;

  @override
  HiveUserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserEntity(
      added: fields[1] as bool?,
      createdAt: fields[2] as String,
      id: fields[3] as String,
      imgUrl: fields[4] as String,
      initialInvitesSent: fields[5] as bool,
      name: fields[6] as String?,
      phNumber: fields[7] as String,
      photoUrl: fields[8] as String?,
      updatedAt: fields[9] as String,
      email: fields[10] as String?,
      username: fields[11] as String?,
      visible: fields[12] as bool?,
      friends: (fields[13] as List?)?.cast<String>(),
      closeFriends: (fields[14] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserEntity obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.added)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.imgUrl)
      ..writeByte(5)
      ..write(obj.initialInvitesSent)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.phNumber)
      ..writeByte(8)
      ..write(obj.photoUrl)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.email)
      ..writeByte(11)
      ..write(obj.username)
      ..writeByte(12)
      ..write(obj.visible)
      ..writeByte(13)
      ..write(obj.friends)
      ..writeByte(14)
      ..write(obj.closeFriends);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
