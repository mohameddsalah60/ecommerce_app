import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      width: MediaQuery.sizeOf(context).width * .45,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.greyLightColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      "https://student.valuxapps.com/storage/uploads/products/1638734961565J3.11.jpg",
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      errorBuilder: (context, url, error) {
                        return const Center(
                          child: Icon(Icons.error),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CustomLoadingIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        '10% off ',
                        style: AppTextStyles.bold16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 15,
                    child: GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Omron HEM-8712 BP Monitor',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppTextStyles.semiBold16,
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      'EGP',
                      style: AppTextStyles.semiBold16,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '3075',
                      style: AppTextStyles.bold16,
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
