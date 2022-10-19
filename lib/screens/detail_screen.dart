import 'package:flutter/material.dart';
import 'package:general_informative_app/services/world_states_services.dart';
import 'package:general_informative_app/widgets/reUseable_row.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.capital,
      required this.time,
      required this.languages,
      required this.currencies,
      required this.area,
      required this.population,
      required this.native,
      required this.callingcode,
      required this.region,
      required this.subregion,
      required this.lat,
      required this.lang})
      : super(key: key);
  final String name, image, capital, time;
  final String languages, currencies, area, population, native;
  final String callingcode, region, subregion, lat, lang;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    WorldStateServices worldStateServices = WorldStateServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15,
                )
              ]),
              child: Image(
                image: NetworkImage(widget.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                widget.name,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.005,
              left: 15,
              right: 15,
            ),
            child: Column(
              children: [
                const Divider(thickness: 3,),
                ReUseAbleRow(value: widget.capital.toString(),
                    title: 'Capital', icon: Icons.location_city_outlined),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.currencies.toString(),
                    title: 'Currencies', icon: Icons.money),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.time.toString(),
                    title: 'Time Zone', icon: Icons.schedule),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.languages.toString(),
                    title: 'Languages', icon: Icons.language),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.population.toString(),
                    title: 'Population', icon: Icons.public),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.area.toString(),
                    title: 'Area', icon: Icons.area_chart),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.callingcode.toString(),
                    title: 'Calling Code', icon: Icons.phone),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.region.toString(),
                    title: 'Region', icon: Icons.south_america),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.subregion.toString(),
                    title: 'Sub-Region', icon: Icons.south_america),
                const Divider(
                  thickness: 3,
                ),
                ReUseAbleRow(value: widget.lat.toString(),
                    title: 'Lat-Lng', icon: Icons.open_in_full),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.028),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(widget.lang,
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                  ),
                ),
                const Divider(
                  thickness: 3,

                ),



              ],
            ),)
          ],
        ),
      ),
    );
  }
}
