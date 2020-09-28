

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckAllPermission extends StatefulWidget {
  @override
  _CheckAllPermissionState createState() => _CheckAllPermissionState();
}

class _CheckAllPermissionState extends State<CheckAllPermission> {
  List<Item> list = List<Item>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initList();
  }

  void initList() {
    list.clear();
    for (var i = 0; i < PermissionGroup.values.length; i++) {
      list.add(Item(PermissionGroup.values[i], PermissionStatus.denied));
    }
    resolveState();
  }

  void resolveState() {
    for (var index = 0; index < PermissionGroup.values.length; index++) {
      Future<PermissionStatus> status =PermissionHandler().checkPermissionStatus(list[index].group);
      status.then((PermissionStatus status){
        setState(() {
          list[index].status=status;
        });
      }
     );
    }
  }

  permissionItem(int index) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(index.toString()),
        ),
        title: Text(list[index].group.toString()),
        subtitle: (list[index].status != null)
            ? Text(
          list[index].status.toString(),
          style: statusColors(index),
        )
            : null,
        onTap: () {
          print(index);
          requestPermission(index);
        },
      ),
    );
  }

  statusColors(int index) {
    switch (list[index].status) {
      case PermissionStatus.granted:
        return TextStyle(color: Colors.green);
      case PermissionStatus.denied:
        return TextStyle(color: Colors.red);
        break;  
      case PermissionStatus.restricted:
        return TextStyle(color: Colors.red);
        break;
      case PermissionStatus.unknown:
        return TextStyle(color: Colors.red);
        break;
      default:
    }
  }


  Future requestPermission(int index) async {
    PermissionHandler().requestPermissions([list[index].group]);
    initList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
          "Permission List",
          style: TextStyle(color: Colors.white), ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                initList();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                PermissionHandler().openAppSettings();
              },
            ),
          ],
          ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return permissionItem(index);
        },
      ),
    );
  }

}


class Item {
  PermissionGroup group;
  PermissionStatus status;
  Item(this.group, this.status);
}