import 'package:apphotel/data/hotel_data.dart';
import 'package:apphotel/ui/_core/app_theme.dart';
import 'package:apphotel/ui/widgets/bag_provider.dart';
import 'package:apphotel/ui/widgets/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HotelData hotelData = HotelData();
  await hotelData.getHotel();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create:(context){
          return hotelData;
        }),
        ChangeNotifierProvider(create: (context)=>BagProvider())
      ],
    
   child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}