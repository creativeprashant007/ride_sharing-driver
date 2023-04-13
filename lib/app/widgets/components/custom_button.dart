import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  const CustomButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onPressed(),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffe9003f),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29060000),
                offset: Offset(3, 6),
                blurRadius: 8,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
