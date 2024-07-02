import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListRow extends StatelessWidget {
  const ShimmerListRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(224, 224, 224, 1),
      highlightColor: const Color.fromRGBO(245, 245, 245, 1),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
        ),
        title: FittedBox(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(bottom: 5, right: 10),
                height: 16,
                width: 80, // Adjust width as needed
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(bottom: 5),
                height: 16,
                width: 120, // Adjust width as needed
              ),
            ],
          ),
        ),
        subtitle: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
