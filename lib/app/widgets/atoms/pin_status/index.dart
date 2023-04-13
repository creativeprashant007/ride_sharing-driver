import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/colors.dart';

class PinStatus extends StatelessWidget {
  const PinStatus({
    Key? key,
    required this.pin,
  }) : super(key: key);

  final List<dynamic> pin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          pin.isNotEmpty ? Icons.circle : Icons.circle_outlined,
          color: pin.isNotEmpty
              ? AppColors.orangeColor
              : AppColors.backgroundColor4.withOpacity(1),
        ),
        SizedBox(
          width: 20.w,
        ),
        Icon(
          pin.length > 1 ? Icons.circle : Icons.circle_outlined,
          color: pin.length > 1
              ? AppColors.orangeColor
              : AppColors.backgroundColor4.withOpacity(1),
        ),
        SizedBox(
          width: 20.w,
        ),
        Icon(
          pin.length > 2 ? Icons.circle : Icons.circle_outlined,
          color: pin.length > 2
              ? AppColors.orangeColor
              : AppColors.backgroundColor4.withOpacity(1),
        ),
        SizedBox(
          width: 20.w,
        ),
        Icon(
          pin.length > 3 ? Icons.circle : Icons.circle_outlined,
          color: pin.length > 3
              ? AppColors.orangeColor
              : AppColors.backgroundColor4.withOpacity(1),
        ),
      ],
    );
  }
}
