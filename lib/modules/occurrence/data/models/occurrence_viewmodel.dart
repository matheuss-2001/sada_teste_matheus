import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';

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
      photoBytes: json['photo_bytes'] != null ? Uint8List.fromList(List<int>.from(json['photo_bytes'])) : Uint8List(0),
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
      'photo_bytes': photoBytes,
      'responsible_name': responsibleName,
      'responsible_sign_bytes': responsibleSignBytes,
      'datetime_register_occurrence': dateTimeRegisterOccurrence.toString(),
      'datetime_register_signed': dateTimeRegisterSigned.toString(),
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

  String getDateBrFormat(DateTime dateTime) {
    try {
      final DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');
      return dateFormat.format(dateTime);
    } catch (e) {
      return "";
    }
  }
}
