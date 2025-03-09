import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_widget/custom_textstyle.dart';
import '../../../core/theme.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onMenuTap;
  final int selectedIndex;

  const CustomDrawer({super.key, required this.onMenuTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: customColor.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              /// Drawer Header with User Info
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.white),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/akshay.jpg'),
                      ),
                      const SizedBox(height: 10),
                      Text("Akshay Panika", style: textStyle20(context, color: Colors.black)),
                      Text("App Developer", style: textStyle14(context, color: Colors.black)),
                    ],
                  ),
                ),
              ),

              /// Dashboard
              _drawerItem(context, icon: Icons.dashboard, title: 'Dashboard',
                isSelected: selectedIndex == 0,
                onTap: () {
                  onMenuTap(0);
                  Navigator.pop(context);
                },
              ),

              /// Employees
              ExpansionTile(
                shape: InputBorder.none,
                title: Text('Employees',style: textStyle14(context,)),
                leading: const Icon(Icons.person),
                iconColor: Colors.black,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textWidget(context, text: 'Employees List',
                    onTap: () {onMenuTap(1);Navigator.pop(context);},
                    isSelected: selectedIndex == 1,),
                  _textWidget(context, text: 'Employees Leader'),
                  _textWidget(context, text: 'Others'),
                ],
              ),
            ],
          ),

          /// Settings & Logout
          Column(
            children: [
              const Divider(),
              _drawerItem(context, icon: Icons.settings, title: "Settings", onTap: () {},),
              _drawerItem(
                context, icon: Icons.logout, title: "Log Out", onTap: () {},),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  /// Reusable ListTile for Menu Items
  Widget _drawerItem(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap, bool isSelected = false}) {
    return ListTile(
      leading: Icon(icon,),
      title: Text(title, style: textStyle14(context,)),
      onTap: onTap,
    );
  }

  /// Reusable Text Widget
  Widget _textWidget(BuildContext context, {required String text, VoidCallback? onTap, bool isSelected = false}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: isSelected ? Colors.blue : Colors.black54),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
