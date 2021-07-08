import 'package:flutter/material.dart';
import 'package:soccer/goalstat.dart';
import 'package:soccer/matchtile.dart';
import 'package:soccer/teamstat.dart';
import 'soccermodel.dart';

bool mine;
int i, n;

Widget PageBody(List<SoccerMatch> allmatches) {
  for (i = 0; i < allmatches.length; i++) {
    if (allmatches[i].home.name == "Real Madrid" ||
        allmatches[i].away.name == "Real Madrid") {
      mine = true;
      break;
    } else {
      mine = false;
    }
  }
  return Stack(children: [
    Container(
      color: Colors.black,
    ),
//    Positioned.fill(
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(top: 0.0),
//            child: Image.asset(
//              "assets/ramos.jpg",
//            ),
//          ),
//        ],
//      ),
//    ),
    Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
//            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 50.0),
              child: (mine == true)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        teamStat("Local Team", allmatches[i].home.logoUrl,
                            allmatches[i].home.name),
                        goalStat(allmatches[i].fixture.status.elapsedTime,
                            allmatches[i].goal.home, allmatches[i].goal.away),
                        teamStat("Visitor Team", allmatches[i].away.logoUrl,
                            allmatches[i].away.name),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: Image.asset(
                            "assets/real.png",
                            height: 150,
                          ),
                        ),
                        Text(
                          " Real Madrid is not playing ",
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF4373D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Life MATCHES",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allmatches.length,
                      itemBuilder: (context, index) {
                        return matchTile(allmatches[index]);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  ]);
}
