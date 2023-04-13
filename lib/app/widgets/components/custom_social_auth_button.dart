import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomSocialAuthButton extends StatelessWidget {
  final String asset;
  const CustomSocialAuthButton({Key? key, required this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width / 2,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1.0, color: const Color(0xffdfdfdf)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29060000),
              offset: Offset(3, 6),
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Continue with',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 17,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(
                  asset,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
