import 'dart:convert';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:klinik_giri_husada/views/home.dart';
import 'package:klinik_giri_husada/widgets/AwesomeDialogWidget.dart';
// import '../helpers/DeviceInfo.dart';
import '../models/UserModel.dart';
import '../helpers/OkDialog.dart';
import '../models/PatientModel.dart';

class LoginController {
  bool _obscure = true;
  get getObscure => this._obscure;

  set setObscure(value) => this._obscure = value;

  void toglePass() {
    _obscure = !_obscure;
  }

  void btLogin(BuildContext context, String nowa, String sandi) async {
    // Navigator.pushReplacementNamed(context, '/home');

    // String device_name = await DeviceInfo.getInfo(context);
    UserModel.login(context, nowa, sandi, 'android').then((value) async {
      if (value.status! >= 400) {
        AwesomeWidget.errorDialog(
            context, value.title.toString(), value.message.toString());
      } else {
        final storage = new FlutterSecureStorage();
        String jsonString = json.encode(value.data!.toJson());
        await storage.write(key: 'token', value: value.token);
        await storage.write(key: 'userdata', value: jsonString);
        await storage.write(key: 'logstatus', value: 'true');
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  void btRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }
}
