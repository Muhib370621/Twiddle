import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:twiddle_refactored/src/model/PropertyModel.dart';
import 'package:twiddle_refactored/src/services/Real%20Estate%20Services/Rent%20Services.dart';

import '../../services/authenticationServices.dart';

class MainScreenController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    getProperties();
    super.onInit();
  }
  // Rx<List> newList = <Specification>[].obs;

  var propertList = PropertyModel().obs;
  RxBool isLoading = false.obs;

  Future<List<PropertyModel>> getProperties() async {
    // try {
    isLoading.value = true;
    // await Future.delayed(const Duration(seconds: 2), () {});
    var result = await RentServices().getPropertyList();
    if (kDebugMode) {
      print("Result: $result");
    }
    propertList.value = result as PropertyModel;
    // newList;
    isLoading.value = false;
    return result;
  }
}

