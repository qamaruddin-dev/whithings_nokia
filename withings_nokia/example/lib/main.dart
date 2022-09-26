import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:withings_nokia/constants/api_constants.dart';
import 'package:withings_nokia/models/withings_activity_model.dart';
import 'package:withings_nokia/models/withings_sleep_model.dart';
import 'package:withings_nokia/withings_nokia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WithingsHealthExample(),
    );
  }
}

class WithingsHealthExample extends StatefulWidget {
  const WithingsHealthExample({Key? key}) : super(key: key);

  @override
  State<WithingsHealthExample> createState() => _WithingsHealthExampleState();
}

class _WithingsHealthExampleState extends State<WithingsHealthExample> {
  //Data Models for Activity and Sleep Data
  static const String withingClientID =
      'cf9b703fa359f61343d6bd5ca3fc8f14325064514a6200bdcca898e1866c6843';

  // Withings Client Secret
  static const String withingClientSecret =
      'fec79c88c882d4b947f62e975688a7eb03a09a228959963f41f058ce7bf6d026';

  /// Auth Uri, you can replace "withingsnokia with your app name"

  static const String withingRedirectUri = 'withingsnokia://withings/auth';

  /// Callback scheme
  static const String withingCallbackScheme = 'withingsnokia';
  WithingsHealth healthFactory = WithingsHealth();
  late WithingsDataModel _withingActivityData;
  late WithingsSleepData _withingSleepData;
  late String? userId;
  late String? accessToken;
  late String? refreshToken;
  // Variables used to show data
  double calories = 0, distance = 0;
  int duration = 0, sleep = 0, caloriesLeft = 0;
  int goalSleep = 0, stepCount = 0, totalCalories = 0;
  int floors = 0;

  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  late String formattedDate;
// Method to set Activity Data state
  setActivityData(WithingsDataModel _activityData) {
    _activityData.body!.activities!.forEach((element) {
      calories = calories + element.calories!.toDouble();

      // Distance in Meters
      distance = distance + element.distance!.toDouble();

      //Distance in Miles if needed
      //distance = distance / 1000 * 0.62137;
      totalCalories = totalCalories + element.totalcalories!.toInt();

      stepCount = stepCount + element.steps!.toInt();
      floors = floors + element.elevation!.toInt();
      duration = duration + element.active!.toInt();
    });
    setState(() {
      calories;
      distance;
      totalCalories;
      stepCount;
      floors;
      duration;
    });
  }

// Method to set Activity Data state
  setSleepData(WithingsSleepData _sleepData) {
    _sleepData.body!.series!.forEach((element) {
      sleep = sleep + element.data!.asleepduration!.toInt();
      goalSleep = goalSleep + element.data!.durationtosleep!.toInt();
      setState(() {
        sleep;
        goalSleep;
      });
    });
  }

  GetAuthData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userWithing');
    accessToken = prefs.getString('accessTokenWithing');
    refreshToken = prefs.getString('refreshTokenWithing');
  }

  @override
  void initState() {
    super.initState();
    formattedDate = formatter.format(now);
    print(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Withings Health Mate")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () async {
                  userId = await healthFactory.withingsLogin(
                      withingsClientID: withingClientID,
                      withingClientSecret: withingClientSecret,
                      withingRedirectUri: withingRedirectUri,
                      scopes: Strings.scopes,
                      withingCallbackScheme: withingCallbackScheme);
                },
                child: Text("Connect Withings Health Mate")),
            Divider(),
            ElevatedButton(
                onPressed: () async {
                  _withingActivityData =
                      await healthFactory.getWithingsActivityData(
                          startDate: formattedDate, endDate: formattedDate);
                  setActivityData(_withingActivityData);
                },
                child: Text("Get Activity Data")),
            Text("Calories: $calories"),
            Text("Distance:$distance"),
            Text("StepCount: $stepCount"),
            Text("Duration:$duration"),
            Divider(),
            ElevatedButton(
                onPressed: () async {
                  _withingSleepData = await healthFactory.getWithingsSleepData(
                      startDate: formattedDate, endDate: formattedDate);
                  setSleepData(_withingSleepData);
                },
                child: Text("Get Sleep Data")),
            Text("Sleep Time: $sleep"),
            Text("Goal Sleep Time:$goalSleep"),
            Divider(),
            ElevatedButton(
                onPressed: () {
                  GetAuthData();
                },
                child: Text("Get Auth Data")),
          ],
        ),
      ),
    );
  }
}
