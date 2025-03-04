// lib/features/addresses/presentation/widgets/text_editing_controllers.dart
import 'package:ecommerce_app/core/helper_functions/get_user.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';

class NewAddressTextEditingControllers {
  late TextEditingController addressController;
  late TextEditingController floorController;
  late TextEditingController apartmentController;
  late TextEditingController directionsController;
  late TextEditingController phoneController;
  late TextEditingController labelController;

  NewAddressTextEditingControllers(AddressEntity addressEntity) {
    addressController = TextEditingController(text: addressEntity.city);
    floorController = TextEditingController();
    apartmentController = TextEditingController();
    directionsController = TextEditingController(text: addressEntity.details);
    phoneController = TextEditingController(text: getUser().phone.toString());
    labelController = TextEditingController(text: addressEntity.nameAddress);
  }

  TextEditingController getController(String key) {
    switch (key) {
      case 'details':
        return addressController;
      case 'floor':
        return floorController;
      case 'apartment':
        return apartmentController;
      case 'directions':
        return directionsController;
      case 'phone':
        return phoneController;
      case 'label':
        return labelController;
      default:
        throw Exception("Controller for $key not found");
    }
  }

  void dispose() {
    addressController.dispose();
    floorController.dispose();
    apartmentController.dispose();
    directionsController.dispose();
    phoneController.dispose();
    labelController.dispose();
  }
}
