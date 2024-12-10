import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.productEntity,
    this.onTap,
  });
  final ProductEntity productEntity;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .30,
        width: MediaQuery.sizeOf(context).width * .45,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.greyLightColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: productEntity.image,
                        imageBuilder: (context, imageProvider) => Container(
                          width: MediaQuery.sizeOf(context).width,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const Center(child: CustomLoadingIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    productEntity.discount != 0
                        ? Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Text(
                                'Save ${productEntity.discount}%',
                                style: AppTextStyles.bold16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
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
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    productEntity.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.semiBold16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "EGP ${productEntity.price.toString()}",
                          style: AppTextStyles.bold16
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      productEntity.discount != 0
                          ? FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "EGP ${productEntity.oldPrice.toString()}",
                                style: AppTextStyles.bold16.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColors.secnderyColor),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
