import 'package:diamonds/constants/size_config.dart';
import 'package:diamonds/core/graphqlclients.dart';
import 'package:diamonds/pages/home/home.dart';
import 'package:diamonds/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
           Image.asset('assets/images/splash.png'),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.black,
              width: double.infinity,
              height: geth(110),
              child: TextButton(
                onPressed: () {
                  if (box.read("token") == null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
                child: Text("Enter",style: TextStyle(fontSize: geth(30)),),
                style: ElevatedButton.styleFrom(fixedSize: Size(getw(150), geth(80)),primary: Colors.indigoAccent.shade700,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
