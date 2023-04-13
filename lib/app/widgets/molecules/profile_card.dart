import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        ClipPath,
        Color,
        ColoredBox,
        Column,
        Container,
        CrossAxisAlignment,
        CustomClipper,
        EdgeInsets,
        FontWeight,
        LinearGradient,
        MediaQuery,
        Offset,
        Padding,
        Path,
        Positioned,
        Radius,
        Size,
        SizedBox,
        Stack,
        StatelessWidget,
        Text,
        Theme,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/utils/colors.dart' show AppColors;

class ProfileCard extends StatelessWidget {
  final String? greetingMsg;
  final String? name;
  const ProfileCard({super.key, this.name, this.greetingMsg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4)
          ],
          gradient: LinearGradient(colors: [
            Color(0xffc6d2c2),
            Color(0xfff1d8c6)
          ], stops: [
            0,
            0.8,
          ])),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            right: 0,
            child: ClipPath(
              clipper: TopRightTriangleClip(),
              child: const SizedBox.square(
                dimension: 85,
                child: ColoredBox(
                  color: Color(0xffFFE6D8),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: ClipPath(
              clipper: TopRightTriangleClip1(),
              child: SizedBox.square(
                dimension: 150,
                child: ColoredBox(
                  color: const Color(0xffFFE6D8).withOpacity(.6),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ClipPath(
              clipper: TopLeftTriangleClip1(),
              child: const SizedBox.square(
                dimension: 150,
                child: ColoredBox(
                  color: Color(0xffBAD0BD),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            child: ClipPath(
              clipper: TopLeftTriangleClip(),
              child: const SizedBox.square(
                dimension: 85,
                child: ColoredBox(
                  color: Color(0xffCADCCD),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greetingMsg!,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 24.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name!,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopRightTriangleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopRightTriangleClip oldClipper) => false;
}

class TopRightTriangleClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, size.height / 1.5);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopRightTriangleClip1 oldClipper) => false;
}

class TopLeftTriangleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopLeftTriangleClip oldClipper) => false;
}

class TopLeftTriangleClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2.5);
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TopLeftTriangleClip1 oldClipper) => false;
}
