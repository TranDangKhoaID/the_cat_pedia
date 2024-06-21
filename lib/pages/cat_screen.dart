import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_cat_pedia/controllers/detail_breed_controller.dart';
import 'package:the_cat_pedia/heplers/admob_hepler.dart';
import 'package:the_cat_pedia/manager/color_manager.dart';
import 'package:the_cat_pedia/models/breed_model.dart';
import 'package:the_cat_pedia/widgets/parameter_widget.dart';

class CatScreen extends StatefulWidget {
  final int index;
  final BreedModel breed;
  const CatScreen({super.key, required this.breed, required this.index});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  final images = DetailBreedController.instance.images;
  //AdmonHelper admonHelper = AdmonHelper();

  @override
  void initState() {
    super.initState();
    DetailBreedController.instance.getImageByBreedID(breedID: widget.breed.id);
    //admonHelper.createCatInterad();
  }

  @override
  void dispose() {
    super.dispose();
    DetailBreedController.instance.images.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat#${widget.index + 1}'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     //admonHelper.showCatInterad();
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => DetailBreedController.instance.images.isNotEmpty
                  ? image(images: DetailBreedController.instance.images)
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 200,
                        color: Colors.grey,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.breed.name.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const Gap(10),
                  paramtersBox(),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Temperament',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.breed.temperament.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Gap(10),
                      const Text(
                        'Desription',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.breed.description.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  attributeTable(),
                  TextButton.icon(
                    onPressed: () {
                      modalBottomSheetImages(context);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text('See more with images'),
                  ),
                  const Divider(),
                  TextButton.icon(
                    onPressed: () => DetailBreedController.instance
                        .launchUrlWWeb(widget.breed.wikipedia_url.toString()),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('See more with wikipedia'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: AdWidget(
          ad: AdmonHelper.getBannerCatAd()..load(),
          key: UniqueKey(),
        ),
      ),
    );
  }

  Future<dynamic> modalBottomSheetImages(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          body: Container(
            color: AppColors.primary,
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: DetailBreedController.instance.images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                final image = DetailBreedController.instance.images[index];
                return InstaImageViewer(
                  child: Image(
                    image: Image.network(
                      image.url.toString(),
                      fit: BoxFit.cover,
                    ).image,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Row paramtersBox() {
    return Row(
      children: [
        ParamterBox(
          color: Colors.red.shade200,
          title: 'country',
          content: widget.breed.origin.toString(),
        ),
        const Gap(10),
        ParamterBox(
          color: Colors.green.shade200,
          title: 'life span (year)',
          content: widget.breed.life_span.toString(),
        ),
        const Gap(10),
        ParamterBox(
          color: Colors.blue.shade200,
          title: 'weight (kg)',
          content: widget.breed.weight!.imperial.toString(),
        ),
      ],
    );
  }

  Widget attributeTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attributes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ParameterWidget(
          param: widget.breed.adaptability ?? 0,
          title: 'Adaptability',
        ),
        ParameterWidget(
          param: widget.breed.affection_level ?? 0,
          title: 'Affection',
        ),
        ParameterWidget(
          param: widget.breed.child_friendly ?? 0,
          title: 'Child Friendly',
        ),
        ParameterWidget(
          param: widget.breed.dog_friendly ?? 0,
          title: 'Dog Friendly',
        ),
        ParameterWidget(
          param: widget.breed.energy_level ?? 0,
          title: 'Energy',
        ),
        ParameterWidget(
          param: widget.breed.grooming ?? 0,
          title: 'Grooming',
        ),
        ParameterWidget(
          param: widget.breed.health_issues ?? 0,
          title: 'Health Issues',
        ),
        ParameterWidget(
          param: widget.breed.intelligence ?? 0,
          title: 'Intelligence',
        ),
        ParameterWidget(
          param: widget.breed.shedding_level ?? 0,
          title: 'Shedding',
        ),
        ParameterWidget(
          param: widget.breed.social_needs ?? 0,
          title: 'Social Needs',
        ),
        ParameterWidget(
          param: widget.breed.stranger_friendly ?? 0,
          title: 'Stranger Friendly',
        ),
        ParameterWidget(
          param: widget.breed.vocalisation ?? 0,
          title: 'Vocalisation',
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Parameter01Widget(
                    param: widget.breed.experimental ?? 0,
                    title: 'Experimental',
                  ),
                  Parameter01Widget(
                    param: widget.breed.hairless ?? 0,
                    title: 'Hairless',
                  ),
                  Parameter01Widget(
                    param: widget.breed.natural ?? 0,
                    title: 'Natural',
                  ),
                  Parameter01Widget(
                    param: widget.breed.rare ?? 0,
                    title: 'Rare',
                  ),
                  Parameter01Widget(
                    param: widget.breed.rex ?? 0,
                    title: 'Rex',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Parameter01Widget(
                    param: widget.breed.suppressed_tail ?? 0,
                    title: 'Suppressed Tail',
                  ),
                  Parameter01Widget(
                    param: widget.breed.short_legs ?? 0,
                    title: 'Short Legs',
                  ),
                  Parameter01Widget(
                    param: widget.breed.hypoallergenic ?? 0,
                    title: 'Hypoallergenic',
                  ),
                  Parameter01Widget(
                    param: widget.breed.indoor ?? 0,
                    title: 'Indoor',
                  ),
                  Parameter01Widget(
                    param: widget.breed.lap ?? 0,
                    title: 'Lap',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget image({required images}) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 250,
      child: InstaImageViewer(
        child: Image(
          image: Image.network(
            images.first.url.toString(),
            fit: BoxFit.cover,
          ).image,
        ),
      ),
    );
  }
}

class ParamterBox extends StatelessWidget {
  final Color color;
  final String title;
  final String content;

  const ParamterBox({
    super.key,
    required this.color,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                content,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(10),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
