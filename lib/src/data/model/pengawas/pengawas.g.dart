// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengawas.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PengawasAdapter extends TypeAdapter<Pengawas> {
  @override
  final int typeId = 3;

  @override
  Pengawas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pengawas(
      id: fields[0] as int?,
      email: fields[1] as String?,
      password: fields[2] as String?,
      name: fields[3] as String?,
      role: fields[4] as int?,
      profileImageUrl: fields[5] as String?,
      fcmToken: fields[6] as String?,
      createdAt: fields[7] as DateTime?,
      updatedAt: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Pengawas obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.profileImageUrl)
      ..writeByte(6)
      ..write(obj.fcmToken)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PengawasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
