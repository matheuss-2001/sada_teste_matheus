import 'dart:io';
import 'dart:typed_data';

class OccurrenceViewmodel {
  String plate;
  Uint8List photoBytes;
  String responsibleName;
  Uint8List responsibleSignBytes;
  DateTime dateTimeRegisterOccurrence;
  DateTime dateTimeRegisterSigned;

  OccurrenceViewmodel({
    required this.plate,
    required this.photoBytes,
    required this.responsibleName,
    required this.responsibleSignBytes,
    required this.dateTimeRegisterOccurrence,
    required this.dateTimeRegisterSigned,
  });

  factory OccurrenceViewmodel.fromJson(Map<String, dynamic> json) {
    return OccurrenceViewmodel(
      plate: json['plate'] ?? '',
      photoBytes: json['photoBytes'] != null ? Uint8List.fromList(List<int>.from(json['photoBytes'])) : Uint8List(0),
      responsibleName: json['responsible_name'] ?? '',
      responsibleSignBytes: json['responsible_sign_bytes'] != null
          ? Uint8List.fromList(List<int>.from(json['responsible_sign_bytes']))
          : Uint8List(0),
      dateTimeRegisterOccurrence: json['datetime_register_occurrence'] != null
          ? DateTime.tryParse(json['datetime_register_occurrence']) ?? DateTime.now()
          : DateTime.now(),
      dateTimeRegisterSigned: json['datetime_register_signed'] != null
          ? DateTime.tryParse(json['datetime_register_signed']) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJsonSaveData() {
    return {
      'plate': plate,
      'photoBytes': photoBytes,
      'responsibleName': responsibleName,
      'responsibleSignBytes': responsibleSignBytes,
      'dateTimeCreated': dateTimeRegisterOccurrence.toIso8601String(),
      'datetime_register_signed': dateTimeRegisterSigned.toIso8601String(),
    };
  }

  Future<File> byteToFile(String path, Uint8List byte) async {
    try {
      final File file = File(path);
      await file.writeAsBytes(byte);
      return file;
    } catch (e) {
      return File("");
    }
  }

  Future<Uint8List> fileToBytes(File file) async {
    try {
      return await file.readAsBytes();
    } catch (e) {
      return Uint8List(0);
    }
  }
}
