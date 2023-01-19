import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuButton extends StatefulWidget {
  final int selectIndex;
  final Function ontap;

  const MenuButton({Key? key, required this.selectIndex, required this.ontap})
      : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: blanc,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: meuveFonce,
        onTap: (value) => widget.ontap(value),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: widget.selectIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_circle),
            label: "",
          )
        ]);
  }
}
