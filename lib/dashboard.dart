import 'package:flutter/material.dart';
import 'package:ne_first_look/pages/collection_list.dart';
import 'package:ne_first_look/pages/fi_list.dart';
import 'package:toast/toast.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: _dashBody(context),
    );
  }

  Widget _dashBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _dashHeader(),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Collections",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Card(
              elevation: 4.0,
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      /* leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 45.0,
                      child: Row(),
                    ),*/
                      title: Text("Today"),
                      subtitle: Text("10 Collections"),
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: ListTile(
                      /*leading: Container(
                      alignment: Alignment.bottomCenter,
                      width: 45.0,
                      child: Row(),
                    ),*/
                      title: Text("Pending"),
                      subtitle: Text("5 Collections"),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new CollectionList()));
                    },
                    child: _dashTile(
                        color: Colors.amberAccent,
                        icon: Icons.portrait,
                        title: "Collection",
                        data: "10"),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new FIList()));
                    },
                    child: _dashTile(
                        color: Colors.green,
                        icon: Icons.portrait,
                        title: "FI",
                        data: "10"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Toast.show("Completed", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },
                    child: _dashTile(
                        color: Colors.blue,
                        icon: Icons.favorite,
                        title: "Completed",
                        data: "16"),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Toast.show("Rejected", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },
                    child: _dashTile(
                        color: Colors.pink,
                        icon: Icons.priority_high,
                        title: "Rejected",
                        data: "10"),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Toast.show("Pending", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },
                    child: _dashTile(
                        color: Colors.red,
                        icon: Icons.watch_later,
                        title: "Pending",
                        data: "10"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Container _dashHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          color: Colors.teal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text("Dashboard",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            trailing: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage("assets/user.png"),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text("Collector Name",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Jaipur",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Container _dashTile({Color color, IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Text(
            data,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
