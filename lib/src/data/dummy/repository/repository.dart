
import 'package:blood_bridge/src/models/carousel_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BridgeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CarouselModel>> fetchCarouselData() async {
    final List<CarouselModel> carouselList = [];
    final carouselSnapshot = await _firestore.collection('carousel-slider').get();

    try {
      for(var carouselData in carouselSnapshot.docs) {
        carouselList.add(CarouselModel.fromJson(carouselData.data()));
      }
      return carouselList;
    } catch (e){
      throw Exception(e);
    }
  }
}