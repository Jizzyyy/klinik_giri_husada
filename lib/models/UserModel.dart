import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:klinik_giri_husada/helpers/OkDialog.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';

import '../helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;

import 'ModelToken.dart';

class UserModel {
  int? status;
  String? title;
  String? message;
  UserResponse? data;
  String? token;

  UserModel({this.status, this.title, this.message, this.data, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var myData = null;
    String? myToken = null;
    if (json['data'] != null && json['token'] != null) {
      myData = UserResponse.fromJson(json['data']);
      myToken = json['token'];
    } else if (json['data'] != null) {
      myData = UserResponse.fromJson(json['data']);
    }

    return UserModel(
      status: json['status'],
      title: json['title'],
      message: json['message'],
      data: myData,
      token: myToken,
    );
    // }
  }

  static Future<UserModel> register(
      BuildContext context,
      String nowa,
      String sandi,
      String device,
      String nama,
      String nik,
      String gender,
      String alamat) async {
    try {
      Uri url = Uri.parse(Apihelper.url + 'auth/register');
      var response = await http.post(url, body: {
        'user_nowa': nowa,
        'password': sandi,
        'device_name': device,
        'pasien_nama': nama,
        'pasien_nik': nik,
        'pasien_gender': gender,
        'pasien_alamat': alamat,
      });
      var userData = json.decode(response.body);
      return UserModel.fromJson(userData);
    } catch (e) {
      AwesomeWidget.errorDialog(context, 'Terjadi Kesalahan',
          'Mohon maaf, proses yang Anda lakukan gagal. Mohon untuk mengulang proses tersebut atau tunggu sejenak untuk mencoba kembali.');
      throw Exception('error saya $e');
    }
  }

  static Future<UserModel> login(BuildContext context, String nowa,
      String sandi, String device_name) async {
    try {
      Uri url = Uri.parse(Apihelper.url + 'auth/login');
      var response = await http.post(url, body: {
        'user_nowa': nowa,
        'password': sandi,
        'device_name': device_name,
      });
      var userData = json.decode(response.body);
      return UserModel.fromJson(userData);
    } catch (e) {
      AwesomeWidget.errorDialog(context, 'Terjadi Kesalahan',
          'Mohon maaf, proses yang Anda lakukan gagal. Mohon untuk mengulang proses tersebut atau tunggu sejenak untuk mencoba kembali.');
      throw Exception('error saya $e');
    }
  }

  static Future<UserModel> ubahData(BuildContext context, String idUser,
      String sandi, String category, String myvalue) async {
    try {
      Uri url = Uri.parse(Apihelper.url + 'user/ubah');
      var response =
          await http.post(url, headers: await ModelToken.getToken(), body: {
        'user_id': idUser,
        'password': sandi,
        'category': category,
        'value': myvalue,
      });
      var userData = json.decode(response.body);
      return UserModel.fromJson(userData);
    } catch (e) {
      AwesomeWidget.errorDialog(context, 'Terjadi Kesalahan',
          'Mohon maaf, proses yang Anda lakukan gagal. Mohon untuk mengulang proses tersebut atau tunggu sejenak untuk mencoba kembali.');
      throw Exception('error saya $e');
    }
  }
}

class UserResponse {
  final int? user_id;
  final String? user_nowa;
  final int? user_idkategori;
  final ProfileResponse? profile;
  const UserResponse(
      {this.user_id, this.user_nowa, this.user_idkategori, this.profile});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      user_id: json['user_id'],
      user_nowa: json['user_nowa'],
      user_idkategori: json['user_idkategori'],
      profile: ProfileResponse.fromJson(json['profile']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'user_nowa': user_nowa,
      'user_idkategori': user_idkategori,
      'profile': profile
    };
  }
}

class ProfileResponse {
  final int? pasien_id;
  final String? pasien_nama;
  final String? pasien_nik;
  final String? pasien_gender;
  final String? pasien_foto;
  final String? pasien_alamat;

  const ProfileResponse({
    this.pasien_id,
    this.pasien_nama,
    this.pasien_nik,
    this.pasien_gender,
    this.pasien_foto,
    this.pasien_alamat,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      pasien_id: json['pasien_id'],
      pasien_nama: json['pasien_nama'],
      pasien_nik: json['pasien_nik'],
      pasien_gender: json['pasien_gender'],
      pasien_foto: json['pasien_foto'],
      pasien_alamat: json['pasien_alamat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pasien_id': pasien_id,
      'pasien_nama': pasien_nama,
      'pasien_nik': pasien_nik,
      'pasien_gender': pasien_gender,
      'pasien_foto': pasien_foto,
      'pasien_alamat': pasien_alamat,
    };
  }
}
