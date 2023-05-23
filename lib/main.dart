import 'package:cliveott/src/view/category/summa.dart';
import 'package:cliveott/src/view/splashscreen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // if (MyPlatform.isTVOS) {}
  Wakelock.enable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => FocusableActionDetector(
        child: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
              LogicalKeySet(LogicalKeyboardKey.enter): const ActivateIntent(),
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
