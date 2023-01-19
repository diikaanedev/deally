// ignore: file_names
import 'package:flutter/cupertino.dart';

class BtnAdminWidget extends StatelessWidget {
  final Function onTap;
  final String text;
  final String url;
  final Color color;
  const BtnAdminWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.url,
    this.color = const Color(0xff9D0208),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () => onTap(),
        child: Container(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              ImageIcon(
                size: constraints.maxHeight * .5,
                AssetImage(url),
                color: color,
              ),
              SizedBox(
                width: constraints.maxWidth * .04,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: constraints.maxHeight * .3,
                    fontWeight: FontWeight.w300),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.chevron_forward,
                color: color,
              ),
              SizedBox(
                width: constraints.maxWidth * .02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
