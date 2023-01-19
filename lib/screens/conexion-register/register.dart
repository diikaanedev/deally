import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/screens/conexion-register/register/page0.dart';
import 'package:deally/screens/conexion-register/register/page1.dart';
import 'package:deally/screens/conexion-register/register/page2.dart';
import 'package:deally/screens/conexion-register/register/page3.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late Size size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSign();
  }

  getSign() async {
    await SmsAutoFill().getAppSignature.then((value) => print(value));
  }

  @override
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var appBlock = context.read<ApplicationBloc>();
    var userBloc = context.watch<UserBlock>();
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        backgroundColor: blanc,
        leading: GestureDetector(
          onTap: () {
            print(userBloc.pageRegister);
            if (userBloc.pageRegister > 0) {
              userBloc.decrementPageRegister();
            } else {
              Navigator.popAndPushNamed(context, '/choice-register');
            }
          },
          child: Row(
            children: [
              Spacer(),
              Icon(
                userBloc.pageRegister > 0 ? Icons.arrow_back : Icons.close,
                color: meuveFonce,
              ),
            ],
          ),
        ),
        leadingWidth: size.width * .1,
        title: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, '/choice-register');
          },
          child: Row(
            children: [
              Text(
                appBlock.langue == 1
                    ? 'Sign in'.toUpperCase()
                    : 'S\'inscrire'.toUpperCase(),
                style:
                    TextStyle(color: meuveFonce, fontSize: size.width * .035),
              ),
              Spacer()
            ],
          ),
        ),
      ),
      backgroundColor: blanc,
      body: ListView(
        children: [
          if (userBloc.pageRegister == 0) const PageORegister(),
          if (userBloc.pageRegister == 1) const Page1Register(),
          if (userBloc.pageRegister == 2) const Page2Register(),
          if (userBloc.pageRegister == 3) const Page3Register(),
        ],
      ),
    );
  }
}
