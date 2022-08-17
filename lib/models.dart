import 'dart:convert';
/*


    "forecast": {
        "forecastday": [
            {
                "date": "2022-07-24",
                "date_epoch": 1658620800,
                "day": {
                    "maxtemp_c": 30.9,
                    "maxtemp_f": 87.6,
                    "mintemp_c": 17.7,
                    "mintemp_f": 63.9,
                    "avgtemp_c": 23.6,
                    "avgtemp_f": 74.4,
                    "maxwind_mph": 15.7,
                    "maxwind_kph": 25.2,
                    "totalprecip_mm": 0.0,
                    "totalprecip_in": 0.0,
                    "avgvis_km": 10.0,
                    "avgvis_miles": 6.0,
                    "avghumidity": 52.0,
                    "daily_will_it_rain": 0,
                    "daily_chance_of_rain": 0,
                    "daily_will_it_snow": 0,
                    "daily_chance_of_snow": 0,
                    "condition": {
                        "text": "Partly cloudy",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                        "code": 1003
                    },
                },

            },
            {
                "date": "2022-07-25",
                "date_epoch": 1658707200,
                "day": {
                    "maxtemp_c": 25.2,
                    "maxtemp_f": 77.4,
                    "mintemp_c": 17.7,
                    "mintemp_f": 63.9,
                    "avgtemp_c": 20.8,
                    "avgtemp_f": 69.4,
                    "maxwind_mph": 14.3,
                    "maxwind_kph": 23.0,
                    "totalprecip_mm": 0.1,
                    "totalprecip_in": 0.0,
                    "avgvis_km": 10.0,
                    "avgvis_miles": 6.0,
                    "avghumidity": 60.0,
                    "daily_will_it_rain": 0,
                    "daily_chance_of_rain": 0,
                    "daily_will_it_snow": 0,
                    "daily_chance_of_snow": 0,
                    "condition": {
                        "text": "Partly cloudy",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                        "code": 1003
                    },

                },

            }
        ]
    }
}
*/

//function used to parse temperature info
class TemperatureInfo{
  final double temperature;
  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String,dynamic> json)
  {
    final temperature = json['temp_c'];
    return TemperatureInfo(temperature: temperature);
  }
}
//function used to parse City name info
class CityInfo{
  final String cityName;
  CityInfo({required this.cityName});

  factory CityInfo.fromJson(Map<String,dynamic> json)
  {
    final cityName = json['name'];
    return CityInfo(cityName: cityName);
  }
}

//function used to parse weather description and icons
class weatherCondition{
  final String desc;
  final String icon;

  weatherCondition({required this.desc,required this.icon});
  factory weatherCondition.fromJson(Map<String,dynamic> json)
  {
    final desc =json['text'];
    final icon = json['icon'];
    return weatherCondition(desc: desc, icon: icon);
  }
}
//function to get map -weather icon and desc by sending particular day json
class weatherConditionJson{

  Map<String, dynamic> trial( Map<String, dynamic> json )
  {
    final descJson = json['condition'];
    return descJson;
  }
}
//function used get weather information by parsing json file
class WeatherResponse{

  final CityInfo cityName;
  final TemperatureInfo tempInfo;
  final weatherCondition desc;
  final weatherCondition icon;

  final AvgTempInfo avgTemp;

  final weatherCondition icon1;
  final weatherCondition icon2;
  final weatherCondition icon3;

  WeatherResponse({required this.cityName, required this.tempInfo,required  this.desc,required  this.icon,
    required this.avgTemp,required this.icon1, required this.icon2, required this.icon3});


  factory WeatherResponse.fromJson(Map<String,dynamic> json)
  {
    final cityNameJson= json['location'];
    final cityName = CityInfo.fromJson(cityNameJson);


    final tempInfoJson = json['current'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final tempDescInfoJson = json['current'];

    weatherConditionJson obj = new weatherConditionJson();
    final tempDescInfoJson_1 =  obj.trial(tempDescInfoJson);

    final desc = weatherCondition.fromJson(tempDescInfoJson_1);
    final icon = weatherCondition.fromJson(tempDescInfoJson_1);

    //forecast Info
    ArrayStringfromJson arrayObj = new ArrayStringfromJson();
    List<dynamic> arrayText= arrayObj.MaptoListString(json);
    List<dynamic> arrayForecast = List.from(arrayText);
    final Day1 = arrayForecast[0];
    final Day2 = arrayForecast[1];
    final Day3 = arrayForecast[2];


    final avgTempInfoJson1 = Day1["day"];
    final  avgTempInfoJson2 = Day2["day"];
    final avgTempInfoJson3 = Day3["day"];

    final avgTemp= AvgTempInfo.fromJson(avgTempInfoJson1,avgTempInfoJson2,avgTempInfoJson3);

    //to retrieve condition json data from day
    weatherConditionJson obj1 = new weatherConditionJson();
    final tempDescInfoJson1 =  obj1.trial(Day1["day"]);
    final tempDescInfoJson2 = obj1.trial(Day2["day"]);
    final tempDescInfoJson3 = obj1.trial(Day3["day"]);

    //to retrieve weather icons for 3 days from json
    final icon1 = weatherCondition.fromJson(tempDescInfoJson1);
    final icon2 = weatherCondition.fromJson(tempDescInfoJson2);
    final icon3 = weatherCondition.fromJson(tempDescInfoJson3);

    return WeatherResponse(cityName: cityName,tempInfo: tempInfo,desc: desc, icon: icon,
        avgTemp: avgTemp,icon1: icon1,icon2:icon2,icon3: icon3);
  }
}

// 1st layer filter
class ArrayStringfromJson{
  List<dynamic> MaptoListString ( Map<String, dynamic> json )
  {
    final forecastdayJson = json['forecast'];
    //print('forecast');
    //print(json['forecast']);
    List<dynamic> ListArray = forecastdayJson ['forecastday'];
    return ListArray;
  }
}
//function used to get avg temperature info by parsing
class AvgTempInfo{
  final double temperature1;
  final double temperature2;
  final double temperature3;
  AvgTempInfo({required this.temperature1,required this.temperature2,required this.temperature3});

  factory AvgTempInfo.fromJson(Map<String,dynamic> json1,Map<String,dynamic> json2,Map<String,dynamic> json3)
  {

    final temperature1 = json1['avgtemp_c'];
    final temperature2 = json2['avgtemp_c'];
    final temperature3 = json3['avgtemp_c'];

    return AvgTempInfo(temperature1: temperature1, temperature2: temperature2,temperature3: temperature3);
  }
}
