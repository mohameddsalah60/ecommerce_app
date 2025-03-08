import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_addresses_user_state.dart';

class GetAddressesUserCubit extends Cubit<GetAddressesUserState> {
  GetAddressesUserCubit(this.addressesRepo) : super(GetAddressesUserInitial());
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
}
