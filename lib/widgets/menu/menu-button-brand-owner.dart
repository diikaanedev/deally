import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuButtonBrandOwner extends StatelessWidget {
  final Function ontap;
  const MenuButtonBrandOwner({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return BottomNavigationBar(
        backgroundColor: blanc,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: meuveFonce,
        onTap: (value) => ontap(value),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: applicationBloc.selectedIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/page-web.png"),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/choices.png"),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/product.png"),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/group.png"),
            ),
            label: "",
          )
        ]);
  }
}
