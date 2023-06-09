import 'package:driver/utils/colors.dart';
import 'package:flutter/material.dart';



enum ButtonType {
  filled,
  outlined,
  transparent,
}

enum ButtonSize {
  small,
  medium,
  large,
}

class Button extends StatelessWidget {
  final Widget child;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final GestureTapCallback onPressed;
  final ButtonType? type;
  final ButtonSize? size;
  final bool? disabled;
  final bool disableBorder;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Color? fillColor;
  final Axis direction;
  final BorderRadius? borderRadius;
  final Color? splashColor;
  final Color? highlightColor;
  //update boolvalue;
  final bool loader;

  Button(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.type = ButtonType.filled,
      this.size = ButtonSize.large,
      this.padding,
      this.disabled = false,
      this.textStyle,
      this.leadingIcon,
      this.trailingIcon,
      this.disableBorder = false,
      this.fillColor,
      this.direction = Axis.horizontal,
      this.borderRadius,
      this.splashColor,
      this.highlightColor,
      this.loader = false})
      : super(key: key);

  final Map<ButtonSize, double> sizeValue = {
    ButtonSize.small: 8,
    ButtonSize.medium: 12,
    ButtonSize.large: 16,
  };

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: disabled! ? null : onPressed,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      constraints:
          const BoxConstraints(minWidth: double.infinity, minHeight: 0),
      padding: EdgeInsets.symmetric(
          vertical: sizeValue[size] ?? 0,
          horizontal: (sizeValue[size] ?? 0) * 2),
      textStyle: (size == ButtonSize.large
              ? Theme.of(context).textTheme.labelLarge
              : size == ButtonSize.medium
                  ? Theme.of(context).textTheme.titleSmall
                  : Theme.of(context).textTheme.bodyMedium)
          ?.merge(textStyle)
          .merge(
            TextStyle(
              color: disabled!
                  ? Colors.white
                  : type == ButtonType.filled
                      ? Colors.white
                      : Theme.of(context).primaryColor,
            ),
          ),
      highlightColor: highlightColor,
      splashColor: splashColor ??
          (type == ButtonType.filled
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColorLight),
      fillColor: disabled!
          ? AppColors.errorColor
          : type == ButtonType.filled
              ? fillColor ?? AppColors.primaryColor
              : null,
      shape: RoundedRectangleBorder(
        side: disabled! || type != ButtonType.outlined
            ? BorderSide.none
            : BorderSide(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(disableBorder ? 50 : 50),
            ),
      ),
      child: Flex(
        mainAxisSize: MainAxisSize.min,
        direction: direction,
        children: <Widget>[
          ...(leadingIcon != null
              ? [leadingIcon!, const SizedBox(width: 8)]
              : []),
          child,
          ...(trailingIcon != null
              ? [const SizedBox(width: 8), trailingIcon!]
              : []),
          ...(loader
              ? [
                  const SizedBox(
                    height: 20,
                    width: 27,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 188, 71, 255),
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  ),
                ]
              : []),
        ],
      ),
    );
  }
}
