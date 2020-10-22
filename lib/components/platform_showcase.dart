import 'package:flutter/material.dart';
import 'package:cyberpunkcountdown/utilities/constants.dart';

class PlatformShowcase extends StatelessWidget {
  final double screenHeight;
  final bool playstation4;
  final bool xboxOne;
  final bool pc;

  PlatformShowcase({
    @required this.screenHeight,
    this.playstation4 = false,
    this.xboxOne = false,
    this.pc = false,
  });

  List<String> getImagePaths(bool playstation4, bool xboxOne, bool pc) {
    var imagePaths = List<String>();
    if (xboxOne) {
      imagePaths.add(kXboxOneBlackLogoPath);
    }
    if (playstation4) {
      imagePaths.add(kPlaystation4BlackLogoPath);
    }
    if (pc) {
      imagePaths.add(kPCBlackLogoPath);
    }
    return imagePaths;
  }

  List<Expanded> getImageWidgets(List<String> imagePaths) {
    var imageWidgets = List<Expanded>();
    for (String path in imagePaths) {
      imageWidgets.add(Expanded(child: Image.asset(path)));
    }
    return imageWidgets;
  }

  @override
  Widget build(BuildContext context) {
    var imagePaths = getImagePaths(playstation4, xboxOne, pc);

    return SizedBox(
      height: screenHeight * kPlatformRowPercentage,
      child: Row(
        children: getImageWidgets(imagePaths),
      ),
    );
  }
}
