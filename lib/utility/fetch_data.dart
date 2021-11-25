import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

const api = 'https://api.quarantine.country/api/v1/summary/latest';

class DataFromApi {
  Future fetchData() async {
    var numberOfCases = ['0', '0', '0']; //infected, deaths, recovered
    var formatter = NumberFormat(',000');

    var url = Uri.parse(api);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var dataPath = decodedData['data']['summary'];

      numberOfCases[0] = formatter.format(dataPath['active_cases']);
      numberOfCases[1] = formatter.format(dataPath['deaths']);
      numberOfCases[2] = formatter.format(dataPath['recovered']);
    } else {
      throw (response.statusCode);
    }

    return numberOfCases;
  }
}
