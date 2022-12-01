import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../Api_Services/property/propertyServices.dart';
import '../models/propertyModel.dart';

class MainScreenController extends GetxController {
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

  Future<String> postProperty(
    String category,
    String stateType,
    String title,
    String description,
    String bedroom,
    String washroom,
      String carParking,
      String kitchen,
      String floorArea,
      String tapAvailable,
      String airCondition,
      String quarterAvalaible,
      String price,
      String fullAddress,
      String houseNo,
      String streetNo,
      File file1,
      File file2,
      File file3,
      File file4,
      File file5,
      File file6,
      File file7,
      File file8,
      File file9,





  ) async {
    // try {
    isLoading.value = true;
    // await Future.delayed(const Duration(seconds: 2), () {});
    var result = await RentServices().postProperty(
        category,
        stateType,
        title,
        description,
        bedroom,
        washroom,
        carParking,
        kitchen,
        floorArea,
        tapAvailable,
        airCondition,
        quarterAvalaible,
        price,
        fullAddress,
        houseNo,
        streetNo,
        file1,
        file2,
        file3,
        file4,
        file5,
        file6,
        file7,
        file8,
        file9);
    isLoading.value = false;
    if (kDebugMode) {
      print("Result: $result");
    }
    // shortStayPropertyList.value = result;
    // newList;
    // update();
    return "Property Added by controller";
  }
}
