
import 'package:dentalmatching/features/patient_features/View%20Form/view/Widget/ImageContainerForm.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/Data/Model/ImageModel.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
 
  });

  

  @override
  Widget build(BuildContext context) {
        final List<ImageModel> image = [
      ImageModel(image: 'assets/images/signup.png'),
      ImageModel(image: 'assets/images/signup.png'),
      ImageModel(image: 'assets/images/signup.png'),
      ImageModel(image: 'assets/images/signup.png'),
      ImageModel(image: 'assets/images/signup.png'),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 100,
        crossAxisSpacing: 6,
        mainAxisSpacing: 5,  
      ),
      itemCount: image.length,
      itemBuilder: (context, index) {
        return GridImage(model: image[index]);
      },
    );
  }
}