import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_cat_pedia/controllers/breed_controller.dart';
import 'package:the_cat_pedia/models/breed_model.dart';
import 'package:the_cat_pedia/pages/cat_screen.dart';

class BreedNameDelegate extends SearchDelegate {
  final BreedController breedController;
  BreedNameDelegate(this.breedController) : super();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<BreedModel> filteredBreeds = breedController.breeds
        .where(
            (breed) => breed.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredBreeds.length,
      itemBuilder: (context, index) {
        final result = filteredBreeds[index];
        return ListTileSearch(
          result: result,
          index: index,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<BreedModel> filteredBreeds = breedController.breeds
        .where(
            (breed) => breed.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredBreeds.length,
      itemBuilder: (context, index) {
        final result = filteredBreeds[index];
        return ListTileSearch(
          result: result,
          index: index,
        );
      },
    );
  }
}

class ListTileSearch extends StatelessWidget {
  const ListTileSearch({
    super.key,
    required this.result,
    required this.index,
  });

  final BreedModel result;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(
        () => CatScreen(
          breed: result,
          index: index,
        ),
      ),
      title: Text(result.name ?? "NULL"),
      subtitle: Text(result.origin ?? "NULL"),
    );
  }
}
