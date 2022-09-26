library withings_nokia;

import 'package:shared_preferences/shared_preferences.dart';
import 'constants/api_constants.dart';
import 'models/withings_activity_model.dart';
import 'models/withings_sleep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import '../constants/api_constants.dart';
import '../models/withings_activity_model.dart';
import '../models/withings_auth_model.dart';
import '../models/withings_sleep_model.dart';

class WithingsHealth {
  String baseUrl = 'https://wbsapi.withings.net';

  Future<String> WithingsLogin(
      {required String withingsClientID,
      required String withingClientSecret,
      required String withingRedirectUri,
      required String scopes,
      required String withingCallbackScheme}) async {
    late String userID;
    try {
      var url =
          'https://account.withings.com/oauth2_user/authorize2?response_type=code&client_id=$withingsClientID&redirect_uri=$withingRedirectUri&state=1&scope=$scopes';
      final result = await FlutterWebAuth.authenticate(
          url: url, callbackUrlScheme: withingCallbackScheme);
      final code = Uri.parse(result).queryParameters['code'];
      print("Withing Auth Result" + result);
      Dio dio = new Dio();
      FormData formdata = new FormData();

      formdata = FormData.fromMap({
        "action": "requesttoken",
        "client_id": withingsClientID,
        "client_secret": withingClientSecret,
        "grant_type": "authorization_code",
        "code": code,
        "redirect_uri": withingRedirectUri
      });

      var response = await dio.post(
        '$baseUrl/v2/oauth2',
        onSendProgress: (int sent, int total) {},
        data: formdata,
        options: Options(
            method: 'POST',
            responseType: ResponseType.json // or ResponseType.JSON
            ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        WithingsAuth data = WithingsAuth.fromJson(response.data);
        final accessToken = data.body!.accessToken as String;
        final refreshToken = data.body!.refreshToken as String;
        userID = data.body!.userid as String;
        print("Withings Access Token:" + refreshToken);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userWithing', userID);
        await prefs.setString('accessTokenWithing', accessToken);
        await prefs.setString('refreshTokenWithing', refreshToken);
      } else {
        throw Exception("An Error Occured");
      }
    } catch (ex) {
      print(ex);
    }
    return userID;
  }

/****************************Get Data*************************/
  Future<WithingsDataModel> GetWithingsActivityData(
      {required String startDate, required String endDate}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? withingToken = prefs.getString('accessTokenWithing');

    Dio dio = Dio();
    Response response;
    WithingsDataModel _withingDataModel;

    FormData formdata = new FormData();

    formdata = FormData.fromMap({
      "action": "getactivity",
      "data_fields": Strings.withingActivityDataFields,
      "startdateymd": startDate,
      "enddateymd": endDate,
    });

    response = await dio.post('$baseUrl/v2/measure',
        onSendProgress: (int sent, int total) {},
        data: formdata,
        options: Options(headers: {
          'authorization': 'Bearer $withingToken',
          'accept': 'application/json'
        }));

    if (response.statusCode == 200) {
      print("Withings Response Data:" + response.data.toString());
      _withingDataModel = WithingsDataModel.fromJson(response.data);
      return _withingDataModel;
    } else
      throw Exception("Error Fetching Data");
  }

  Future<WithingsSleepData> GetWithingsSleepData(
      {required String startDate, required String endDate}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? withingToken = prefs.getString('accessTokenWithing');

    Dio dio = Dio();
    Response response;

    WithingsSleepData _withingSleepData;

    FormData formdata = new FormData();

    formdata = FormData.fromMap({
      "action": "getsummary",
      "data_fields": Strings.withingSleepDataFields,
      "startdateymd": startDate,
      "enddateymd": endDate,
    });

    response = await dio.post('${Strings.withingBaseUrl}/v2/sleep',
        onSendProgress: (int sent, int total) {},
        data: formdata,
        options: Options(headers: {
          'authorization': 'Bearer $withingToken',
          'accept': 'application/json'
        }));

    if (response.statusCode == 200) {
      print("Withings Sleep Response Data:" + response.data.toString());
      _withingSleepData = WithingsSleepData.fromJson(response.data);
      return _withingSleepData;
    } else {
      throw Exception("Error Fetching Data");
    }
  }
}
