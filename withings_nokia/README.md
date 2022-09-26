# Withings Health Plugin 

Enables reading data from Withings Public health Api.

This plugin supports:

- getting logged in to access health data using the `WithingsLogin` method.
- reading Activity data using the `getWithingsActivityData` method.
- reading Sleep data using the `getWithingsSleepData` method.

## Support

This plugin supports both IOS and Android 

- For android, proper configurations should be done for "flutter_web_auth" to redirect back to the app after successful login.

## Data Types

### User.Activity
#### steps
> Number of steps.

#### distance
> Distance travelled (in meters).

#### elevation
> Number of floors climbed.

#### soft
> Duration of soft activities (in seconds).

#### moderate
> Duration of moderate activities (in seconds).

#### intense
> Duration of intense activities (in seconds).

#### active
> Sum of intense and moderate activity durations (in seconds).

#### calories
> Active calories burned (in Kcal). Calculated by mixing fine granularity calories estimation, workouts estimated calories and calories manually set by the user.

#### totalcalories
> Total calories burned (in Kcal). Obtained by adding active calories and passive calories.

#### hr_average
> Average heart rate.

#### hr_min
> Minimal heart rate.

#### hr_max
> Maximal heart rate.

#### hr_zone_0
> Duration in seconds when heart rate was in a light zone.

#### hr_zone_1
> Duration in seconds when heart rate was in a moderate zone.

#### hr_zone_2
> Duration in seconds when heart rate was in an intense zone.

#### hr_zone_3
> Duration in seconds when heart rate was in maximal zone.


### User.Sleep

#### nb_rem_episodes
> Count of the REM sleep phases.

#### sleep_efficiency
> Ratio of the total sleep time over the time spent in bed.

#### sleep_latency
> Time spent in bed before falling asleep.

#### total_sleep_time
> Total time spent asleep. Sum of light, deep and rem durations.

#### total_timeinbed
> Total time spent in bed.

#### wakeup_latency
> Time spent in bed after waking up.

#### waso
> Time spent awake in bed after falling asleep for the 1st time during the night.


### Sleep apnea and breathing disturbances

#### apnea_hypopnea_index
> Medical grade AHI. Only available for devices purchased in Europe and Australia, with the sleep apnea detection feature activated. Average number of hypopnea and apnea episodes per hour, that occured during sleep time.

#### breathing_disturbances_intensity
> Wellness metric, available for all Sleep and Sleep Analyzer devices. Intensity of breathing disturbances


### Other sleep datapoints and vitals

#### asleepduration
> Duration of sleep when night comes from external source (light, deep and rem sleep durations are null in this case).

#### deepsleepduration
> Duration in state deep sleep (in seconds).

#### durationtosleep
> Time to sleep (in seconds). (deprecated)

#### durationtowakeup
> Time to wake up (in seconds). (deprecated)

#### hr_average
> Average heart rate.

#### hr_max
> Maximal heart rate.

#### hr_min
> Minimal heart rate.

#### lightsleepduration
> Duration in state light sleep (in seconds).

#### night_events
> Events list happened during the night

#### out_of_bed_count
> Number of times the user got out of bed during the night.

#### remsleepduration
> Duration in state REM sleep (in seconds).

#### rr_average
> Average respiration rate.

#### rr_max
> Maximal respiration rate.

#### rr_min
> Minimal respiration rate.

#### sleep_score
> Sleep score

#### snoring
> Total snoring time

#### snoringepisodecount
> Numbers of snoring episodes of at least one minute

#### wakeupcount
> Number of times the user woke up while in bed. Does not include the number of times the user got out of bed.

#### wakeupduration
> Time spent awake (in seconds).


## Setup

Step 1: Register an Application on developer.withings.com 
Note: Redirect Url is important as it would be used to navigate back to app after successful login.
Example: "yourappname://withings/auth"

Step 2: get clientId and secretKey

Below is a simplified flow of how to use the plugin.

```dart

   static const String withingClientID =
      'YOUR_CLIENT_ID';

  // Withings Client Secret
  static const String withingClientSecret =
      'YOUR_SECRET_KEY';

  /// Auth Redirect Uri, 
    //Example testapp://withings/auth
  static const String withingRedirectUri = 'REDIRECT_URI_PROVIDED_AT_TIME_OF_REGISTRATION';

  /// Callback scheme
  static const String withingCallbackScheme = 'CALLBACK_SCHEME_PROVIDED_IN_MANIFEST'; 
  
  //create healthFactory to use methods
  WithingsHealth healthFactory = WithingsHealth();
  
  //To Access activity and sleep Data
  late WithingsDataModel _withingActivityData;
  late WithingsSleepData _withingSleepData;


  //Sample to show activity data
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

    // Sample to show Sleep Data
    _sleepData.body!.series!.forEach((element) {
      sleep = sleep + element.data!.asleepduration!.toInt();
      goalSleep = goalSleep + element.data!.durationtosleep!.toInt();
      });
```
