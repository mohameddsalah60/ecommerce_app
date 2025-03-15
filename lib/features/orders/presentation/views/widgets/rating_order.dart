import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class RatingOrder extends StatefulWidget {
  const RatingOrder({
    super.key,
  });

  @override
  State<RatingOrder> createState() => _RatingOrderState();
}

class _RatingOrderState extends State<RatingOrder> {
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rate',
            style: AppTextStyles.bold19.copyWith(color: Colors.black45),
          ),
          StarRating(
            rating: rating,
            allowHalfRating: false,
            size: 29,
            onRatingChanged: (rating) => setState(() => this.rating = rating),
          ),
        ],
      ),
    );
  }
}
