import 'package:currency_converter/controllers/currency_controller.dart';
import 'package:currency_converter/models/currency_model.dart';
import 'package:currency_converter/utils/check_connictivity.dart';
import 'package:currency_converter/views/common/snac_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrencyConvertAPI {
  CurrencyConvertAPI._();

  static final CurrencyConvertAPI currencyConvertAPI = CurrencyConvertAPI._();

  Future<Currency?> getData({required CurrencyController controller}) async {
    Dio dio = Dio();
   
    String url =
        "https://api.exchangerate.host/convert?from=${controller.fromCurrency}&to=${controller.toCurrency}&amount=${controller.amount}";
    if (await checkConnectivityNow()) {
      Response res = await dio.get(url);
      try {
        if (res.statusCode == 200) {
          Currency currencyConvert = Currency.fromJSON(data: res.data);
          return currencyConvert;
        } else {
          snackBar(
              icon: const Icon(Icons.error),
              title: 'Error',
              subTitle: 'There is wrong ,Try again please!');
        }
      } catch (e) {
        snackBar(icon: const Icon(Icons.error), title: 'Error', subTitle: e);
      }
    }
  }
}
