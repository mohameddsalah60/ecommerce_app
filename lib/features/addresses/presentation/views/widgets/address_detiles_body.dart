import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class AddressDetilesBody extends StatelessWidget {
  const AddressDetilesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              Assets.imagesAddressImage,
              height: 180,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFromField(
              hintText: 'Address detiles',
              fillColor: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Expanded(
                    child: CustomTextFromField(
                  hintText: 'Floor number',
                  fillColor: Colors.white,
                )),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: CustomTextFromField(
                  hintText: 'Apartment number',
                  fillColor: Colors.white,
                )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFromField(
              hintText: 'Additonal directions',
              fillColor: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFromField(
              hintText: 'Phone number',
              fillColor: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFromField(
              hintText: 'Address label',
              fillColor: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Give this address a label so you can easily choose between them (e.g., Home or Work).',
                style: AppTextStyles.semiBold13,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomButton(
              text: 'Save Address',
              backgroundColor: Color(0xffF3F4F6),
            ),
          ],
        ),
      ),
    );
  }
}
