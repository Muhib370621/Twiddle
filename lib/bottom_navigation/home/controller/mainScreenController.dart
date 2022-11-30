import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../Api_Services/property/propertyServices.dart';
import '../models/propertyModel.dart';

class MainScreenController extends GetxController{

  @override
  void onInit() {
    getRentProperties();
    getSalesProperties();
    getShortStayProperties();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


// Rx<List> newList = <Specification>[].obs;
  var rentPropertyList = PropertyModel().obs;
  var salesPropertyList = PropertyModel().obs;
  var shortStayPropertyList = PropertyModel().obs;
  RxBool isLoading = false.obs;

  Future<PropertyModel> getRentProperties() async {
    // try {
    isLoading.value = true;
    // await Future.delayed(const Duration(seconds: 2), () {});
    var result = await RentServices().getRentPropertyList();
    isLoading.value = false;
    if (kDebugMode) {
      print("Result: $result");
    }
    rentPropertyList.value = result;
    // newList;

    // update();
    return result;
  }

  Future<PropertyModel> getSalesProperties() async {
    // try {
    // isLoading.value = true;
    // await Future.delayed(coenst Duration(seconds: 2), () {});
    var result = await RentServices().getSalesPropertyList();
    // isLoading.value = false;
    if (kDebugMode) {
      print("Result: $result");
    }
    salesPropertyList.value = result;
    // newList;
    // update();
    return result;
  }

  Future<PropertyModel> getShortStayProperties() async {
    // try {
    // isLoading.value = true;
    // await Future.delayed(const Duration(seconds: 2), () {});
    var result = await RentServices().getShortStayPropertyList();
    // isLoading.value = false;
    if (kDebugMode) {
      print("Result: $result");
    }
    shortStayPropertyList.value = result;
    // newList;
    // update();
    return result;
  }

}