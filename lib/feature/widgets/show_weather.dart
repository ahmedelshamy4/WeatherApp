import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:weather_app/model/weather.dart';
import '../../controller/dio_service.dart';

class WeatherShow extends StatelessWidget {
  const WeatherShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioState>((context), listen: true);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.lightBlue,
            Colors.white,
          ],
        ),
      ),
      child: StreamBuilder<WeatherModel>(
        stream: state.getData().asStream(),
        builder: (context, snapshot) {
          final double tempCelcius = snapshot.data!.main!.temp! - 273.4;
          final icon = snapshot.data!.weather!.first.icon;

          if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          tempCelcius.toString().substring(0, 2),
                          style: TextStyle(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.w900,
                              color: Colors.amber),
                        ),
                        Column(
                          children: [
                            Text(
                              "\u00b0",
                              style: TextStyle(
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            const Text("")
                          ],
                        ),
                        Text(
                          "C",
                          style: TextStyle(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.amber),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        Image.network(
                          "http://openweathermap.org/img/wn/$icon@2x.png",
                          width: 80,
                          height: 80,
                        ),
                      ],
                    )
                  ],
                ),

                SfLinearGauge(
                  minimum: -10,
                  maximum: 60,
                  ranges: const [
                    LinearGaugeRange(
                      startValue: -10,
                      endValue: 0,
                      color: Colors.purple,
                    ),
                    LinearGaugeRange(
                      startValue: 0,
                      endValue: 20,
                      color: Colors.deepPurple,
                    ),
                    LinearGaugeRange(
                      startValue: 20,
                      endValue: 30,
                      color: Colors.blue,
                    ),
                    LinearGaugeRange(
                      startValue: 30,
                      endValue: 40,
                      color: Colors.lightBlue,
                    ),
                    LinearGaugeRange(
                      startValue: 40,
                      endValue: 50,
                      color: Colors.orange,
                    ),
                    LinearGaugeRange(
                      startValue: 50,
                      endValue: 60,
                      color: Colors.red,
                    ),
                  ],
                  markerPointers: [LinearShapePointer(value: tempCelcius)],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('something went wrong please check it');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
