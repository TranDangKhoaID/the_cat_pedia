import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_cat_pedia/models/breed_model.dart';
import 'package:the_cat_pedia/widgets/cached_network_image.dart';

class BreedBoxHome extends StatelessWidget {
  const BreedBoxHome({
    super.key,
    required this.breed,
    required this.url,
  });

  final BreedModel breed;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetWorkImageWidget(
                    url: url,
                  ),
                ),
              ),
            ),
            const Gap(5),
            Text(
              breed.name ?? 'No Name',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'PlaypenSans',
              ),
            ),
            const Gap(3),
            Row(
              children: [
                const Icon(Icons.place_outlined, color: Colors.red),
                Flexible(
                  child: Text(
                    breed.origin ?? 'No Origin',
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
