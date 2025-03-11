import 'package:flutter/material.dart';

import '../../../domain/entites/address_entity.dart';
import 'address_item.dart';

class AddressesListView extends StatefulWidget {
  const AddressesListView({
    super.key,
    required this.addresses,
  });
  final List<AddressEntity> addresses;

  @override
  State<AddressesListView> createState() => _AddressesListViewState();
}

class _AddressesListViewState extends State<AddressesListView> {
  late int curruntIndex;

  @override
  void initState() {
    curruntIndex = widget.addresses.indexOf(widget.addresses.last);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.addresses.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                curruntIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: AddressItem(
                addressEntity: widget.addresses[index],
                isSelected: curruntIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
