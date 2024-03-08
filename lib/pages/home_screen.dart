import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:the_cat_pedia/constants/images_constant.dart';
import 'package:the_cat_pedia/controllers/breed_controller.dart';
import 'package:the_cat_pedia/heplers/admob_hepler.dart';
import 'package:the_cat_pedia/manager/color_manager.dart';
import 'package:the_cat_pedia/pages/breed_name_delegate.dart';
import 'package:the_cat_pedia/pages/cat_screen.dart';
import 'package:the_cat_pedia/pages/image_screen.dart';
import 'package:the_cat_pedia/pages/setting_screen.dart';
import 'package:the_cat_pedia/widgets/breed_box.dart';
import 'package:the_cat_pedia/widgets/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final breedController = Get.put(BreedController());
  final search = TextEditingController();
  AdmonHelper admonHelper = AdmonHelper();

  @override
  void initState() {
    super.initState();
    admonHelper.createImageInterad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImagesConstant.logo),
              radius: 20,
            ),
            Gap(10),
            Text(
              'Cat Pedia',
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videogame_asset_sharp,
            ),
          ),
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
            onPressed: () => Get.to(() => const SettingScreen()),
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          titleImages(),
          Obx(
            () => breedController.images.isNotEmpty
                ? imagesBreedWidget(images: breedController.images)
                : const LinearProgressIndicator(),
          ),
          const Gap(10),
          Obx(
            () => breedController.breeds.isNotEmpty
                ? breeds(breeds: breedController.breeds)
                : const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: AdWidget(
          ad: AdmonHelper.getBannerHomeAd()..load(),
          key: UniqueKey(),
        ),
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
          return GestureDetector(
            onTap: () => Get.to(
              () => CatScreen(
                breed: breed,
                index: index,
              ),
            ),
            child: BreedBoxHome(
              breed: breed,
              url: breed.url.toString(),
            ),
          );
        },
      ),
    );
  }

  Widget imagesBreedWidget({required images}) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return GestureDetector(
            onTap: () {
              admonHelper.showImageInterad();
              Get.to(() => ImageScreen(img: image.url.toString()));
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: ClipOval(
                child: CachedNetWorkImageWidget(
                  url: image.url.toString(),
                  height: 70,
                  width: 70,
                ),
              ),
            ),
          );
        },
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
          GestureDetector(
            onTap: () {
              breedController.images.clear();
              breedController.get10ImageRandom();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
              ),
              child: const Text(
                'Get Random',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
