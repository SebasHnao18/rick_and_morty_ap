// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class EpisodesScreen extends StatefulWidget {
  @override
  _EpisodesScreenState createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  List<dynamic> episodes = [];

  @override
  void initState() {
    super.initState();
    fetchEpisodes();
  }

  Future<void> fetchEpisodes() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        episodes = data['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty Episodios'),
      ),
      body: ListView.builder(
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          final character = episodes[index];
          return ListTile(
            title: Text(character['name']),
            subtitle: Text('Episodio: ${character['episode']}'),
          );
        },
      ),
    );
  }
}