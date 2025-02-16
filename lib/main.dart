import 'package:firebase_core/firebase_core.dart';
import 'package:firebasechat/core/services/db_services.dart';
import 'package:firebasechat/core/utils/route_utils.dart';
import 'package:firebasechat/firebase_options.dart';
import 'package:firebasechat/ui/screens/other/user_provider.dart';
import 'package:firebasechat/ui/screens/splashscreens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => UserProvider(dbServices()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteUtils.onGenerateRoute,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
