import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red[800],
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[800],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[200],
            textColor: Colors.green[900],
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATH',
            panelColor: Colors.grey[700],
            textColor: Colors.grey[200],
            count: worldData['deaths'].toString(),
          ),
          StatusPanel(
            title: 'Today\'s active',
            panelColor: Colors.green[700],
            textColor: Colors.green[100],
            count: worldData['todayCases'].toString(),
          ),
          StatusPanel(
            title: 'Today\'s deaths',
            panelColor: Colors.black,
            textColor: Colors.grey[200],
            count: worldData['todayDeaths'].toString(),
          ),
          StatusPanel(
            title: 'Population',
            panelColor: Colors.yellow,
            textColor: Colors.black,
            count: worldData['population'].toString(),
          ),
          StatusPanel(
            title: 'Tests',
            panelColor: Colors.pink,
            textColor: Colors.white,
            count: worldData['tests'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 80.0,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
