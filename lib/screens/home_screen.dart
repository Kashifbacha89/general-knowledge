import 'package:flutter/material.dart';
import 'package:general_informative_app/screens/detail_screen.dart';
import 'package:general_informative_app/services/world_states_services.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WorldStateServices worldStateServices = WorldStateServices();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //===========================Search TextField=============================================
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blue.shade900,
                          ))),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: worldStateServices.worldRecords(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            //====================================fancy ShimmerEffect=============================================
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade900,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      height: 10,
                                      width: 90,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: 90,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 10,
                                      width: 90,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['name'].toString();
                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, right: 10, left: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              color: Colors.grey.shade800,
                                            ),
                                          ]),
                                      child: ListTile(
                                        title:
                                            Text(snapshot.data![index]['name']),
                                        leading: Image(
                                          height: 45,
                                          width: 45,
                                          image: NetworkImage(snapshot
                                              .data![index]['flags']['png']),
                                        ),
                                        //=========================Navigate To Another Screen======================================
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => DetailScreen(
                                                        image: snapshot
                                                                .data![index]
                                                            ['flags']['png'],
                                                        name: snapshot
                                                                .data![index]
                                                            ['name'],
                                                        capital: snapshot
                                                                .data![index]
                                                            ['capital'],
                                                        time: snapshot
                                                                .data![index]
                                                            ['timezones'][0],
                                                        currencies: snapshot
                                                                        .data![
                                                                    index]
                                                                ['currencies']
                                                            [0]['name'],
                                                        languages: snapshot
                                                                        .data![
                                                                    index]
                                                                ['languages'][0]
                                                            ['name'],
                                                        population: snapshot
                                                            .data![index]
                                                                ['population']
                                                            .toString(),
                                                        area: snapshot
                                                            .data![index]
                                                                ['area']
                                                            .toString(),
                                                        native: snapshot
                                                            .data![index]
                                                                ['nativeName']
                                                            .toString(),
                                                        region: snapshot
                                                                .data![index]
                                                            ['region'],
                                                        subregion: snapshot
                                                                .data![index]
                                                            ['subregion'],
                                                        callingcode: snapshot
                                                            .data![index]
                                                                ['callingCodes']
                                                                [0]
                                                            .toString(),
                                                        lat: snapshot
                                                            .data![index]
                                                                ['latlng'][0]
                                                            .toString(),
                                                        lang: snapshot
                                                            .data![index]
                                                                ['latlng'][1]
                                                            .toString(),
                                                      )));
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return   Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, right: 10, left: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              color: Colors.grey.shade800,
                                            ),
                                          ]),
                                      child: ListTile(
                                        title:
                                        Text(snapshot.data![index]['name']),
                                        leading: Image(
                                          height: 45,
                                          width: 45,
                                          image: NetworkImage(snapshot
                                              .data![index]['flags']['png']),
                                        ),
                                        //=========================Navigate To Another Screen======================================
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => DetailScreen(
                                                    image: snapshot
                                                        .data![index]
                                                    ['flags']['png'],
                                                    name: snapshot
                                                        .data![index]
                                                    ['name'],
                                                    capital: snapshot
                                                        .data![index]
                                                    ['capital'],
                                                    time: snapshot
                                                        .data![index]
                                                    ['timezones'][0],
                                                    currencies: snapshot
                                                        .data![
                                                    index]
                                                    ['currencies']
                                                    [0]['name'],
                                                    languages: snapshot
                                                        .data![
                                                    index]
                                                    ['languages'][0]
                                                    ['name'],
                                                    population: snapshot
                                                        .data![index]
                                                    ['population']
                                                        .toString(),
                                                    area: snapshot
                                                        .data![index]
                                                    ['area']
                                                        .toString(),
                                                    native: snapshot
                                                        .data![index]
                                                    ['nativeName']
                                                        .toString(),
                                                    region: snapshot
                                                        .data![index]
                                                    ['region'],
                                                    subregion: snapshot
                                                        .data![index]
                                                    ['subregion'],
                                                    callingcode: snapshot
                                                        .data![index]
                                                    ['callingCodes']
                                                    [0]
                                                        .toString(),
                                                    lat: snapshot
                                                        .data![index]
                                                    ['latlng'][0]
                                                        .toString(),
                                                    lang: snapshot
                                                        .data![index]
                                                    ['latlng'][1]
                                                        .toString(),
                                                  )));
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
