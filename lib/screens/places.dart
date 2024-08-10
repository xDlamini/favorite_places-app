import 'package:fav_places_app/providers/user_places.dart';
import 'package:fav_places_app/screens/add_place.dart';
import 'package:fav_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Xolile's places"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const AddPlaceScreen(),
              ));
            },
          ),
        ],
      ),
      //main content
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlaceList(places: userPlaces),
      ),
    );
  }
}
