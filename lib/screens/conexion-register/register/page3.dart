import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/btn/btn-radio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Page3Register extends StatelessWidget {
  const Page3Register({super.key});

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
        Container(
          // height: size.height * .63,
          child: Column(
            children: [
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .07,
                  ),
                  Text(
                    appBlock.langue == 1
                        ? "My personal information"
                        : "Mes informations personnelles",
                    style: TextStyle(
                        fontSize: size.width * .04,
                        fontWeight: FontWeight.w300,
                        color: meuveFonce),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .07,
                  ),
                  Text(
                    appBlock.langue == 1
                        ? "Make sure your informations are the same as on your ID"
                        : "Assurez-vous que vos informations sont les mêmes que sur votre \npièce d'identité",
                    style: TextStyle(
                        fontSize: size.width * .03,
                        fontWeight: FontWeight.w300,
                        color: noir),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .07,
                  ),
                  Expanded(
                      child: BtnRadio(
                    titre: "Mr",
                    actif: userBloc.sexe == "homme",
                    onTap: () => userBloc.setSexe("homme"),
                  )),
                  Expanded(
                      child: BtnRadio(
                          titre: "Ms",
                          actif: userBloc.sexe == "femme",
                          onTap: () => userBloc.setSexe("femme"))),
                  SizedBox(
                    width: size.width * .07,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Container(
                      height: size.height * .06,
                      width: size.width * .94,
                      child: TextField(
                        onChanged: (value) => userBloc.setFirtsName(value),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: appBlock.langue == 1
                              ? 'Your First Name'
                              : "Prénom",
                          hintText: appBlock.langue == 1
                              ? 'Your First Name'
                              : "Prénom",
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Container(
                      height: size.height * .06,
                      width: size.width * .94,
                      child: TextField(
                        onChanged: (value) => userBloc.setLastName(value),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText:
                              appBlock.langue == 1 ? 'Your Last Name' : 'Nom',
                          hintText:
                              appBlock.langue == 1 ? 'Your Last Name' : 'Nom',
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .07,
                  ),
                  GestureDetector(
                    onTap: () => userBloc.setIsCheckCondition(),
                    child: Container(
                      height: 23,
                      width: 23,
                      // ignore: sort_child_properties_last
                      child: userBloc.isCheckCondition!
                          ? Center(
                              child: Icon(
                                Icons.check,
                                size: 20,
                                color: meuveFonce,
                              ),
                            )
                          : Container(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: meuveFonce, width: 2)),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: size.width * .8,
                    // height: 50,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const PolitiqueConfidentialite()));
                      },
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: noir, fontSize: size.width * .035),
                            children: [
                              TextSpan(
                                  text: appBlock.langue == 1
                                      ? "I accept deally's "
                                      : "J'accepte "),
                              TextSpan(
                                  text: "<<",
                                  style: TextStyle(
                                      fontSize: 10, color: meuveFonce)),
                              TextSpan(
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = () {},
                                  text: appBlock.langue == 1
                                      ? " Terms of Service"
                                      : "les conditions d'utilisation de deally's",
                                  style: TextStyle(
                                      color: meuveFonce,
                                      fontSize: size.width * .035)),
                              TextSpan(
                                  text: ">>",
                                  style: TextStyle(
                                      fontSize: 10, color: meuveFonce)),
                              const TextSpan(text: " & "),
                              TextSpan(
                                  text: " <<",
                                  style: TextStyle(
                                      fontSize: 10, color: meuveFonce)),
                              TextSpan(
                                  // recognizer: TapGestureRecognizer()
                                  //   ..onTap = () {
                                  //     print(
                                  //         "Politique de confidentialité");
                                  //   },
                                  text: appBlock.langue == 1
                                      ? " Privacy Policy"
                                      : "Politique de confidentialité",
                                  style: TextStyle(
                                      color: meuveFonce,
                                      fontSize: size.width * .035)),
                              TextSpan(
                                  text: " >>",
                                  style: TextStyle(
                                      fontSize: 10, color: meuveFonce)),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .07,
                  ),
                  SizedBox(
                    height: size.height * .1,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => userBloc.setIsCheckInformations(),
                          child: Container(
                            height: 23,
                            width: 23,
                            // ignore: sort_child_properties_last
                            child: userBloc.isCheckInformations!
                                ? Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 20,
                                      color: meuveFonce,
                                    ),
                                  )
                                : Container(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: meuveFonce, width: 2)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: size.width * .8,
                    height: size.height * .1,
                    // color: rouge,
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: noir, fontSize: size.width * .035),
                          children: [
                            TextSpan(
                                text: appBlock.langue == 1
                                    ? "Yes, I would like to receive the latest information and offers from"
                                    : "Oui, je souhaite recevoir les dernières informations et offres de"),
                            TextSpan(
                                text: " Deally ",
                                style: TextStyle(color: meuveFonce)),
                            TextSpan(
                                text: appBlock.langue == 1
                                    ? " by e-mail, SMS or any other electronics devices. Unsubscribe possible at any time."
                                    : "par e-mail, SMS ou tout autre appareil électronique. Désinscription possible à tout moment.")
                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .03,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .03,
            ),
            Container(
              height: size.height * .06,
              width: size.width * .94,
              child: BtnBorderRound(
                haveBg: true,
                bgActif: userBloc.lastName!.isNotEmpty &&
                    userBloc.firstName!.length >= 2 &&
                    userBloc.isCheckCondition!,
                onTap: () async {
                  if (userBloc.lastName!.isNotEmpty &&
                      userBloc.firstName!.length >= 2 &&
                      userBloc.isCheckCondition!) {
                    userBloc.setIsLoadingTrue();

                    await userBloc.addUser();
                    print(userBloc.stringConexion);
                    if (userBloc.stringConexion != null) {
                      print("add");
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, '/');
                    } else {
                      print("no add");
                    }
                    userBloc.setIsLoadingFalse();
                  }
                },
                titre: userBloc.isLoding
                    ? appBlock.langue == 1
                        ? 'Loading ...'
                        : 'Chargement ...'
                    : appBlock.langue == 1
                        ? 'Sign up'
                        : "S'inscrire",
              ),
            )
          ],
        ),
      ],
    );
  }
}
