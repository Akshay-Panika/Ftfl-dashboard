
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/custom_widget/custom_hw.dart';
import '../../custom_widget/custom_colors.dart';
import '../../custom_widget/custom_textstyle.dart';
import 'contant/dashboard.dart';
import 'contant/drawer.dart';
import 'contant/emoloyee.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Dashboard(),
    Employee(),
  ];

  void _onMenuTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.backColor,

      /// Appbar
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        shape: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.5)),
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "FTFL Technology",
            style: textStyle20(color: Colors.blue.shade900),
          ),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Akshay Panika",
                style: textStyle12(fontWeight: FontWeight.w600),
              ),
              Text(
                "App Developer",
                style: textStyle14(fontWeight: FontWeight.w600, color: Colors.grey),
              ),
            ],
          ),
          10.width,
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/akshay.jpg'),
          ),
          50.width
        ],
      ),

      drawer: screenWidth.width > 500 ? null : CustomDrawer(),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Side Menu
          screenWidth.width > 500
              ? Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(right: BorderSide(color: Colors.grey, width: 0.5))),
              child:  Column(
                children: [
                  ExpansionTile(shape: InputBorder.none,
                    title: Text('Dashboard',),
                    leading: Icon(Icons.dashboard),
                    iconColor: Colors.black,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    onExpansionChanged: (value) =>  _onMenuTap(0),
                  ),
                  ExpansionTile(shape: InputBorder.none,
                    title: Text('Employees',),
                    leading: Icon(Icons.person),
                    iconColor: Colors.black,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textWidget(context,text: 'Employees list',onTap: () => _onMenuTap(1),),
                      _textWidget(context,text: 'Employees Leader'),
                      _textWidget(context,text: 'Others'),
                    ],
                  ),
                ],
              ),
            ),
          )
              : SizedBox(),

          /// Main Content
          Expanded(
            flex: 5,
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
Widget _textWidget(BuildContext context, {String? text,  VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(text!, style: TextStyle(fontSize: 16, color: Colors.black54),textAlign: TextAlign.start,),
    ),
  );
}