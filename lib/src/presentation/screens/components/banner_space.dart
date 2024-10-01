import 'package:blood_bridge/src/presentation/components/image_slider.dart';
import 'package:flutter/material.dart';

class BannerSpace extends StatelessWidget {
  const BannerSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ProductImagesSlider(images: [
      "https://images.pexels.com/photos/1069798/pexels-photo-1069798.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "https://i.ibb.co.com/CKsjX1t/blood-donation-app-easy-to-find-donner-search-ios-2.png",
      "https://i.ibb.co.com/qD2J2Nn/blood-donation-app-easy-to-find-donner-search-ios-1.png",
      "https://i.ibb.co.com/6bzSg1p/blood-donation-app-easy-to-find-donner-search-ios-3.png",
    ]);
  }
}
