
import 'package:flutter/material.dart';

import '../resources/app_color.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key, required this.child});
  final Widget child;

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationController!.repeat();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey.withOpacity(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: animationController!.drive(ColorTween(
                    begin: AppColors.colorWarning,
                    end: AppColors.colorAccent)), //AlwaysStoppedAnimation(AppColor.secondaryBlue),
                color:Colors.transparent,
              ),
              // WidthSpacer(myWidth: 25.50),
              // Text(AppKeywords.loading),
            ],
          ),
        ),
      ],
    );
  }
}