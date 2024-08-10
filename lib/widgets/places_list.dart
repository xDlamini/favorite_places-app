import 'package:fav_places_app/models/place.dart';
import 'package:fav_places_app/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No places added yet'),
      );
    }

    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.background),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => PlaceDetailsScreen(place: places[index]),
              ));
            }));
  }
}
