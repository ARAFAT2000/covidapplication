
import 'package:covidapplication/services/allservices.dart';
import 'package:covidapplication/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../model/WorldStateModel.dart';
import '../widget/reusleable.dart';
import 'country_list_view.dart';


class WorldStateView extends StatefulWidget {
  const WorldStateView({super.key});

  @override
  State<WorldStateView> createState() => _WorldStateViewState();
}

class _WorldStateViewState extends State<WorldStateView> {




  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),

    const Color(0xFFFF0000),
  //  const Color(0xfffd79a8),


  ];
  AllServices _allServices = AllServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 70),
          child: Column(
            children: [
                  FutureBuilder(
                      future: _allServices.worldState(),
                      builder: (context,AsyncSnapshot<WorldStateModel> snapshot){
                        if(snapshot.hasData){
                          return Column(
                            children: [
                                 PieChart(
                                     dataMap: <String ,double>{
                                       'Total':double.parse(snapshot.data!.cases.toString()),
                                       'Recovered':double.parse(snapshot.data!.recovered.toString()),
                                       'Deaths':double.parse(snapshot.data!.deaths.toString()),


                                      // 'Active':double.parse(snapshot.data!.active.toString()),

                                     },
                                   chartValuesOptions: ChartValuesOptions(
                                 showChartValuesInPercentage: true
                                   ),
                                   legendOptions: LegendOptions(
                                     legendPosition: LegendPosition.left
                                   ),
                                   chartRadius: MediaQuery.of(context).size.width/2.7,
                                   animationDuration: Duration(microseconds: 1200),
                                   chartType: ChartType.ring,
                                   colorList:colorList ,
                                 ),

                           Padding(
                             padding: EdgeInsets.only(left: 3,top: 20),
                             child: Card(
                               child: Column(
                                 children: [
                                   Reuseable(title: snapshot.data!.cases.toString(),value: "Total", ),
                                   Reuseable(value: "Recovered", title: snapshot.data!.recovered.toString()),
                                   Reuseable(value: "Deaths", title: snapshot.data!.deaths.toString()),
                                   Reuseable(value: "Active", title: snapshot.data!.active.toString()),
                                   Reuseable(value: "Critical", title: snapshot.data!.critical.toString()),

                                 ],
                               ),
                             ),
                           ),

                              SizedBox(
                                height: 20,
                              ),

                         RoundButton(text: 'Track Country', onTap: (){
                           Navigator.push(context,
                               MaterialPageRoute(builder: (context)=>CountryListView()));
                         })

                            ],
                          );
                        }else {
                        return Center(
                            child: SpinKitCircle(
                              color: Colors.black26,
                            ));
                        }
                      })
            ],
          ),
        ),
      ),
    );
  }

}


