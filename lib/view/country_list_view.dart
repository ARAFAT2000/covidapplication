
import 'package:covidapplication/model/CountryListModel.dart';
import 'package:covidapplication/services/allservices.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'country_details_view.dart';


class CountryListView extends StatefulWidget {
  const CountryListView({super.key});

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {

  AllServices _allServices= AllServices();


  late List<CountryListModel> _allCountriesList;
  late List<CountryListModel> _filteredCountriesList;
  late TextEditingController _searchController;


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _allCountriesList = [];
    _filteredCountriesList = [];
    fetchCountriesList();
  }


  void fetchCountriesList() async {
    List<CountryListModel> countriesList = await _allServices.CountryList();
    setState(() {
      _allCountriesList = countriesList;
      _filteredCountriesList = countriesList;
    });
  }

  void filterCountriesList(String query) {
    List<CountryListModel> filteredList = _allCountriesList
        .where((country) =>
        country.country!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredCountriesList = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
            child: TextFormField(
              onChanged: (value) => filterCountriesList(value),
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search with country name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredCountriesList.isEmpty
                ? const ShimmerEffect()
                : ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredCountriesList.length,
              itemBuilder: (_, index) {
                CountryListModel country = _filteredCountriesList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                DetailScreen(country: country)));
                  },
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        elevation: 8.0,
                        child: ListTile(
                          title: Text(country.country.toString()),
                          subtitle: Text(country.cases.toString()),
                          leading: Image(
                            height: 50,
                            width: 50,
                            image: NetworkImage(
                                country.countryInfo!.flag.toString()),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade700,
          highlightColor: Colors.grey.shade100,
          child: ListTile(
            leading: Container(
              height: 50,
              width: 89,
              color: Colors.white,
            ),
            title: Container(
              height: 10,
              width: 89,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 10,
              width: 89,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
