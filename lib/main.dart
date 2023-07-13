import 'dart:math';

import 'package:cliveott/src/view/splashscreen.dart';
import 'package:cliveott/utils/common_function/constants.dart';

import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkLogin();

  runApp(MyApp());
}

String? token;

checkLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString(Constants.token);
  print(token.toString());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _isTV;
  final _isTVPlugin = IsTV();

  Future<void> initPlatformState() async {
    bool? isTV;

    try {
      isTV = await _isTVPlugin.check() ?? false;
    } on PlatformException {
      isTV = false;
    }

    if (!mounted) return;

    setState(() {
      _isTV = isTV ?? false;
    });
  }

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => FocusableActionDetector(
        child: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(
                      LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
                  ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowLeft):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowRight):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowDown):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.arrowUp): const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.pause): const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.play): const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.audioVolumeUp):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.audioVolumeUp):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.audioVolumeMute):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.microphoneVolumeDown):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.microphoneVolumeUp):
                  const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.microphoneVolumeMute):
                  const ActivateIntent(),
              LogicalKeySet(
                      LogicalKeyboardKey.enter, LogicalKeyboardKey.control):
                  const ActivateIntent(),
            },
            child: GetMaterialApp(
                // theme: ThemeData(
                //     brightness: Brightness.dark,
                //     primarySwatch: Colors.grey,
                //     scaffoldBackgroundColor: const Color(0xff202020),
                //     splashColor: const Color(0xff202020),
                //     backgroundColor: const Color(0xff202020),
                //     colorScheme: ColorScheme.fromSwatch(
                //       backgroundColor: Colors.grey,
                //       brightness: Brightness.dark,
                //     ).copyWith(
                //       secondary: Colors.orange,
                //       primary: Colors.grey,
                //       brightness: Brightness.dark,
                //     )),
                debugShowCheckedModeBanner: false,
                home: SplashScreen())),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode myfocus = FocusNode();
  FocusNode myfocus1 = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailController1 = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      myfocus.requestFocus(); //auto focus on second text field.
    });
    Future.delayed(Duration(seconds: 0), () {
      myfocus1.requestFocus(); //auto focus on second text field.
    });

    super.initState();
  }

  bool _validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool _validateEmail1(String email) {
    return EmailValidator.validate(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Auto Focus on TextField"),
            backgroundColor: Colors.redAccent),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  onEditingComplete: () {
                    if (_validateEmail(_emailController.text)) {
                      // Valid email, do something
                    } else {
                      // Invalid email, show error message
                    }
                  },
                ),
                TextField(
                  controller: _emailController1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                  ),
                  onEditingComplete: () {
                    if (_validateEmail1(_emailController1.text)) {
                      // Valid email, do something
                    } else {
                      // Invalid email, show error message
                    }
                  },
                ),
              ],
            )));
  }
}
