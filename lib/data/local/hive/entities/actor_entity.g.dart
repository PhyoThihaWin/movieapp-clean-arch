// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorEntityAdapter extends TypeAdapter<ActorEntity> {
  @override
  final int typeId = 2;

  @override
  ActorEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorEntity(
      fields[0] as bool,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as double,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActorEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownForDepartment)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
