// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieEntityAdapter extends TypeAdapter<MovieEntity> {
  @override
  final int typeId = 1;

  @override
  MovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieEntity(
      fields[0] as String?,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as double,
      (fields[8] as List).cast<int>(),
    )
      ..isNowPlaying = fields[9] as bool
      ..isComingSoon = fields[10] as bool
      ..isPopular = fields[11] as bool
      ..isFavorite = fields[12] as bool;
  }

  @override
  void write(BinaryWriter writer, MovieEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.backdropPath)
      ..writeByte(5)
      ..write(obj.posterPath)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(7)
      ..write(obj.voteAverage)
      ..writeByte(8)
      ..write(obj.genreIds)
      ..writeByte(9)
      ..write(obj.isNowPlaying)
      ..writeByte(10)
      ..write(obj.isComingSoon)
      ..writeByte(11)
      ..write(obj.isPopular)
      ..writeByte(12)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
