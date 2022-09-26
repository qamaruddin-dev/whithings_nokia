class WithingsDataModel {
  int? status;
  Body? body;

  WithingsDataModel({this.status, this.body});

  WithingsDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  List<Activities>? activities;
  bool? more;
  int? offset;

  Body({this.activities, this.more, this.offset});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['activities'] != null) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(new Activities.fromJson(v));
      });
    }
    more = json['more'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activities != null) {
      data['activities'] = this.activities!.map((v) => v.toJson()).toList();
    }
    data['more'] = this.more;
    data['offset'] = this.offset;
    return data;
  }
}

class Activities {
  int? steps;
  double? distance;
  int? elevation;
  int? soft;
  int? moderate;
  int? intense;
  int? active;
  double? calories;
  double? totalcalories;
  int? hrAverage;
  int? hrMin;
  int? hrMax;
  int? hrZone0;
  int? hrZone1;
  int? hrZone2;
  int? hrZone3;
  var deviceid;
  var hashDeviceid;
  String? timezone;
  String? date;
  int? modified;
  int? brand;
  bool? isTracker;

  Activities(
      {this.steps,
      this.distance,
      this.elevation,
      this.soft,
      this.moderate,
      this.intense,
      this.active,
      this.calories,
      this.totalcalories,
      this.hrAverage,
      this.hrMin,
      this.hrMax,
      this.hrZone0,
      this.hrZone1,
      this.hrZone2,
      this.hrZone3,
      this.deviceid,
      this.hashDeviceid,
      this.timezone,
      this.date,
      this.modified,
      this.brand,
      this.isTracker});

  Activities.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    distance = json['distance'];
    elevation = json['elevation'];
    soft = json['soft'];
    moderate = json['moderate'];
    intense = json['intense'];
    active = json['active'];
    calories = json['calories'];
    totalcalories = json['totalcalories'];
    hrAverage = json['hr_average'];
    hrMin = json['hr_min'];
    hrMax = json['hr_max'];
    hrZone0 = json['hr_zone_0'];
    hrZone1 = json['hr_zone_1'];
    hrZone2 = json['hr_zone_2'];
    hrZone3 = json['hr_zone_3'];
    deviceid = json['deviceid'];
    hashDeviceid = json['hash_deviceid'];
    timezone = json['timezone'];
    date = json['date'];
    modified = json['modified'];
    brand = json['brand'];
    isTracker = json['is_tracker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['steps'] = this.steps;
    data['distance'] = this.distance;
    data['elevation'] = this.elevation;
    data['soft'] = this.soft;
    data['moderate'] = this.moderate;
    data['intense'] = this.intense;
    data['active'] = this.active;
    data['calories'] = this.calories;
    data['totalcalories'] = this.totalcalories;
    data['hr_average'] = this.hrAverage;
    data['hr_min'] = this.hrMin;
    data['hr_max'] = this.hrMax;
    data['hr_zone_0'] = this.hrZone0;
    data['hr_zone_1'] = this.hrZone1;
    data['hr_zone_2'] = this.hrZone2;
    data['hr_zone_3'] = this.hrZone3;
    data['deviceid'] = this.deviceid;
    data['hash_deviceid'] = this.hashDeviceid;
    data['timezone'] = this.timezone;
    data['date'] = this.date;
    data['modified'] = this.modified;
    data['brand'] = this.brand;
    data['is_tracker'] = this.isTracker;
    return data;
  }
}
