// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'konselor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KonselorAdapter extends TypeAdapter<Konselor> {
  @override
  final int typeId = 1;

  @override
  Konselor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Konselor(
      id: fields[0] as int?,
      email: fields[1] as String?,
      password: fields[2] as String?,
      name: fields[3] as String?,
      major: fields[4] as String?,
      role: fields[5] as int?,
      profileImageUrl: fields[6] as String?,
      fcmToken: fields[7] as String?,
      createdAt: fields[8] as DateTime?,
      updatedAt: fields[9] as DateTime?,
      isAvailable: fields[13] as int?,
      jadwal: fields[14] as String?,
      nim: fields[10] as String?,
      noHp: fields[11] as String?,
      idLine: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Konselor obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.major)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.profileImageUrl)
      ..writeByte(7)
      ..write(obj.fcmToken)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.nim)
      ..writeByte(11)
      ..write(obj.noHp)
      ..writeByte(12)
      ..write(obj.idLine)
      ..writeByte(13)
      ..write(obj.isAvailable)
      ..writeByte(14)
      ..write(obj.jadwal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KonselorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
