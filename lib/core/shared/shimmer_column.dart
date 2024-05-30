import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListColumn extends StatelessWidget {
  const ShimmerListColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 0),
      itemCount: 10, // Replace with your actual item count
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: const Color.fromRGBO(224, 224, 224, 1),
          highlightColor: const Color.fromRGBO(245, 245, 245, 1),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
            ),
            title: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 5),
              height: 16,
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
      },
    );
  }
}
