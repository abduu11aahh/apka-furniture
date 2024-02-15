import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// class FullScreenImage extends StatelessWidget {
//   final String image;

//   const FullScreenImage({Key? key, required this.image}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Hero(
//           tag: image,
//           child: Center(
//               // child: Image.network(
//               //   image,
//               //   fit: BoxFit.cover,
//               //   width: double.infinity,
//               //   height: double.infinity,
//               // ),
//               child: CachedNetworkImage(
//             imageUrl: image,
//             fit: BoxFit.cover,
//             // placeholder: (context, url) => CircularProgressIndicator(),
//             errorWidget: (context, url, error) => Icon(Icons.error),
//           )),
//         ),
//       ),
//     );
//   }
// }

class FullScreenImageGallery extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  FullScreenImageGallery({required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}
