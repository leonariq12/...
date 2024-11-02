import 'package:flutter/material.dart';
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_headset.dart' as headset;
import './hal_smartphone.dart' as hp;
import './login_screen.dart'; // Import the login screen

void main() {
  runApp(
    MaterialApp(
      title: "Tab Bar",
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const Home(),
      },
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent, // New color
        title: const Text(
          'Web Galeri',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'logout') {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          komputer.Komputer(),
          headset.Headset(),
          radio.AgendaScreen(),
          hp.Smartphone(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent, // Matching color
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: const Icon(Icons.home, size: 28),
              text: 'Home',
            ),
            Tab(
              icon: const Icon(Icons.info, size: 28),
              text: 'Info',
            ),
            Tab(
              icon: const Icon(Icons.event, size: 28),
              text: 'Agenda',
            ),
            Tab(
              icon: const Icon(Icons.filter, size: 28),
              text: 'Gallery',
            ),
          ],
          labelColor: Colors.white, // Label color for selected tab
          unselectedLabelColor: Colors.white54, // Color for unselected tabs
        ),
      ),
    );
  }
}
