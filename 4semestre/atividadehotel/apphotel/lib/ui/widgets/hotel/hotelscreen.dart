import 'package:apphotel/model/dish.dart';
import 'package:apphotel/model/hotel.dart';
import 'package:apphotel/ui/_core/app_colors.dart';
import 'package:apphotel/ui/_core/appbar.dart';
import 'package:apphotel/ui/widgets/bag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hotelscreen extends StatelessWidget {
  final Hotel hotel;
  const Hotelscreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context,title: hotel.name),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/${hotel.imagePath}',width: 128,),
            SizedBox(height: 12,),
            Text('Mais reservados',
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,fontWeight: FontWeight.bold
            ),),

            Column(
              children: List.generate(hotel.dishes.length, (index){
                Dish dish = hotel.dishes[index];
                return ListTile(
                  leading: Image.asset('assets/dishes/default.png',
                  width: 48,height: 48,),
                  title: Text(dish.name),
                  subtitle: Text('R\$${dish.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    
                    onPressed: (){
                      context.read<BagProvider>().addAllDishes([dish]);
                    }, icon: Icon(Icons.add)),
                );
              })
            )
          ],
        ),
      ),
    );
  }
}