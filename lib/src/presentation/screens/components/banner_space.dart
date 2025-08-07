import 'package:blood_bridge/src/bloc/carousel/carousel_bloc.dart';
import 'package:blood_bridge/src/presentation/widgets/shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dummy/dummy_data_donors_list.dart';

class BannerSpace extends StatelessWidget {
  const BannerSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselBloc, CarouselState>(
      builder: (context, state) {
        if (state is FetchCarouselSuccess) {
          return CarouselSlider.builder(
            itemCount: state.carouselData.length,
            itemBuilder: (context, index, realIndex) {
              final carousel = state.carouselData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          imageUrl: carousel.imgUrl.toString(),
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.low,
                        )),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 0,
                    //   right: 0,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //       top: 20.0,
                    //     ),
                    //     child: Container(
                    //       height: 30,
                    //       width: MediaQuery.of(context).size.width / 4.0,
                    //       decoration: const BoxDecoration(
                    //         color: Colors.amber,
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(100),
                    //           bottomLeft: Radius.circular(100),
                    //         ),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(2.0),
                    //         child: Center(
                    //           child: RichText(
                    //             text: const TextSpan(
                    //               text: "Upto ",
                    //               style: TextStyle(
                    //                 fontFamily: 'Poppins',
                    //                 fontSize: 16,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Color(0xFF75140C),
                    //               ),
                    //               children: [
                    //                 TextSpan(
                    //                   text: "50% 🔥",
                    //                   style: TextStyle(
                    //                     fontFamily: 'Poppins',
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Color(0xFF75140C),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 30,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 4.0,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Center(
                                      child: Text(
                                        carousel.status!
                                            ? 'Opened'.toUpperCase()
                                            : 'Closed'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: carousel.status!
                                                  ? Colors.red
                                                  : Colors.grey,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    carousel.title!,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    carousel.status!
                                        ? 'Status: ${'Opened'.toUpperCase()}'
                                        : 'Status: ${'Closed'.toUpperCase()}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  Text(
                                    'Date: ${carousel.date}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // const Row(
                                  //   children: [
                                  //     Icon(
                                  //       Icons.star,
                                  //       size: 14,
                                  //       color: Colors.amber,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       size: 14,
                                  //       color: Colors.amber,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       size: 14,
                                  //       color: Colors.amber,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       size: 14,
                                  //       color: Colors.amber,
                                  //     ),
                                  //     Icon(
                                  //       Icons.star,
                                  //       size: 14,
                                  //       color: Colors.amber,
                                  //     ),
                                  //     Text(
                                  //       '(5k)',
                                  //       style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontFamily: 'Poppins',
                                  //         fontSize: 14,
                                  //         fontWeight: FontWeight.w500,
                                  //       ),
                                  //       textAlign: TextAlign.center,
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 9 / 6,
              viewportFraction: 0.9,
              initialPage: 0,
            ),
          );
        } else {
          return CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShimmerEffect.rectangular(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ));
            },
            options: CarouselOptions(
              aspectRatio: 9 / 6,
              viewportFraction: 0.9,
              initialPage: 0,
            ),
          );
        }
      },
    );
  }
}
