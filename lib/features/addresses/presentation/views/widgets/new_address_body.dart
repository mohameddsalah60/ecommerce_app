import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubit/get_current_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NewAddressBody extends StatelessWidget {
  const NewAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: BlocBuilder<GetCurrentLocationCubit, GetCurrentLocationState>(
            builder: (context, state) {
              if (state is GetCurrentLocationSuccsess) {
                return FlutterMap(
                  options: MapOptions(
                    initialCenter: state.letLong,
                    initialZoom: 10,
                    onTap: (tapPosition, LatLng pos) {},
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
              } else if (state is GetCurrentLocationLoading) {
                return const CustomLoadingIndicator();
              } else {
                return const Text('ttt');
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
