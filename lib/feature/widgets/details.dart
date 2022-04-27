import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../helper/dio_service.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioState>((context), listen: true);

    return StreamBuilder<WeatherModel>(
      stream: state.getData().asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final double MintempCelcius = snapshot.data!.main!.tempMin! - 273.4;
          final double MaxtempCelcius = snapshot.data!.main!.tempMax! - 273.4;
          return Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(
                    radius: 50.0,
                    percent: snapshot.data!.main!.humidity!.toDouble() / 100,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Humdidity"),
                        Text(snapshot.data!.main!.humidity!.toString() + '%'),
                      ],
                    ),
                    progressColor: Colors.amber,
                  ),
                  CircularPercentIndicator(
                    radius: 50.0,
                    percent: snapshot.data!.clouds!.all!.toDouble() / 100,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Clouds"),
                        Text(snapshot.data!.clouds!.all!.toDouble().toString() +
                            '%'),
                      ],
                    ),
                    progressColor: Colors.amber,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text("Wind Speed"),
                      SizedBox(height: 2.h),
                      Image.asset(
                        "assets/images/anemometer.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 2.h),
                      Text(snapshot.data!.wind!.speed.toString() + "km/h")
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Pressure"),
                      SizedBox(height: 2.h),
                      Image.asset(
                        "assets/images/pressuregauge.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(snapshot.data!.wind!.speed.toString() + "hpa")
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text("Minimum Temp"),
                      SizedBox(height: 2.h),
                      Image.asset(
                        "assets/images/low.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        MintempCelcius.toStringAsFixed(0) + "C",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w100,
                            color: Colors.amber),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Maximum Temp"),
                      SizedBox(height: 2.h),
                      Image.asset(
                        "assets/images/high.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        MaxtempCelcius.toStringAsFixed(0) + "C",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w100,
                            color: Colors.amber),
                      )
                    ],
                  ),

                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const Text('something went wrong please check it');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
