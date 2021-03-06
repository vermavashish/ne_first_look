import 'package:flutter/material.dart';
import 'package:ne_first_look/pages/user_detail.dart';

class CollectionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: PendingList(),
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PendingList extends StatefulWidget {
  @override
  State createState() => PendingListState();
}

class PendingListState extends State<PendingList> {
  final _items = List<String>.generate(20, (i) => "User ${i + 1}");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.0))),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.group),
                  text: 'Today',
                ),
                Tab(
                  icon: Icon(Icons.group),
                  text: 'Week',
                ),
                Tab(
                  icon: Icon(Icons.group),
                  text: 'Month',
                ),
              ],
            ),
            title: Text('Collection'),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  //final String item = _items[index];
                  return ListTile(
                    title: Center(
                      child: Text('${_items[index]}'),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new User()));
                    },
                  );
                },
              ),
              Center(
                child: Text("Week"),
              ),
              Center(
                child: Text("Month"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
