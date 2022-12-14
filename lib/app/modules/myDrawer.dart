import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_mobile/app/modules/homePage.dart';

class ohMyDrawer extends StatefulWidget {
  const ohMyDrawer({super.key});

  @override
  State<ohMyDrawer> createState() => _ohMyDrawerState();
}

class _ohMyDrawerState extends State<ohMyDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Center(
            child: Image.asset("assets/LCR.png"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageView()));
          },
        )
      ],
    );
  }
}
