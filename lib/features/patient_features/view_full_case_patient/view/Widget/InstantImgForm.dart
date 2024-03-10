// import 'package:dentalmatching/core/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:insta_image_viewer/insta_image_viewer.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// class InstantImageForm extends StatelessWidget {
//   final String img;
//   const InstantImageForm({
//     super.key,
//     required this.img,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InstaImageViewer(
//       child: Container(
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(
//           border: Border.all(
//             width: 3,
//             color: AppColors.mainColor,
//           ),
//           image: DecorationImage(
//             image: NetworkImage(img),
//             fit: BoxFit.cover,
//           ),
//           color: AppColors.mainColor,
//           borderRadius: const BorderRadius.all(Radius.circular(26)),
//         ),
//       ),
//     );
//   }
// }
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class InstantImageForm extends StatelessWidget {
  final String img;

  const InstantImageForm({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showImage(context);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: AppColors.mainColor,
          ),
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void showImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 50),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Expanded(
              child: PhotoView(
                imageProvider: NetworkImage(img),
              ),
            ),
          ],
        );
      },
    );
  }
}
