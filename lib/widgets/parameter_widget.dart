import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:the_cat_pedia/manager/color_manager.dart';

class ParameterWidget extends StatelessWidget {
  final String title;
  final double param;
  const ParameterWidget({
    super.key,
    required this.title,
    required this.param,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                  //fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: RatingBar.builder(
                ignoreGestures: true,
                initialRating: param,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.rectangle,
                  color: AppColors.primary,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

class Parameter01Widget extends StatelessWidget {
  final String title;
  final double param;
  const Parameter01Widget({
    super.key,
    required this.title,
    required this.param,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: RatingBar.builder(
                ignoreGestures: true,
                initialRating: param,
                minRating: 1,
                allowHalfRating: true,
                itemCount: 1,
                itemBuilder: (context, _) => const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {},
              ),
            )
          ],
        ),
      ],
    );
  }
}
