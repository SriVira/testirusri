import 'package:json_annotation/json_annotation.dart';
part 'countries_model.g.dart';

@JsonSerializable()
class CountriesModel {
  Flags flags;
  Name name;
  List<String> capital;
  String region;
  Languages languages;
  int population;

  CountriesModel({
    required this.flags,
    required this.name,
    required this.capital,
    required this.region,
    required this.languages,
    required this.population,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);
}

@JsonSerializable()
class Flags {
  String png;
  String svg;
  String alt;

  Flags({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);

  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}

@JsonSerializable()
class Languages {
  String? nno;
  String? nob;
  String? smi;

  Languages({
    required this.nno,
    required this.nob,
    required this.smi,
  });

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}

@JsonSerializable()
class Name {
  String common;
  String official;
  NativeName nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class NativeName {
  Nno? nno;
  Nno? nob;
  Nno? smi;

  NativeName({
    required this.nno,
    required this.nob,
    required this.smi,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) =>
      _$NativeNameFromJson(json);

  Map<String, dynamic> toJson() => _$NativeNameToJson(this);
}

@JsonSerializable()
class Nno {
  String? official;
  String? common;

  Nno({
    required this.official,
    required this.common,
  });

  factory Nno.fromJson(Map<String, dynamic> json) => _$NnoFromJson(json);

  Map<String, dynamic> toJson() => _$NnoToJson(this);
}
