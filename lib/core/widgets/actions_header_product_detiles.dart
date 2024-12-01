import 'package:flutter/material.dart';

class ActoinsHeaderProductDetiles extends StatelessWidget {
  const ActoinsHeaderProductDetiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 100,
                    color: Colors.black,
                  )
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 24,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 100,
                    color: Colors.black,
                  )
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 24,
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
