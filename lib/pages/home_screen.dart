import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:the_cat_pedia/constants/images_constant.dart';
import 'package:the_cat_pedia/controllers/breed_controller.dart';
import 'package:the_cat_pedia/manager/color_manager.dart';
import 'package:the_cat_pedia/pages/image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final breedController = Get.put(BreedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text('List of Breeds'),
      ),
      body: Column(
        children: [
          titleImages(),
          //const Gap(10),
          imagesBreedWidget(),
          Gap(10),
          breeds(),
        ],
      ),
    );
  }

  Obx breeds() {
    return Obx(
      () => Expanded(
        child: GridView.builder(
          itemCount: breedController.breeds.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
          ),
          itemBuilder: (context, index) {
            final breed = breedController.breeds[index];
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
          },
        ),
      ),
    );
  }

  Widget imagesBreedWidget() {
    return SizedBox(
      height: 90,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: breedController.images.length,
          itemBuilder: (context, index) {
            final image = breedController.images[index];
            return GestureDetector(
              onTap: () => Get.to(() => ImageScreen(img: image.url.toString())),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: ClipOval(
                  child: Image.network(
                    image.url.toString(),
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget titleImages() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Images Random Cat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary,
            ),
            child: Text(
              'Get Random',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
