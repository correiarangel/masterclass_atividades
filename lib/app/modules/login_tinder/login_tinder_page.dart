import 'package:flutter_modular/flutter_modular.dart';
import 'package:masterclass_atividades/app/shared/util/value/const_colors2.dart';
import 'login_tinder_store.dart';
import 'package:flutter/material.dart';

import 'components/button_transparent_main.dart';

class LoginTinderPage extends StatefulWidget {
  final String title;
  const LoginTinderPage({Key? key, this.title = 'LoginTinderPage'})
      : super(key: key);
  @override
  LoginTinderPageState createState() => LoginTinderPageState();
}

class LoginTinderPageState extends State<LoginTinderPage> {
  final LoginTinderStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ConstColorsII.colorTerraCota,
          gradient: LinearGradient(
            colors: [
              ConstColorsII.colorBlush,
              ConstColorsII.colorTerraCota,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 30.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        //explict_animation

                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_left,
                              color: ConstColorsII.colorWhite,
                              size: 42.0,
                            ),
                            onPressed: () {
                              debugPrint("CLICK BUTTON BACK <");
                              Modular.to.pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 160),
                Image.asset(
                  "images/logotinder.png",
                  width: 180,
                  height: 100,
                ),

                const SizedBox(height: 60.0),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'By tapping Create Account of Sign In,you agree to our',
                        style: TextStyle(
                          color: ConstColorsII.colorWhite,
                          fontSize: 14.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              store.dailog(context: context);
                            },
                            child: const Text(
                              'Terms ',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                inherit: true,
                                color: ConstColorsII.colorWhite,
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Text(
                            '.Learm how we process your data in our',
                            style: TextStyle(
                              color: ConstColorsII.colorWhite,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              store.dailog(context: context);
                            },
                            child: const Text(
                              ' Privacy',
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
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              store.dailog(context: context);
                            },
                            child: const Text(
                              'Privacy ',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ConstColorsII.colorWhite,
                                fontSize: 15.0,
                                inherit: true,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const Text(
                            'and Cookies',
                            style: TextStyle(
                              color: ConstColorsII.colorWhite,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          GestureDetector(
                            onTap: () {
                              store.dailog(context: context);
                            },
                            child: const Text(
                              ' Policy',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ConstColorsII.colorWhite,
                                fontSize: 14.0,
                                inherit: true,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 28.0),
                ButtonTransparent(
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  fontSize: 16.0,
                  marginRight: 18.0,
                  marginLeft: 18.0,
                  text: '         SING IN WITH APPLE',
                  pathImage: "images/apple.png",
                  callback: () async {
                    store.dailog(context: context);
                  },
                ),
                const SizedBox(height: 8.0),
                ButtonTransparent(
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  fontSize: 16.0,
                  marginRight: 18.0,
                  marginLeft: 18.0,
                  text: '     SING IN WITH FACEBOOK',
                  pathImage: "images/facebook.png",
                  callback: () {
                    store.dailog(context: context);
                  },
                ),
                const SizedBox(height: 8.0),
                ButtonTransparent(
                  height: 48.0,
                  width: MediaQuery.of(context).size.width,
                  fontSize: 16.0,
                  marginRight: 18.0,
                  marginLeft: 18.0,
                  text: 'SING IN WITH PHONE NUMBER',
                  pathImage: "images/conversation.png",
                  callback: () {
                    store.dailog(context: context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 18.0,
                    right: 18.0,
                  ),
                  child: TextButton(
                    onPressed: () {
                      store.dailog(context: context);
                    },
                    child: const Text(
                      "Trouble Sinning In?",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: ConstColorsII.colorWhite,
                      ),
                    ),
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
