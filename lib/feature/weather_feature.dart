import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/helper/dio_service.dart';
import 'package:weather_app/feature/widgets/basic_info.dart';
import 'package:weather_app/feature/widgets/details.dart';
import 'package:weather_app/feature/widgets/search_bar.dart';
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
                const BasicInfo(),
                SizedBox(height: 5.h),
                const SearchBar(),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const Details(),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.lightBlue),
                  child: Center(
                      child: Text(
                    "Powered By Ahmed Elshamy",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  )),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
