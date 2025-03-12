import 'package:ecommerce_app/core/helper_functions/get_addresses_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/address_entity.dart';
import '../../../domain/repos/addresses_repo.dart';

part 'address_actions_state.dart';

class AddressActionsCubit extends Cubit<AddressActionsState> {
  AddressActionsCubit(this.addressesRepo) : super(AddNewAddressInitial());
  final AddressesRepo addressesRepo;
  String address = getAddresses().nameAddress;
  Future<void> addNewAddressUser({required AddressEntity addressEntity}) async {
    emit(AddressActionsLoading());
    var result =
        await addressesRepo.addNewAddressUser(addressEntity: addressEntity);
    result.fold(
      (failure) => emit(AddressActionsFailure(message: failure.errorMessage)),
      (address) => emit(AddNewAddressSuccsess()),
    );
  }

  Future<void> updateAddressUser({required AddressEntity addressEntity}) async {
    emit(AddressActionsLoading());
    var result = await addressesRepo.updateAddressUser(address: addressEntity);
    result.fold(
      (failure) => emit(AddressActionsFailure(message: failure.errorMessage)),
      (address) => emit(UpdateAddressSuccsess()),
    );
  }

  Future<void> deleteAddressUser({required AddressEntity addressEntity}) async {
    emit(AddressActionsLoading());
    var result = await addressesRepo.deleteAddressUser(address: addressEntity);
    result.fold(
      (failure) => emit(AddressActionsFailure(message: failure.errorMessage)),
      (address) => emit(DeleteAddressSuccsess()),
    );
  }
}
