// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MahasiswaAdapter extends TypeAdapter<Mahasiswa> {
  @override
  final int typeId = 0;

  @override
  Mahasiswa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mahasiswa(
      nim: fields[0] as String?,
      email: fields[11] as String?,
      name: fields[1] as String?,
      major: fields[2] as String?,
      role: fields[3] as int?,
      profileImageUrl: fields[4] as String?,
      noHp: fields[5] as String?,
      idLine: fields[6] as String?,
      dpa: fields[7] as String?,
      fcmToken: fields[8] as String?,
      createdAt: fields[9] as DateTime?,
      updatedAt: fields[10] as DateTime?,
      reservations: (fields[12] as List?)?.cast<ReservationSchedule>(),
    );
  }

  @override
  void write(BinaryWriter writer, Mahasiswa obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.nim)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.major)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.profileImageUrl)
      ..writeByte(5)
      ..write(obj.noHp)
      ..writeByte(6)
      ..write(obj.idLine)
      ..writeByte(7)
      ..write(obj.dpa)
      ..writeByte(8)
      ..write(obj.fcmToken)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.email)
      ..writeByte(12)
      ..write(obj.reservations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MahasiswaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
