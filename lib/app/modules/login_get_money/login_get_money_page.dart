import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_colors2.dart';


import 'components/button_transparent_main.dart';
import 'login_get_money_store.dart';

class LoginGetMoneyPage extends StatefulWidget {
  const LoginGetMoneyPage({
    Key? key,
  }) : super(key: key);
  @override
  LoginGetMoneyPageState createState() => LoginGetMoneyPageState();
}

class LoginGetMoneyPageState extends State<LoginGetMoneyPage> {
  final LoginGetMoneyStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ConstColorsII.colorBlack,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //const SizedBox(height: 8.0),
                const SizedBox(height: 60),
                Image.asset(
                  "img/logo.png",
                  width: 180,
                  height: 180,
                ),
              
                const SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Column(
                    children: const <Widget>[
                      Text(
                        'Get yuor Money\nUnder Control',
                        style: TextStyle(
                            color: ConstColorsII.colorWhite,
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Manage your expesenses.\n'
                        'Seamlessly ',
                        style: TextStyle(
                          color: ConstColorsII.colorStateGray,
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2),
                    ],
                  ),
                ),
                const SizedBox(height: 48.0),
                ButtonHome(
                  corText: ConstColorsII.colorWhite,
                  corButton: ConstColorsII.colorMajorelleBlue,
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  fontSize: 16.0,
                  marginRight: 18.0,
                  marginLeft: 18.0,
                  text: '         Sing Up with Email ID',
                  pathImage: "img/purp.png",
                  callback: () async {
                    await store.dailog(context: context);
                  },
                ),
                const SizedBox(height: 14.0),
                ButtonHome(
                  corText: ConstColorsII.colorBlack,
                  corButton: ConstColorsII.colorWhite,
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  fontSize: 16.0,
                  marginRight: 18.0,
                  marginLeft: 18.0,
                  text: '          Sing UP with Google',
                  pathImage: "img/google.png",
                  callback: () {
                    store.dailog(context: context);
                  },
                ),
                const SizedBox(height: 8.0),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 18.0,
                    right: 18.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: ConstColorsII.colorWhite,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          store.dailog(context: context);
                        },
                        child: const Text(
                          ' Sign In ',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            inherit: true,
                            color: ConstColorsII.colorWhite,
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                //_myRow
              ],
            ),
          ),
        ),
      ),
    );
  }
}
