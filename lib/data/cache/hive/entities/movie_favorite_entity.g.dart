// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_favorite_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieFavoriteEntityAdapter extends TypeAdapter<MovieFavoriteEntity> {
  @override
  final int typeId = 3;

  @override
  MovieFavoriteEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieFavoriteEntity(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieFavoriteEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieFavoriteEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
