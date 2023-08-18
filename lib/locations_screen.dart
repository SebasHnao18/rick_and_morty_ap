// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationsScreen extends StatefulWidget {
  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  List<dynamic> locactions = [];

  @override
  void initState() {
    super.initState();
    fetchLocactions();
  }

  Future<void> fetchLocactions() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        locactions = data['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty Ubicaciones'),
      ),
      body: ListView.builder(
        itemCount: locactions.length,
        itemBuilder: (context, index) {
          final ubiaciones = locactions[index];
          return ListTile(
            title: Text(ubiaciones['name']),
            subtitle: Text('Tipo: ${ubiaciones['type']}'),
          );
        },
      ),
    );
  }
}