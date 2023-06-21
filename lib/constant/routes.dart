import 'package:currency_converter/constant/app_routes.dart';
import 'package:currency_converter/views/screens/home/home_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name:AppRoute.home, page: () => HomePage()),
];