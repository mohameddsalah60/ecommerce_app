import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/get_addresses_user.dart';

part 'get_addresses_user_state.dart';

class GetAddressesUserCubit extends Cubit<GetAddressesUserState> {
  GetAddressesUserCubit(this.addressesRepo) : super(GetAddressesUserInitial());
  String address = getAddresses().nameAddress;
  final AddressesRepo addressesRepo;
  getAddressesUser() async {
    var result = await addressesRepo.getAddressesUser();
    result.fold(
      (failure) => emit(GetAddressesUserFailure(message: failure.errorMessage)),
      (addresses) {
        emit(GetAddressesUserSuccsess(addresses: addresses));
      },
    );
  }

  Future<void> setAddressDefault({required AddressEntity addressEntity}) async {
    await addressesRepo.setAddressDefault(address: addressEntity);
  }
}
