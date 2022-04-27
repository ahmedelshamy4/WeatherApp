import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/dio_service.dart';
import 'package:weather_app/feature/widgets/show_weather.dart';
import 'package:weather_app/model/weather.dart';

class WeatherFeature extends StatelessWidget {
  const WeatherFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<DioState>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<WeatherModel>(
        future: state.getData(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const WeatherShow(),
                SizedBox(height: 5.h),

              ],
            ),
          );
        },
      ),
    );
  }
}
