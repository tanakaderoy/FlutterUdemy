import 'dart:convert';
import 'package:bitcoin_ticker/CoinAPIResponse.dart';
import 'package:http/http.dart' as http;

final kAPIKEY = 'E722701D-F0A2-41C7-B972-AF737A241DFC';

class CoinAPI{
String baseURL = 'rest.coinapi.io';
String basePath = '/v1/exchangerate';
Future<CoinAPIResponse> getExchangeRate(String from, String to) async{
  Uri url = Uri(
      scheme: 'https',
      host: baseURL,
      path: '$basePath/$from/$to',
    );
  Map<String,String> header = {"X-CoinAPI-Key":kAPIKEY};
  http.Response response = await http.get(url, headers: header);
  String data = response.body;
  Map<String, dynamic> coinMap = jsonDecode(data);
  CoinAPIResponse coinAPIResponse = CoinAPIResponse.fromJson(coinMap);
  return coinAPIResponse;
}
}