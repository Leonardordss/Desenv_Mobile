import 'package:apphotel/model/hotel.dart';
import 'package:apphotel/ui/widgets/hotel/hotelscreen.dart';
import 'package:flutter/material.dart';

class HotelWidget extends StatelessWidget {
  final Hotel hotel;
  const HotelWidget({super.key,required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              // criar a classe hotel screen
              return Hotelscreen(hotel: hotel);

            }));
        },
        child: Row(
          children: [
            Image.asset('assets/${hotel.imagePath}',width: 72,),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(hotel.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Row(
                  children: List.generate(hotel.stars.toInt(), (index){
                    return Image.asset('assets/others/star.png',width: 16,);
                  }),
                ),
                Text('${hotel.distance} Km')

              ],
            )
          ],
        ),
      ),
    );
  }
}