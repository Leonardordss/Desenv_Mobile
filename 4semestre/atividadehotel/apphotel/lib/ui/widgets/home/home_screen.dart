import 'package:apphotel/data/categories_data.dart';
import 'package:apphotel/data/hotel_data.dart';
import 'package:apphotel/model/hotel.dart';
import 'package:apphotel/ui/_core/app_colors.dart';
import 'package:apphotel/ui/widgets/home/widgets/category_widget.dart';
import 'package:apphotel/ui/widgets/home/widgets/hotel_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apphotel/ui/widgets/splash/splash_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HotelData hotelData = Provider.of<HotelData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("S&M Hotel"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Volta para a tela de Splash (logout)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
              );
            },
            tooltip: 'Logout',
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/logo.png', width: 147),
                SizedBox(height: 32),
                Text('Boas vindas !'),
                SizedBox(height: 32),
                Text('Escolha por categoria'),
                SizedBox(height: 32),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      CategoriesData.listCategories.length,
                      (index) {
                        return CategoryWidget(
                          category: CategoriesData.listCategories[index],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Image.asset('assets/banners/banner_promo.png'),
                SizedBox(height: 8),
                Text(
                  'Bem avaliados',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
                Column(
                  children: List.generate(
                    hotelData.listHotel.length,
                    (index) {
                      Hotel hotel =
                          hotelData.listHotel[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index ==
                                  hotelData.listHotel.length - 1
                              ? 0
                              : 16,
                        ),
                        child: HotelWidget(hotel: hotel),
                      );
                    },
                  ),
                ),
                SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}