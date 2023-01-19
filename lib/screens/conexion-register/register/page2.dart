import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Page2Register extends StatelessWidget {
  const Page2Register({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var appBlock = context.read<ApplicationBloc>();
    var userBloc = context.watch<UserBlock>();
    return Column(
      children: [
        SizedBox(
          height: size.height * .05,
        ),
        Row(
          children: [
            Spacer(),
            SizedBox(
              width: 8,
            ),
            Container(
              width: size.width * .35,
              decoration: BoxDecoration(
                  color: meuveFonce, borderRadius: BorderRadius.circular(2)),
              height: 5,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              CupertinoIcons.person_alt_circle,
              size: size.width * .05,
              color: meuveFonce,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: size.width * .35,
              decoration: BoxDecoration(
                  color: gris, borderRadius: BorderRadius.circular(2)),
              height: 5,
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              CupertinoIcons.flag,
              size: size.width * .05,
              color: gris,
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .1,
            ),
            Text(
              appBlock.langue == 1 ? '1. My Account' : '1. Mon compte',
              style: TextStyle(fontSize: size.width * .03, color: gris),
            ),
            SizedBox(
              width: size.width * .03,
            ),
            Text(
              appBlock.langue == 1
                  ? '2. My informations'
                  : '2. Mes informations',
              style: TextStyle(fontSize: size.width * .03, color: noir),
            ),
            SizedBox(
              width: size.width * .05,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .05,
        ),
        Container(
          width: size.width,
          color: gris,
          height: 5,
        ),
        SizedBox(
          height: size.height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .07,
            ),
            Text(
              appBlock.langue == 1
                  ? "Enter here the validation code that was sent to \nyou by sms :"
                  : "Renseignez ici le code de validation qui vous a été \nenvoyé par sms :",
              style: TextStyle(
                  fontSize: size.width * .04,
                  fontWeight: FontWeight.w300,
                  color: meuveFonce),
            )
          ],
        ),
        SizedBox(
          height: size.height * .03,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PinFieldAutoFill(
            codeLength: 5,
            currentCode: userBloc.codeSMS,
            onCodeChanged: (value) {
              userBloc.setCodeSms(value!);
            },
            onCodeSubmitted: (value) {
              userBloc.setCodeSms(value);
            },
          ),
        ),
        SizedBox(
          height: size.height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .03,
            ),
            Container(
              height: size.height * .06,
              width: size.width * .94,
              // ignore: sort_child_properties_last
              child: BtnBorderRound(
                haveBg: true,
                bgActif: userBloc.codeSMS.toString().length == 5,
                onTap: () async {
                  await userBloc.verifCode();
                  if (userBloc.codeSMS != "null") {
                    userBloc.incrementPageRegister();
                  } else {
                    print('code invalid');
                  }
                },
                titre: appBlock.langue == 1 ? 'Next' : 'Suivant',
              ),
            )
          ],
        ),
      ],
    );
  }
}
