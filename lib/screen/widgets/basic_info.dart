import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather.dart';

import '../../helper/dio_service.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateBasicInfo = Provider.of<DioState>((context), listen: true);
    return FutureBuilder<WeatherModel>(
      future: stateBasicInfo.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(
                snapshot.data!.name.toString() +
                    '\t' +
                    '  ${snapshot.data!.sys!.country.toString()}',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.amber),
              ),
              Text(
                snapshot.data!.weather!.first.main.toString(),
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.amber),
              )
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
