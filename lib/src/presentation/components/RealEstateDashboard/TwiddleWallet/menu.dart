import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../myContainer.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Dialog(
                      alignment: Alignment.topRight,
                      child: MyContainer(
                        horizontalPadding: 5,
                        verticalPadding: 2,
                        width: 150,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const Text(
                              'More Menu',
                              style: TextStyle(
                                  color: AppColors.mainColor, fontSize: 14),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.to(()=> PayInstallment());
                              },
                              child: const Text(
                                'View Your Investment Dashboard',
                                style: TextStyle(
                                  color: AppColors.kLightGrey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.to(() => RentDashboard());
                              },
                              child: const Text(
                                'View Your Rent Dashboard',
                                style: TextStyle(
                                  color: AppColors.kLightGrey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  // Get.to(() => TopUpWallet());
                                },
                                child: const Text('Top-Up Your Twiddle Balance',
                                    style: TextStyle(color: AppColors.kLightGrey))),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {

                              },
                              child: const Text(
                                'See Your Twiddle Wallet Id',
                                style: TextStyle(color: AppColors.kLightGrey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ));
        },
        child: const Icon(
          Icons.more_vert,
          size: 40,
          color: AppColors.kWhite,
        ));
  }
}