import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_cat_pedia/constants/images_constant.dart';
import 'package:the_cat_pedia/controllers/breed_controller.dart';
import 'package:the_cat_pedia/manager/color_manager.dart';
import 'package:the_cat_pedia/models/breed_model.dart';
import 'package:the_cat_pedia/pages/breed_name_delegate.dart';
import 'package:the_cat_pedia/pages/cat_screen.dart';
import 'package:the_cat_pedia/pages/image_screen.dart';
import 'package:the_cat_pedia/widgets/breed_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final breedController = Get.put(BreedController());
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImagesConstant.logo),
              radius: 20,
            ),
            Gap(10),
            Text(
              'The Cat Pedia',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PlaypenSans',
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: BreedNameDelegate(breedController),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          titleImages(),
          //const Gap(10),
          imagesBreedWidget(),
          Gap(10),
          Obx(
            () => breedController.breeds.isNotEmpty
                ? breeds(breeds: breedController.breeds)
                : Expanded(child: Center(child: CircularProgressIndicator())),
          ),
        ],
      ),
    );
  }

  Widget breeds({
    required breeds,
  }) {
    return Expanded(
      child: GridView.builder(
        itemCount: breeds.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          final breed = breeds[index];
          final url = breedController.urlImages[index];
          return GestureDetector(
            onTap: () => Get.to(
              () => CatScreen(
                breed: breed,
                index: index,
              ),
            ),
            child: BreedBoxHome(
              breed: breed,
              url: url,
            ),
          );
        },
      ),
    );
  }

  Widget imagesBreedWidget() {
    return Obx(
      () => breedController.images.isNotEmpty
          ? SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: breedController.images.length,
                itemBuilder: (context, index) {
                  final image = breedController.images[index];
                  return GestureDetector(
                    onTap: () =>
                        Get.to(() => ImageScreen(img: image.url.toString())),
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
            )
          : const LinearProgressIndicator(),
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
              fontFamily: 'PlaypenSans',
            ),
          ),
          GestureDetector(
            onTap: () {
              breedController.images.clear();
              breedController.get10ImageRandom();
            },
            child: Container(
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
                  fontFamily: 'PlaypenSans',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
