import 'package:flutter/material.dart';
import 'house.dart';
import 'housesApi.dart';
import 'viewHouse.dart';

class houses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gatata Plot Rentals App'),
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
          return ListView.builder(
            itemCount: snapshot.data.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              HousesModel house = snapshot.data[index];

              return Card(
                margin: EdgeInsets.fromLTRB(20.0, 30, 20.0, 0.0),
                color: Colors.orange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Container(
                    //   child: Text(
                    //     house.houseNumber,
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   child: RaisedButton(
                    //     color: Colors.blue,
                    //     child: Text(
                    //       house.househousePrice,
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       print('${house.id}');
                    //     },
                    //   ),
                    // ),

                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                        size: 40.0,
                      ),
                      title: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => viewHouse(
                              // house: house.id,
                              houseNumber: house.houseNumber,
                              housePrice: house.housePrice,
                            ),
                          ));
                        },
                        child: Text(
                          house.houseNumber,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        'Rent : ' + house.housePrice + 'kshs',
                        // '${house.housePrice}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => viewHouse(
                            // house: house.id,
                            houseNumber: house.houseNumber,
                            housePrice: house.housePrice,
                          ),
                        ));

                        // Navigator.pushNamed(context, '/viewHouse/' house.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
          // return Text(snapshot.data.houseNumber);
        } else if (snapshot.hasError) {
          return CircularProgressIndicator();
          // return Text("${snapshot.error}");
        }
        // return CircularProgressIndicator();
      },
    ),
  );
}
