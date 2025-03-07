import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/address_entity.dart';
import '../../../domain/repos/addresses_repo.dart';

part 'add_new_address_state.dart';

class AddNewAddressCubit extends Cubit<AddNewAddressState> {
  AddNewAddressCubit(this.addressesRepo) : super(AddNewAddressInitial());
  final AddressesRepo addressesRepo;

  addNewAddressUser({required AddressEntity addressEntity}) async {
    emit(AddNewAddressLoading());
    var result =
        await addressesRepo.addNewAddressUser(addressEntity: addressEntity);
    result.fold(
      (failure) => emit(AddNewAddressFailure(message: failure.errorMessage)),
      (address) => emit(AddNewAddressSuccsess()),
    );
  }
}
