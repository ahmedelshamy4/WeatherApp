import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'helper/dio_service.dart';
import 'screen/weather_feature.dart';

void main() {
  WidgetsFlutterBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: ((BuildContext context) => ChangeNotifierProvider(
            create: (context) => DioState(),
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: WeatherFeature(),
              ),
            ),
          )),
      designSize: const Size(360, 800),
    );
  }
}
