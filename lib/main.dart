import 'package:e_bookwebsitetest/core/constants/constant.dart';
import 'package:e_bookwebsitetest/core/di/dependency_injection.dart';
import 'package:e_bookwebsitetest/core/helpers/cach_helper.dart';
import 'package:e_bookwebsitetest/core/routing/app_router.dart';
import 'package:e_bookwebsitetest/core/routing/routes.dart';
import 'package:e_bookwebsitetest/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  CachHelper.box = await Hive.openBox('e_book');
  setUpGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'e-Book Website',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: getInitialRoute(),
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

String getInitialRoute() {
  if (CachHelper().getData(key: AppConstants.UID_USER_KEY).toString().isEmpty) {
    return Routes.homeScreen;
  } else {
    return Routes.loginScreen;
  }
}
