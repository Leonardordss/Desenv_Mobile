import 'package:appdeliverytb/data/categories_data.dart';
import 'package:appdeliverytb/data/restaurant_data.dart';
import 'package:appdeliverytb/model/restaurant.dart';
import 'package:appdeliverytb/ui/_core/app_colors.dart';
import 'package:appdeliverytb/ui/widgets/home/widgets/category_widget.dart';
import 'package:appdeliverytb/ui/widgets/home/widgets/restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appdeliverytb/ui/widgets/splash/splash_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("App Delivery"),
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
                    restaurantData.listRestaurant.length,
                    (index) {
                      Restaurant restaurant =
                          restaurantData.listRestaurant[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index ==
                                  restaurantData.listRestaurant.length - 1
                              ? 0
                              : 16,
                        ),
                        child: RestaurantWidget(restaurant: restaurant),
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