import 'package:dentalmatching/features/patient_features/view_full_case_patient/view/Widget/ImageContainerForm.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.imagesList,
  });
  final List<String> imagesList;
  @override
  Widget build(BuildContext context) {
    // final List<ImageModel> image = [
    //   ImageModel(image: 'assets/images/signup.png'),
    //   ImageModel(image: 'assets/images/signup.png'),
    //   ImageModel(image: 'assets/images/signup.png'),
    //   ImageModel(image: 'assets/images/signup.png'),
    //   ImageModel(image: 'assets/images/signup.png'),
    // ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 100,
        crossAxisSpacing: 6,
        mainAxisSpacing: 5,
      ),
      itemCount: imagesList.length,
      itemBuilder: (context, index) {
        return GridImage(image: imagesList[index]);
      },
    );
  }
}
