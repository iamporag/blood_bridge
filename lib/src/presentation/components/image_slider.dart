import 'package:flutter/material.dart';
import '../../constants/app_defaults.dart';
import '../screens/components/network_image.dart';
import '../screens/home/components/animated_dots.dart';

class ProductImagesSlider extends StatefulWidget {
  const ProductImagesSlider({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  late PageController controller;
  int currentIndex = 0;

  List<String> images = [];

  @override
  void initState() {
    super.initState();
    images = widget.images;
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppDefaults.padding),
      decoration: BoxDecoration(
        color: const Color(0xFFF6DDE3),
        borderRadius: AppDefaults.borderRadius,
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (v) {
                    currentIndex = v;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return AspectRatio(
                      aspectRatio: 16 / 9,
                      child: NetworkImageWithLoader(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  itemCount: images.length,
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: AnimatedDots(
              totalItems: images.length,
              currentIndex: currentIndex,
            ),
          ),
          // Positioned(
          //   right: 0,
          //   child: Material(
          //     color: Colors.transparent,
          //     borderRadius: AppDefaults.borderRadius,
          //     child: IconButton(
          //       onPressed: () {},
          //       iconSize: 56,
          //       constraints: const BoxConstraints(minHeight: 56, minWidth: 56),
          //       icon: Container(
          //         padding: const EdgeInsets.all(AppDefaults.padding),
          //         decoration: const BoxDecoration(
          //           color: AppColors.scaffoldBackground,
          //           shape: BoxShape.circle,
          //         ),
          //         child: SvgPicture.asset(AppIcons.heart),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
