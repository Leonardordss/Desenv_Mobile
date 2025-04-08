import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardScreen(),
  ));
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Fundo bege (mais terroso)
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[800], // Verde Escuro
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: Text('Opção 1')),
            ListTile(title: Text('Opção 2')),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[800], // Verde Escuro
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.amber), // Amarelo
        centerTitle: true,
        title: Row(
          children: [
            Image.asset('images/senai.png', height: 40),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'App Agro IoT',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.amber),
              ),
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: Colors.brown[100], // Marrom claro
              child: Icon(Icons.person, color: Colors.green[800]), // Verde Escuro
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar ...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          _DashboardButton(

              icon: Icons.analytics_outlined,
              label: 'Monitoramento',
              onTap: () {}),
          SizedBox(height: 10),
          _DashboardButton(
              icon: Icons.settings_remote_outlined,
              label: 'Sistema de controle',
              onTap: () {}),
          SizedBox(height: 10),
          _DashboardButton(
              icon: Icons.smart_toy_outlined, label: 'Chatbot', onTap: () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.amber, // Amarelo
        backgroundColor: Colors.green[800], // Verde Escuro
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _DashboardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DashboardButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
    
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        color: Colors.green[100],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.brown,
                size: 40,
              ),
              SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(fontSize: 18, color: Colors.brown), // Amarelo
              ),
            ],
          ),
        ),
      ),
    );
  }
}
