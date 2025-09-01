import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import '../hive_type_ids.dart';

class LocaleAdapter extends TypeAdapter<Locale> {
  @override
  final int typeId = HiveTypeIds.locale; // Ensure this ID is unique within your app

  @override
  Locale read(BinaryReader reader) {
    final languageCode = reader.readString();
    final countryCode = reader.readString();
    return Locale(languageCode, countryCode);
  }

  @override
  void write(BinaryWriter writer, Locale obj) {
    writer.writeString(obj.languageCode);
    writer.writeString(obj.countryCode ?? '');
  }
}
