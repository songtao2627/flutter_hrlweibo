import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'pages/splash_page.dart';
import 'routers/routers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Routes.router = router;

    return Container(
      child: MaterialApp(
          title: "HRL微博",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          onGenerateRoute: Routes.router.generator,
          home: SplashPage()),
    );
  }
}
