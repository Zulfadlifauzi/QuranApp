// To parse this JSON data, do
//
//     final indexSurah = indexSurahFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

IndexSurah indexSurahFromJson(String str) =>
    IndexSurah.fromJson(json.decode(str));

String indexSurahToJson(IndexSurah data) => json.encode(data.toJson());

class IndexSurah {
  int? code;
  String? message;
  List<Datum>? data;

  IndexSurah({
    this.code,
    this.message,
    this.data,
  });

  factory IndexSurah.fromJson(Map<String, dynamic> json) => IndexSurah(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  TempatTurun? tempatTurun;
  String? arti;
  String? deskripsi;
  Map<String, String>? audioFull;

  Datum({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: tempatTurunValues.map[json["tempatTurun"]]!,
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurunValues.reverse[tempatTurun],
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

enum TempatTurun { MEKAH, MADINAH }

final tempatTurunValues =
    EnumValues({"Madinah": TempatTurun.MADINAH, "Mekah": TempatTurun.MEKAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
