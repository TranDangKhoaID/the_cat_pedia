import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_cat_pedia/constants/images_constant.dart';
import 'package:the_cat_pedia/models/breed_model.dart';

class BreedBoxHome extends StatelessWidget {
  const BreedBoxHome({
    super.key,
    required this.breed,
  });

  final BreedModel breed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                child: Image.asset(
                  ImagesConstant.cat,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(5),
            Text(
              breed.name ?? 'No Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Gap(3),
            Row(
              children: [
                Icon(Icons.place_outlined, color: Colors.red),
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
