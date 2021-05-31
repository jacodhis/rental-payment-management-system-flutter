import 'package:flutter/material.dart';

import 'housesApi.dart';

import 'package:tim_example/models/houseModelApi.dart';
import 'package:tim_example/navbar-drawer.dart';
import 'package:http/http.dart' as http;

class houses extends StatefulWidget {
  @override
  _housesState createState() => _housesState();
}

class _housesState extends State<houses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gatata Houses'),
      ),
      body: housesWidget(),
    );
  }
}

Widget housesWidget() {
  return Container(
    child: FutureBuilder(
      future: getHouse(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: databody(snapshot.data),
                ),
              ),
            ],
          );
          // return Text(snapshot.data.houseNumber);
        } else if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return CircularProgressIndicator();
      },
    ),
  );
}

databody(List<HousesModel> getHouse) {
  return DataTable(
    columns: [
      DataColumn(label: Text('Tenant')),
      // DataColumn(label: Text('Id')),
      DataColumn(label: Text('house  Number')),
      DataColumn(label: Text('house Price')),
    ],
    rows:
        getHouse // Loops through dataColumnText, each iteration assigning the value to element
            .map(
              ((element) => DataRow(
                    cells: <DataCell>[
                      DataCell(
                        // UserName(element.user_id),
                        Text(element.user.name),
                      ),

                      // DataCell(Text(element.id.toString())),
                      DataCell(Text(element
                          .houseNumber)), //Extracting from Map element the value
                      DataCell(Text(element.houseNumber)),
                    ],
                  )),
            )
            .toList(),
  );

  // return Container(
  //   child: Column(
  //     children: [
  //       for (var item in getHouse) Text(item.housePrice.toString()),
  //     ],
  //   ),
  // );
}
