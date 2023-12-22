import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/helpers/pcolor.dart';
import 'package:klinik_giri_husada/views/change_gender.dart';
import 'package:klinik_giri_husada/views/edit_password.dart';
import 'package:klinik_giri_husada/views/edit_user.dart';
import 'package:klinik_giri_husada/views/account.dart';
import 'package:klinik_giri_husada/views/forgot_password.dart';
// import 'package:klinik_giri_husada/views/bottom_view.dart';
import 'package:klinik_giri_husada/views/history.dart';
import 'package:klinik_giri_husada/views/home.dart';
import 'package:klinik_giri_husada/views/login.dart';
import 'package:klinik_giri_husada/views/queue_message.dart';
import 'package:klinik_giri_husada/views/register.dart';
import 'package:klinik_giri_husada/views/reset_input_password.dart';
import 'package:klinik_giri_husada/views/splashscreen.dart';
import 'package:klinik_giri_husada/views/success_cancel.dart';
import 'package:klinik_giri_husada/views/success_queue.dart';
import 'package:klinik_giri_husada/views/verify_phone.dart';
import 'package:klinik_giri_husada/views/verify_reset.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          color: Color(0xfff1f1f1),
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: AppColors.primary,
              primarySwatch: Palette.pcolor,
              fontFamily: 'nunito-sm'),
          home: child,
          routes: {
            '/splashscreen': (context) => Splashscreen(),
            '/login': (context) => const Login(),
            '/home': (context) => const HomePage(),
            '/queue': (context) => const QueuePage(),
            // '/bottom_view': (context) => const BottomViews(),
            '/register': (context) => const Register(),
            '/register_queue': (context) => const SuccessQueue(),
            '/account': (context) => const AccountPage(),
            '/history': (context) => const HistoryPage(),
            '/success_cancel': (context) => const SuccessCancel(),
            '/edit_user': (context) => EditUser(),
            '/change_gender': (context) => const ChangeGender(),
            '/edit_password': (context) => EditPassword(),
            '/verify_phone': (context) => const VerifyPhone(),
            '/verify_reset': (context) => const VerifyReset(),
            '/forgot_password': (context) => const ForgotPassword(),
            '/reset_input_password': (context) => const ResetInputPassword(),
          },
        );
      },
      child: const Splashscreen(),
    );
  }
}
