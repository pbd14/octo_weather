import 'package:auto_route/auto_route.dart';
import 'package:weather/Screens/MainScreen/main_screen.dart';


// flutter packages pub run build_runner build 
@MaterialAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(page: MainScreen, initial: true),              
    // AutoRoute(page: HomeScreen, path: 'home'),
    // AutoRoute(page: FavouritesScreen, path: 'favourites'), 
    // AutoRoute(page: CourseDetailScreen, path: 'courses/detail'),              
  ],              
) 
class $AppRouter {}              