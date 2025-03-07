import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/entites/text_editing_controllers.dart';
import '../../cubits/add_new_address_cubit/add_new_address_cubit.dart';

class AddressDetilesBody extends StatefulWidget {
  const AddressDetilesBody({super.key, required this.addressEntity});
  final AddressEntity addressEntity;

  @override
  State<AddressDetilesBody> createState() => _AddressDetilesBodyState();
}

class _AddressDetilesBodyState extends State<AddressDetilesBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late NewAddressTextEditingControllers controllers;
  @override
  void initState() {
    controllers = NewAddressTextEditingControllers(widget.addressEntity);
    super.initState();
  }

  @override
  void dispose() {
    controllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: fromKey,
          child: Column(
            children: [
              Image.asset(
                Assets.imagesAddressImage,
                height: 180,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                controller: controllers.getController('details'),
                hintText: 'Address details',
                fillColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    controllers.getController('details').text = value!;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFromField(
                      controller: controllers.getController('floor'),
                      hintText: 'Floor number',
                      fillColor: Colors.white,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          controllers.getController('floor').text = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextFromField(
                      controller: controllers.getController('apartment'),
                      hintText: 'Apartment number',
                      fillColor: Colors.white,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          controllers.getController('apartment').text = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextFromField(
                controller: controllers.getController('directions'),
                hintText: 'Additional directions',
                fillColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    controllers.getController('directions').text = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomTextFromField(
                controller: controllers.getController('phone'),
                hintText: 'Phone number',
                fillColor: Colors.white,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    controllers.getController('phone').text = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomTextFromField(
                controller: controllers.getController('label'),
                hintText: 'Address label',
                fillColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    controllers.getController('label').text = value!;
                  });
                },
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Give this address a label so you can easily choose between them (e.g., Home or Work).',
                  style: AppTextStyles.semiBold13,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Save Address',
                backgroundColor: fromKey.currentState?.validate() ?? false
                    ? AppColors.primaryColor
                    : const Color(0xffF3F4F6),
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    context.read<AddNewAddressCubit>().addNewAddressUser(
                          addressEntity: AddressEntity(
                            nameAddress:
                                controllers.getController('label').text,
                            city: controllers.getController('details').text,
                            region:
                                controllers.getController('directions').text,
                            notes: controllers.getController('phone').text,
                            details: controllers.getController('details').text,
                            latitude: widget.addressEntity.latitude,
                            longitude: widget.addressEntity.longitude,
                          ),
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
