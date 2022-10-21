import 'package:counter_app_getx/constant/route_constant.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../ui/binding/home_binding.dart';
import '../ui/screens/home_screen.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.homeScreen,
      page: () =>  HomeScreen(),
      middlewares:  [
        // Add here
        // AuthGuard(),
      ],
      binding: HomeScreenBinding()),
];