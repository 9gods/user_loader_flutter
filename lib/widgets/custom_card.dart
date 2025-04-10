import 'package:flutter/material.dart';
import 'package:user_loader_flutter/widgets/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final LinearGradient? backgroundGradient;
  final double? height;
  final double? width;
  final Axis orientation;

  const CustomCard({
    super.key,
    required this.child,
    this.height,
    this.backgroundGradient,
    this.width,
    this.orientation = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppColors.slate200, width: 1.0),
      ),
      child:
          orientation == Axis.vertical
              ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [child],
              )
              : Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [child],
              ),
    );
  }
}
