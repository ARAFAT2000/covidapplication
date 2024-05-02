import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/CountryListModel.dart';
import '../widget/reusleable.dart';

class DetailScreen extends StatefulWidget {
  final CountryListModel country;

  const DetailScreen({Key? key, required this.country}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late CountryListModel _country;

  @override
  void initState() {
    // TODO: implement initState
    _country = widget.country;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_country.country.toString()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.height * .067),
        
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
                    elevation: 5.0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Reuseable(
                            title: 'Total Cases',
                            value: _country.cases.toString()),
                        Reuseable(
                            title: 'Recovered',
                            value: _country.recovered.toString()),
                        Reuseable(
                            title: 'Deaths', value: _country.deaths.toString()),
                        Reuseable(
                            title: 'Today Cases',
                            value: _country.todayCases.toString()),
                        Reuseable(
                            title: 'Today Recovered',
                            value: _country.todayRecovered.toString()),
                        Reuseable(
                            title: 'Today Deaths',
                            value: _country.todayDeaths.toString())
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundImage:
                  NetworkImage(_country.countryInfo!.flag.toString()),
                  radius: 50,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}