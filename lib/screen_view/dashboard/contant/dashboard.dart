
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/custom_widget/custom_hw.dart';
import '../../../custom_widget/custom_container.dart';
import '../../../custom_widget/custom_text_padding.dart';
import '../../../custom_widget/custom_textstyle.dart';
import '../widget/clock_view.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textPaddingWidget(
          text: 'Dashboard',
          textStyle: textStyle20(color: Colors.black),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                       // margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('00', style: textStyle22(fontWeight: FontWeight.w600),),
                            Text('Total Employees', style: textStyle14(),),
                          ],
                        ),
                      ),
                      CustomContainer(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('00', style: textStyle22(fontWeight: FontWeight.w600),),
                            Text('Total Employees In Office', style: textStyle14(),),
                          ],
                        ),
                      ),
                      CustomContainer(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('00', style: textStyle22(fontWeight: FontWeight.w600),),
                            Text('Total Employees Out Office', style: textStyle14(),),
                          ],
                        ),
                      ),
                    ],
                  ),

                  20.height,
                  CustomContainer(
                    height: 400,
                    padding: EdgeInsets.all(20),
                     margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                  ),
                ],
              ),
            ),


            /// Clock
            ClockWidget(),
            40.width,

          ],
        ),

      ],
    );
  }
}
