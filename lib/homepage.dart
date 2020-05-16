import 'dart:convert';

import 'package:covid19_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response = await http
        .get('https://disease.sh/v2/countries/India?yesterday=0&strict=false');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Tracker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20.0),
              color: Colors.orange[100],
              height: 80.0,
              child: Text(
                'when it rains look for rainbow, \n when it\'s dark look for stars',
                style: TextStyle(
                  color: Colors.orange[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                'Country: INDIA',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(
                    worldData: worldData,
                  ),
          ],
        ),
      ),
    );
  }
}
