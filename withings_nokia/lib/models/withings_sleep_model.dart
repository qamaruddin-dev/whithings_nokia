class WithingsSleepData {
  int? status;
  Body? body;

  WithingsSleepData({this.status, this.body});

  WithingsSleepData.fromJson(Map<String, dynamic> json) {
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
  List<Series>? series;
  bool? more;
  int? offset;

  Body({this.series, this.more, this.offset});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['series'] != null) {
      series = <Series>[];
      json['series'].forEach((v) {
        series!.add(new Series.fromJson(v));
      });
    }
    more = json['more'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.series != null) {
      data['series'] = this.series!.map((v) => v.toJson()).toList();
    }
    data['more'] = this.more;
    data['offset'] = this.offset;
    return data;
  }
}

class Series {
  String? timezone;
  int? model;
  int? modelId;
  int? startdate;
  int? enddate;
  String? date;
  int? created;
  int? modified;
  Data? data;

  Series(
      {this.timezone,
      this.model,
      this.modelId,
      this.startdate,
      this.enddate,
      this.date,
      this.created,
      this.modified,
      this.data});

  Series.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    model = json['model'];
    modelId = json['model_id'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    date = json['date'];
    created = json['created'];
    modified = json['modified'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timezone'] = this.timezone;
    data['model'] = this.model;
    data['model_id'] = this.modelId;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['date'] = this.date;
    data['created'] = this.created;
    data['modified'] = this.modified;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? apneaHypopneaIndex;
  int? asleepduration;
  int? breathingDisturbancesIntensity;
  int? deepsleepduration;
  int? durationtosleep;
  int? durationtowakeup;
  int? hrAverage;
  int? hrMax;
  int? hrMin;
  int? lightsleepduration;
  int? nbRemEpisodes;
  List? nightEvents;
  int? outOfBedCount;
  int? remsleepduration;
  int? rrAverage;
  int? rrMax;
  int? rrMin;
  int? sleepEfficiency;
  int? sleepLatency;
  int? sleepScore;
  int? snoring;
  int? snoringepisodecount;
  int? totalSleepTime;
  int? totalTimeinbed;
  int? wakeupLatency;
  int? wakeupcount;
  int? wakeupduration;
  int? waso;

  Data(
      {this.apneaHypopneaIndex,
      this.asleepduration,
      this.breathingDisturbancesIntensity,
      this.deepsleepduration,
      this.durationtosleep,
      this.durationtowakeup,
      this.hrAverage,
      this.hrMax,
      this.hrMin,
      this.lightsleepduration,
      this.nbRemEpisodes,
      this.nightEvents,
      this.outOfBedCount,
      this.remsleepduration,
      this.rrAverage,
      this.rrMax,
      this.rrMin,
      this.sleepEfficiency,
      this.sleepLatency,
      this.sleepScore,
      this.snoring,
      this.snoringepisodecount,
      this.totalSleepTime,
      this.totalTimeinbed,
      this.wakeupLatency,
      this.wakeupcount,
      this.wakeupduration,
      this.waso});

  Data.fromJson(Map<String, dynamic> json) {
    apneaHypopneaIndex = json['apnea_hypopnea_index'];
    asleepduration = json['asleepduration'];
    breathingDisturbancesIntensity = json['breathing_disturbances_intensity'];
    deepsleepduration = json['deepsleepduration'];
    durationtosleep = json['durationtosleep'];
    durationtowakeup = json['durationtowakeup'];
    hrAverage = json['hr_average'];
    hrMax = json['hr_max'];
    hrMin = json['hr_min'];
    lightsleepduration = json['lightsleepduration'];
    nbRemEpisodes = json['nb_rem_episodes'];
    if (json['night_events'] != null) {
      nightEvents = [];
      json['night_events'].forEach((v) {
        nightEvents!.add(v);
      });
    }
    outOfBedCount = json['out_of_bed_count'];
    remsleepduration = json['remsleepduration'];
    rrAverage = json['rr_average'];
    rrMax = json['rr_max'];
    rrMin = json['rr_min'];
    sleepEfficiency = json['sleep_efficiency'];
    sleepLatency = json['sleep_latency'];
    sleepScore = json['sleep_score'];
    snoring = json['snoring'];
    snoringepisodecount = json['snoringepisodecount'];
    totalSleepTime = json['total_sleep_time'];
    totalTimeinbed = json['total_timeinbed'];
    wakeupLatency = json['wakeup_latency'];
    wakeupcount = json['wakeupcount'];
    wakeupduration = json['wakeupduration'];
    waso = json['waso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apnea_hypopnea_index'] = this.apneaHypopneaIndex;
    data['asleepduration'] = this.asleepduration;
    data['breathing_disturbances_intensity'] =
        this.breathingDisturbancesIntensity;
    data['deepsleepduration'] = this.deepsleepduration;
    data['durationtosleep'] = this.durationtosleep;
    data['durationtowakeup'] = this.durationtowakeup;
    data['hr_average'] = this.hrAverage;
    data['hr_max'] = this.hrMax;
    data['hr_min'] = this.hrMin;
    data['lightsleepduration'] = this.lightsleepduration;
    data['nb_rem_episodes'] = this.nbRemEpisodes;
    if (this.nightEvents != null) {
      data['night_events'] = this.nightEvents!.map((v) => v).toList();
    }
    data['out_of_bed_count'] = this.outOfBedCount;
    data['remsleepduration'] = this.remsleepduration;
    data['rr_average'] = this.rrAverage;
    data['rr_max'] = this.rrMax;
    data['rr_min'] = this.rrMin;
    data['sleep_efficiency'] = this.sleepEfficiency;
    data['sleep_latency'] = this.sleepLatency;
    data['sleep_score'] = this.sleepScore;
    data['snoring'] = this.snoring;
    data['snoringepisodecount'] = this.snoringepisodecount;
    data['total_sleep_time'] = this.totalSleepTime;
    data['total_timeinbed'] = this.totalTimeinbed;
    data['wakeup_latency'] = this.wakeupLatency;
    data['wakeupcount'] = this.wakeupcount;
    data['wakeupduration'] = this.wakeupduration;
    data['waso'] = this.waso;
    return data;
  }
}
