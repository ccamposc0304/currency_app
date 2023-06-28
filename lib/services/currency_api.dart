import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:currency_app/models/currency_response.dart';

/**
 * Api obtenida de https://docs.coincap.io/
 */

class CurrencyApi {
  final String host = 'api.coincap.io';
  final String url = '/v2/';

  Future<CurrencyResponse?> getCurrency() async {
    var idCurrency = 'costa-rican-colón';
    try {
      final response =
          await http.get(Uri.https(host, '${url}rates/${idCurrency}')).timeout(Duration(seconds: 15));

      if (response.statusCode == 200) {
        var rs = currencyResponseFromJson(response.body);
        return rs;
      } else
        throw Exception();
    } catch (e) {
      return null;
    }
  }
}
