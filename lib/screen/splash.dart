import 'package:Muhasebe/screen/urunlist.dart';
import 'package:Muhasebe/services/apiservices.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tokenal();
  }

  tokenal() async {
    print("tokenda");
    SharedPreferences sp = await SharedPreferences.getInstance();
    var token = sp.getString("token" ?? "yok");
    APIServices.tok = token;
    APIServices.tokentest().then((v) {
      if (v == 0) {
        print("00");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Urunli()),
            (Route<dynamic> route) => false);
      } else if (v == -1) {
        print("-1");
        APIServices.tokenal().then((value) async {
          print(value);
          await sp.setString("token", value);
          APIServices.tok = value;
          APIServices.header = {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${APIServices.tok}'
          };
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Urunli()),
              (Route<dynamic> route) => false);
        });
      } else {
        print("111");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("splash uida");
    return Scaffold(
      body: Container(
          color: Colors.grey[100],
          child: Center(child: CircularProgressIndicator())),
    );
  }
}
