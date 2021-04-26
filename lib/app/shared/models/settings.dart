import 'dart:convert';

class SettingsModel {
  bool isDark;
  String sectorSelected;

  SettingsModel({
    required this.isDark,
    required this.sectorSelected,
  });

  Map<String, dynamic> toMap() {
    return {
      'isDark': isDark,
      'sectorSelected': sectorSelected,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      isDark: map['isDark'],
      sectorSelected: map['sectorSelected'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) =>
      SettingsModel.fromMap(json.decode(source));
}
