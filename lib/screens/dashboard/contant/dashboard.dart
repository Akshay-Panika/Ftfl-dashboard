
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/app_widget/custom_hw.dart';
import 'package:ftfl_dashboard/app_widget/dimands.dart';
import '../../../app_widget/custom_container.dart';
import '../../../app_widget/custom_textstyle.dart';
import '../../../core/theme.dart';
import '../widget/clock_view.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Demands demands = Demands(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Headline
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text('Dashboard', style: textStyle16(context),),
        ),

        Expanded(
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: demands.screenWidth > 600 ? Axis.horizontal:Axis.vertical,
            children: [
              Expanded(
                child: Column(
                  children: [
                    20.height,
                    Row(
                      mainAxisAlignment: demands.screenWidth > 600 ? MainAxisAlignment.spaceAround:MainAxisAlignment.spaceAround,
                      children: [
                        _buildCard(demands,context, label: 'Total Employee', value: '00'),
                        _buildCard(demands, context, label: 'In Office', value: '00'),
                        _buildCard(demands, context, label: 'Out Office', value: '00'),
                      ],
                    ),

                    Expanded(
                      child: customContainer(
                        bRadius: demands.screenHeight*0.01,
                        hMargin: demands.screenWidth*0.01, vMargin: demands.screenWidth*0.01,
                        vPadding: demands.screenWidth*0.01,
                        hPadding: demands.screenWidth*0.025,
                        borderColor: customColor.borderColor,
                        shadowColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),

              /// ClockWidget
              ClockWidget(),
              demands.screenWidth>600?20.height:10.height
            ],
          ),
        )

      ],
    );
  }
}

Widget _buildCard(Demands demands,BuildContext context,{String? label, String? value,IconData? icon, VoidCallback? onTap}){
  return   customContainer(
      bRadius: demands.screenHeight*0.01,
      // width: demands.screenWidth > 600 ? demands.screenWidth*0.25:double.infinity,
      hMargin: demands.screenWidth*0.01, vMargin: demands.screenWidth*0.01,
      vPadding: demands.screenWidth*0.005,
      hPadding: demands.screenWidth >600 ? demands.screenWidth*0.015:demands.screenWidth*0.03,
      borderColor: customColor.borderColor,
      shadowColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value!, style: textStyle14(context),),
          Text(label!, style: textStyle12(context),),
        ],
      ));
}