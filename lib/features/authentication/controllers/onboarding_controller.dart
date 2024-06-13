import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  //Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  //Update Current Index when Page Scroll
  void updatePagIndicator(Index) {}

  //Jump to the specific dot selected page.
  void dotNavigationClick(index) {}

  //Update current Index &jump to next pag
  void nextPage() {}

  //Update Current Index &jump to the last page
  void skiPage() {}
}
