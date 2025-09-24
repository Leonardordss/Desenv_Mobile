import 'dart:convert'; // biblioteca para trabalhar com json
import 'package:apphotel/model/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // biblioteca para criar os widgets do flutter

class HotelData extends ChangeNotifier{
  // Cria uma lista para carregar os restaurantes
  List<Hotel> _listHotel=[];
  List<Hotel> get listHotel=> _listHotel;

  Future<List<Hotel>> getHotel()async{

    if(_listHotel.isNotEmpty){
      return _listHotel; // Evita recarregar se já tiver carregado uma vez
    }

    try{
      final String jsonString = await rootBundle.loadString('assets/data.json');
      final Map<String,dynamic> data= json.decode(jsonString);
      final List<dynamic> HotelData = data['hoteis'];

      _listHotel.addAll(
       HotelData.map((e)=>Hotel.fromMap(e)).toList()

      );
      notifyListeners(); // notifica caso esteja utilizando provider
    } catch(e){
      debugPrint('Erro ao carregar hoteis: $e');
    }

    return _listHotel;
  }


}
