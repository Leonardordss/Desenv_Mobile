import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.01),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF001F5B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: screenWidth * 0.1),
                    Text(
                      'BitDogLab',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.04),
                      child: Icon(
                        Icons.wifi,
                        color: Colors.white,
                        size: screenWidth * 0.06,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsets.all(screenWidth * 0.05),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A5C8A),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildButton('A', Colors.red, screenWidth, screenHeight),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: _buildButton('B', Colors.blue, screenWidth, screenHeight),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    _buildButton('C', Color(0xFF001F5B), screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.025),
                    _buildButtonWithIcon(
                      'Buzzer',
                      Colors.grey.shade600,
                      Icons.volume_up,
                      screenWidth,
                      screenHeight,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Row(
                      children: [
                        Expanded(
                          child: _buildButton('Liga', Color(0xFF001F5B), screenWidth, screenHeight),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: _buildButton('Desliga', Colors.red, screenWidth, screenHeight),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    //
                    // QUADRADOS de TEMPERATURA e UMIDADE
                    //
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: screenHeight * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(15),
                            ),
                              child: Center(
                                child: Text('Temperatura',
                                style: TextStyle(color:Colors.white,fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold,),)
                              )
                            ),
                          ),
                        
                        SizedBox(width: screenWidth * 0.04),
                        Expanded(
                          child: Container(
                            height: screenHeight * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: Text('Umidade',
                                style: TextStyle(color:Colors.white,fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold,),)
                              )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, Color color, double screenWidth, double screenHeight) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08,
          vertical: screenHeight * 0.018,
        ),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          fontSize: screenWidth * 0.055,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildButtonWithIcon(String label, Color color, IconData icon, double screenWidth, double screenHeight) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08,
          vertical: screenHeight * 0.018,
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.055,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Icon(
            icon,
            color: Colors.white,
            size: screenWidth * 0.06,
          ),
        ],
      ),
    );
  }
}
