import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

const api = 'https://covid19.ddc.moph.go.th/api/Cases/today-cases-all';

class DataFromApi {
  Future fetchData() async {
    var numberOfCases = ['0', '0', '0']; //infected, deaths, recovered
    var formatter = NumberFormat(',000');

    var url = Uri.parse(api);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var dataPath = decodedData;

      numberOfCases[0] = formatter.format(dataPath[0]['total_case']);
      numberOfCases[1] = formatter.format(dataPath[0]['total_death']);
      numberOfCases[2] = formatter.format(dataPath[0]['total_recovered']);
    } else {
      throw (response.statusCode);
    }

    return numberOfCases;
  }
}
