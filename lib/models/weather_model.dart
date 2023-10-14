class WeatherModel{
   String date;
   double temp;
   double minTemp;
   double maxTemp;
   String weatherStateName;
   String icon;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStateName,
    required this.icon
    });

  factory WeatherModel.fromJson(dynamic data){
    var jsondata = data['forecast']['forecastday'][0];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsondata['day']['avgtemp_c'],
        minTemp: jsondata['day']['mintemp_c'],
        maxTemp: jsondata['day']['maxtemp_c'],
        weatherStateName: jsondata['day']['condition']['text'],
        icon: jsondata['hour'][0]['condition']['icon']);

  }

  @override
  String toString() {
    return "temp = $temp , mintemp = $minTemp , maxtemp = $maxTemp , date = $date";
  }
}