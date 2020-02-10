import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kAPIKey = '17c7d7bc3e2290f6a84d92a4fce8c3a2';

const kSearchTextFiledDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Search for a city',
  hintStyle: TextStyle(color: Colors.blueGrey),
);

const kERRORJSON = {
  "coord": {"lon": 139, "lat": 35},
  "weather": [
    {"id": 803, "main": "Clouds", "description": "broken clouds", "icon": "04n"}
  ],
  "base": "stations",
  "main": {
    "temp": 240.372,
    "feels_like": 269.72,
    "temp_min": 270.93,
    "temp_max": 274.82,
    "pressure": 1031,
    "humidity": 53
  },
  "wind": {"speed": 0.89, "deg": 45, "gust": 1.34},
  "clouds": {"all": 78},
  "dt": 1581022370,
  "sys": {
    "type": 3,
    "id": 2003105,
    "country": "JP",
    "sunrise": 1581025133,
    "sunset": 1581063438
  },
  "timezone": 32400,
  "id": 1851632,
  "name": "Error",
  "cod": 200
};
