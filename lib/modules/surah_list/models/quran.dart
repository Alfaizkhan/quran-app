// ignore_for_file: constant_identifier_names, inference_failure_on_instance_creation, lines_longer_than_80_chars, cast_nullable_to_non_nullable, avoid_dynamic_calls, inference_failure_on_untyped_parameter
import 'dart:convert';

List<Quran> quranFromJson(String str) => List<Quran>.from(
      json
              .decode(str)
              .map((quran) => Quran.fromJson(quran as Map<String, dynamic>))
          as Iterable<dynamic>,
    );

String quranToJson(List<Quran> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quran {
  Quran({
    this.name,
    this.nameTranslations,
    this.numberOfAyah,
    this.numberOfSurah,
    this.place,
    this.type,
    this.verses,
    this.tafsir,
  });

  factory Quran.fromJson(Map<String, dynamic> json) => Quran(
        name: json['name'] as String?,
        nameTranslations: NameTranslations.fromJson(
          json['name_translations'] as Map<String, dynamic>,
        ),
        numberOfAyah: json['number_of_ayah'] as int?,
        numberOfSurah: json['number_of_surah'] as int?,
        place: placeValues.map[json['place']],
        type: typeValues.map[json['type']],
        verses: List<Verse>.from(
          (json['verses'] as Iterable<dynamic>)
              .map((x) => Verse.fromJson(x as Map<String, dynamic>)),
        ),
        tafsir: Tafsir.fromJson(json['tafsir'] as Map<String, dynamic>),
      );

  String? name;
  NameTranslations? nameTranslations;
  int? numberOfAyah;
  int? numberOfSurah;
  Place? place;
  Type? type;
  List<Verse>? verses;
  Tafsir? tafsir;

  Map<String, dynamic> toJson() => {
        'name': name,
        'name_translations': nameTranslations?.toJson(),
        'number_of_ayah': numberOfAyah,
        'number_of_surah': numberOfSurah,
        'place': placeValues.reverse[place],
        'type': typeValues.reverse[type],
        'verses': List<dynamic>.from(verses!.map((x) => x.toJson())),
        'tafsir': tafsir?.toJson(),
      };
}

class NameTranslations {
  NameTranslations({
    this.ar,
    this.en,
  });

  factory NameTranslations.fromJson(Map<String, dynamic> json) =>
      NameTranslations(
        ar: json['ar'] as String?,
        en: json['en'] as String?,
      );

  String? ar;
  String? en;
  // String? id;

  Map<String, dynamic> toJson() => {
        'ar': ar,
        'en': en,
      };
}

enum Place { mecca, medina }

final placeValues = EnumValues({'Mecca': Place.mecca, 'Medina': Place.medina});

class Tafsir {
  Tafsir({
    this.id,
  });

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: Id.fromJson(json['id'] as Map<String, dynamic>),
      );

  Id? id;

  Map<String, dynamic> toJson() => {
        'id': id?.toJson(),
      };
}

class Id {
  Id({
    this.kemenag,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kemenag: Kemenag.fromJson(json['kemenag'] as Map<String, dynamic>),
      );

  Kemenag? kemenag;

  Map<String, dynamic> toJson() => {
        'kemenag': kemenag?.toJson(),
      };
}

class Kemenag {
  Kemenag({
    this.name,
    this.source,
    this.text,
  });

  factory Kemenag.fromJson(Map<String, dynamic> json) => Kemenag(
        name: kemenagNameValues.map[json['name']],
        source: sourceValues.map[json['source']],
        text: Map.from(json['text'] as Map<String, dynamic>)
            .map((k, v) => MapEntry<String, String>(k as String, v as String)),
      );

  KemenagName? name;
  Source? source;
  Map<String, String>? text;

  Map<String, dynamic> toJson() => {
        'name': kemenagNameValues.reverse[name],
        'source': sourceValues.reverse[source],
        'text': Map.from(text as Map<dynamic, dynamic>).map(
          MapEntry<String, dynamic>.new as MapEntry<dynamic, dynamic> Function(
            dynamic,
            dynamic,
          ),
        ),
      };
}

enum KemenagName { KEMENAG }

final kemenagNameValues = EnumValues({'Kemenag': KemenagName.KEMENAG});

enum Source { APLIKASI_QURAN_KEMENTRIAN_AGAMA_REPUBLIK_INDONESIA }

final sourceValues = EnumValues(
  {
    'Aplikasi Quran Kementrian Agama Republik Indonesia':
        Source.APLIKASI_QURAN_KEMENTRIAN_AGAMA_REPUBLIK_INDONESIA
  },
);

enum Type { MAKKIYAH, MADANIYAH }

final typeValues =
    EnumValues({'Madaniyah': Type.MADANIYAH, 'Makkiyah': Type.MAKKIYAH});

class Verse {
  Verse({
    this.number,
    this.text,
    this.translationEn,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: json['number'] as int?,
        text: json['text'] as String?,
        translationEn: json['translation_en'] as String?,
      );

  int? number;
  String? text;
  String? translationEn;

  Map<String, dynamic> toJson() => {
        'number': number,
        'text': text,
        'translation_en': translationEn,
      };
}

class EnumValues<T> {
  EnumValues(this.map);
  Map<String, T> map;
  late Map<T, String> reverseMap;

  Map<T, String> get reverse {
    // ignore: unnecessary_statements
    reverseMap;
    return reverseMap;
  }
}
