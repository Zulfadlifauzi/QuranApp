// To parse this JSON data, do
//
//     final showTranslateSurah = showTranslateSurahFromJson(jsonString);

import 'dart:convert';

ShowTranslateSurah showTranslateSurahFromJson(String str) =>
    ShowTranslateSurah.fromJson(json.decode(str));

String showTranslateSurahToJson(ShowTranslateSurah data) =>
    json.encode(data.toJson());

class ShowTranslateSurah {
  int? code;
  String? message;
  Data? data;

  ShowTranslateSurah({
    this.code,
    this.message,
    this.data,
  });

  factory ShowTranslateSurah.fromJson(Map<String, dynamic> json) =>
      ShowTranslateSurah(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  Map<String, String>? audioFull;
  List<Tafsir>? tafsir;
  SuratSelanjutnya? suratSelanjutnya;
  bool? suratSebelumnya;

  Data({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.tafsir,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        tafsir: json["tafsir"] == null
            ? []
            : List<Tafsir>.from(json["tafsir"]!.map((x) => Tafsir.fromJson(x))),
        suratSelanjutnya: json["suratSelanjutnya"] == null
            ? null
            : SuratSelanjutnya.fromJson(json["suratSelanjutnya"]),
        suratSebelumnya: json["suratSebelumnya"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "tafsir": tafsir == null
            ? []
            : List<dynamic>.from(tafsir!.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya?.toJson(),
        "suratSebelumnya": suratSebelumnya,
      };
}

class SuratSelanjutnya {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;

  SuratSelanjutnya({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
  });

  factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) =>
      SuratSelanjutnya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}

class Tafsir {
  int? ayat;
  String? teks;

  Tafsir({
    this.ayat,
    this.teks,
  });

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        ayat: json["ayat"],
        teks: json["teks"],
      );

  Map<String, dynamic> toJson() => {
        "ayat": ayat,
        "teks": teks,
      };
}
