import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubits/pin_location_cubit/pin_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddressMapBody extends StatelessWidget {
  const AddressMapBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: BlocBuilder<PinLocationCubit, PinLocationState>(
            builder: (context, state) {
              if (state is PinLocationSuccsess) {
                return FlutterMap(
                  options: MapOptions(
                    initialCenter: state.letLong,
                    initialZoom: 10,
                    onTap: (tapPosition, LatLng pos) {
                      context.read<PinLocationCubit>().updatePinLocation(pos);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 40,
                          height: 40,
                          point: state.letLong,
                          child: const Icon(Icons.location_pin,
                              color: Colors.red, size: 40),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is PinLocationFailure) {
                return Text(state.message);
              } else {
                return const CustomLoadingIndicator();
              }
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
