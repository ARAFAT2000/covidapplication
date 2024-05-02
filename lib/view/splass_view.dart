import 'package:covidapplication/model/CountryListModel.dart';
import 'package:covidapplication/services/allservices.dart';
import 'package:covidapplication/view/worldstateview.dart';
import 'package:flutter/material.dart';

import '../model/WorldStateModel.dart';


class SplassView extends StatefulWidget {
  const SplassView({super.key});

  @override
  State<SplassView> createState() => _SplassViewState();
}

class _SplassViewState extends State<SplassView> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 7),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WorldStateView()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
         body:const SafeArea(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
             CircleAvatar(
           radius:70,
               backgroundImage: NetworkImage('https://www.unicef.org/bangladesh/sites/unicef.org.bangladesh/files/styles/hero_extended/public/1583952355.1997.jpg.webp?itok=Jg2r3F3T'),
             ),
               SizedBox(height: 50),
                Align(
                 alignment: Alignment.center,
                 child: Text(
                   'Covid-19\nTracker App',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 25,
                       color: Colors.black),
                 ),
               ),
             ],
           ),
         ),
    );
  }
}
