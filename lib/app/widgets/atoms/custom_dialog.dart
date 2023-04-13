import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/utils/colors.dart';

class ProgressDialogCust extends StatelessWidget {
  final String status;

  const ProgressDialogCust({Key? key, required this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
          child: Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.w,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.successColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Text(
                  status,
                  style: TextStyle(fontSize: 15.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
