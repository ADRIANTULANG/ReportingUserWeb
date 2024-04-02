import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responderuserweb/services/location_services.dart';

class WeatherController extends GetxController {
  RxString weatherDescription = "".obs;
  RxDouble temperatureKelvin = 0.0.obs;
  RxDouble temperatureCelsius = 0.00.obs;
  RxDouble pressure = 0.0.obs;
  RxDouble humidity = 0.0.obs;
  RxDouble windSpeed = 0.0.obs;

  getWeatherDetails() async {
    try {
      var uri =
          'https://api.openweathermap.org/data/2.5/weather?lat=${Get.find<LocationServices>().locationData!.latitude}&lon=${Get.find<LocationServices>().locationData!.longitude}&appid=67a96ca939095cc12748c226c7d3851c';

      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        weatherDescription.value = data['weather'][0]['description'].toString();
        temperatureKelvin.value = double.parse(data['main']['temp'].toString());
        temperatureCelsius.value =
            double.parse((temperatureKelvin - 273.15).toString());
        pressure.value = double.parse(data['main']['pressure']);
        humidity.value = double.parse(data['main']['humidity'].toString());
        windSpeed.value = double.parse(data['wind']['speed'].toString());
      } else {}
    } catch (_) {}
  }

  @override
  void onInit() {
    getWeatherDetails();
    super.onInit();
  }
}
