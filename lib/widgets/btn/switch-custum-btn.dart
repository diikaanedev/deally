import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const CustomSwitch(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.activeColor,
      this.inactiveColor = Colors.grey,
      this.activeText = 'On',
      this.inactiveText = 'Off',
      this.activeTextColor = Colors.white70,
      this.inactiveTextColor = Colors.white70})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 50.0,
            height: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? widget.inactiveColor
                    : widget.activeColor),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _circleAnimation.value == Alignment.centerRight
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.activeText,
                            style: TextStyle(
                                color: blanc,
                                fontWeight: FontWeight.w300,
                                fontSize: 13.0),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                        ],
                      )
                    : Container(),
                Align(
                  alignment: _circleAnimation.value,
                  child: Row(
                    children: [
                      widget.value
                          ? const SizedBox(
                              width: 4,
                            )
                          : const SizedBox(
                              width: 1,
                            ),
                      Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                _circleAnimation.value == Alignment.centerLeft
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            widget.inactiveText,
                            style: TextStyle(
                                color: blanc,
                                fontWeight: FontWeight.w300,
                                fontSize: 13.0),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
