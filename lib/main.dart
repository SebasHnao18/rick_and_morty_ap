// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/characters_screen.dart';
import 'package:rick_and_morty_app/episodes_screen.dart';
import 'package:rick_and_morty_app/locations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Rick and Morty'),
        '/charactersScreen': (context) => CharactersScreen(),
        '/locationsScreen': (context) => LocationsScreen(),
        '/EpisodesScreen': (context) => EpisodesScreen(),
      },
      title: 'Rick and Morty App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  Text("Personajes", style: TextStyle(fontSize: 16)),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/charactersScreen');
                        },
                      icon: Icon( Icons.person, size: 50,)),
                ]),
                SizedBox(height: 10),
                Column(children: [
                  Text("Ubicaciiones", style: TextStyle(fontSize: 16)),
                  IconButton(
                      onPressed: () {
                         Navigator.pushNamed(context, '/locationsScreen'); 
                      },
                      icon: Icon(
                        Icons.location_on,
                        size: 50,
                      )),
                ]),
                SizedBox(height: 10),
                Column(children: [
                  Text("Episodios", style: TextStyle(fontSize: 16)),
                  IconButton(
                      onPressed: () {
                         Navigator.pushNamed(context, '/EpisodesScreen'); 
                      },
                      icon: Icon(
                        Icons.info,
                        size: 50,
                      )),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
