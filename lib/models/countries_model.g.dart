// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) =>
    CountriesModel(
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      capital:
          (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      region: json['region'] as String,
      languages: Languages.fromJson(json['languages'] as Map<String, dynamic>),
      population: (json['population'] as num).toInt(),
    );

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'name': instance.name,
      'capital': instance.capital,
      'region': instance.region,
      'languages': instance.languages,
      'population': instance.population,
    };

Flags _$FlagsFromJson(Map<String, dynamic> json) => Flags(
      png: json['png'] as String,
      svg: json['svg'] as String,
      alt: json['alt'] as String,
    );

Map<String, dynamic> _$FlagsToJson(Flags instance) => <String, dynamic>{
      'png': instance.png,
      'svg': instance.svg,
      'alt': instance.alt,
    };

Languages _$LanguagesFromJson(Map<String, dynamic> json) => Languages(
      nno: json['nno'] as String?,
      nob: json['nob'] as String?,
      smi: json['smi'] as String?,
    );

Map<String, dynamic> _$LanguagesToJson(Languages instance) => <String, dynamic>{
      'nno': instance.nno,
      'nob': instance.nob,
      'smi': instance.smi,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      common: json['common'] as String,
      official: json['official'] as String,
      nativeName:
          NativeName.fromJson(json['nativeName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
      'nativeName': instance.nativeName,
    };

NativeName _$NativeNameFromJson(Map<String, dynamic> json) => NativeName(
      nno: json['nno'] == null
          ? null
          : Nno.fromJson(json['nno'] as Map<String, dynamic>),
      nob: json['nob'] == null
          ? null
          : Nno.fromJson(json['nob'] as Map<String, dynamic>),
      smi: json['smi'] == null
          ? null
          : Nno.fromJson(json['smi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NativeNameToJson(NativeName instance) =>
    <String, dynamic>{
      'nno': instance.nno,
      'nob': instance.nob,
      'smi': instance.smi,
    };

Nno _$NnoFromJson(Map<String, dynamic> json) => Nno(
      official: json['official'] as String?,
      common: json['common'] as String?,
    );

Map<String, dynamic> _$NnoToJson(Nno instance) => <String, dynamic>{
      'official': instance.official,
      'common': instance.common,
    };
