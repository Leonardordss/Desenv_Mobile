import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Aula 08',
      theme: ThemeData(
        //
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App Aula 08'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    
        title: Text(widget.title),
      ),
      body: Center(
   
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Stack(
              alignment: Alignment.center,
              children: [
               Container(width: 300, height: 100,color: Colors.green,),
               Container(width: 280,height: 80,color: Colors.white,
               child: Text("MOBILE",textAlign: TextAlign.center,
               style: TextStyle(
                color: Colors.green,
                decoration: TextDecoration.none),),
               ),
              ],
            ),
              SizedBox(
            height: 80,
          ),
            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(width: 60,height: 60,color: Colors.green,child: Text("", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white))),
             Container(width: 60,height: 60,color: Colors.green,child: Text("", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white))),
             Container(width: 60,height: 60,color: Colors.green,child: Text("", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white))),
            ],
            
          ),
              SizedBox(
            height: 80,
          ),
           Stack(
              alignment: Alignment.center,
              children: [
               Container(width: 300, height: 100,color: Colors.green,),
               Container(width: 280,height: 80,color: Colors.white,
               child: Text("LEONARDO",textAlign: TextAlign.center,
               style: TextStyle(
                color: Colors.green,
                decoration: TextDecoration.none),),
               ),
              ],
            ),
            
          ],
        ),
      ),

    );
  }
}
