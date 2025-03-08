import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/custom_widget/custom_hw.dart';
import '../../../custom_widget/custom_textstyle.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                 color: Colors.white
                ),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/akshay.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text("Akshay Panika", style: textStyle20(color: Colors.black),),
                      Text("App Developer", style: textStyle14(color: Colors.black),),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard", style: textStyle14()),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person_add),
                title: Text("Employee", style: textStyle14()),
                onTap: () {},
              ),
            ],
          ),


          Column(
            children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings", style: textStyle14()),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out", style: textStyle14()),
                onTap: () {},
              ),
              50.height
            ],
          )
        ],
      ),
    );
  }
}