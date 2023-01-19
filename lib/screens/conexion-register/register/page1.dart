import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:provider/provider.dart';

class Page1Register extends StatelessWidget {
  const Page1Register({super.key});

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
            Icon(
              CupertinoIcons.person_alt_circle,
              size: size.width * .05,
              color: meuveFonce,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: size.width * .7,
              color: gris,
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
              style: TextStyle(fontSize: size.width * .03, color: noir),
            ),
            SizedBox(
              width: size.width * .03,
            ),
            Text(
              appBlock.langue == 1
                  ? '2. My informations'
                  : '2. Mes informations',
              style: TextStyle(fontSize: size.width * .03, color: gris),
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
          height: size.height * .03,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .07,
            ),
            Text(
              appBlock.langue == 1
                  ? "Quick and free to sign up !"
                  : "Inscription rapide et gratuite !",
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
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Container(
                    // height: size.height * .18,
                    width: size.width * .94,
                    child: IntlPhoneField(
                      onCountryChanged: (value) {
                        userBloc.setContry(value.name);
                      },
                      invalidNumberMessage: appBlock.langue == 1
                          ? 'Invalid Mobile Number'
                          : 'Numéro de portable invalide',
                      countries: const ['SN', 'GN', 'NG', 'CI'],
                      decoration: InputDecoration(
                        labelText: appBlock.langue == 1
                            ? 'Phone Number'
                            : 'Téléphhone',
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'GN',
                      onChanged: (phone) =>
                          userBloc.setPhone(phone.completeNumber),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .03,
                  ),
                  SizedBox(
                    width: size.width * .94,
                    child: PasswordField(
                      color: meuveFonce,
                      onChanged: (value) => userBloc.setPassword(value),
                      inputDecoration: PasswordDecoration(
                          inputStyle: const TextStyle(
                        fontSize: 14,
                      )),
                      hintText:
                          appBlock.langue == 1 ? 'Password' : 'Mot de passe',
                      border: PasswordBorder(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: meuveFonce),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: meuveFonce,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(width: 2, color: meuveFonce),
                        ),
                      ),
                      errorMessage: '',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * .03,
                ),
                SizedBox(
                  width: size.width * .94,
                  child: PasswordField(
                    color: meuveFonce,
                    onChanged: (value) => userBloc.setConfirmPassword(value),
                    inputDecoration: PasswordDecoration(
                        inputStyle: const TextStyle(
                      fontSize: 14,
                    )),
                    hintText: appBlock.langue == 1
                        ? 'Confirmation Password'
                        : 'Mot de passe de confirmation',
                    border: PasswordBorder(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: meuveFonce),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: meuveFonce,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(width: 2, color: meuveFonce),
                      ),
                    ),
                    errorMessage: '',
                  ),
                ),
              ],
            ),
          ],
        ),
        if (userBloc.telUse!)
          SizedBox(
            height: size.height * .02,
          ),
        if (!userBloc.telUse!)
          SizedBox(
            height: size.height * .05,
          ),
        if (userBloc.telUse!)
          Row(
            children: [
              SizedBox(
                width: size.width * .07,
              ),
              Text(
                appBlock.langue == 1
                    ? "Phone number already in use !"
                    : "Téléphone déjas utilisé !",
                style: TextStyle(
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.w300,
                    color: rouge),
              )
            ],
          ),
        if (userBloc.telUse!)
          SizedBox(
            height: size.height * .02,
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
                bgActif: userBloc.password == userBloc.confirmPassword &&
                    userBloc.phone!.length > 12,
                onTap: () async {
                  if (userBloc.password == userBloc.confirmPassword &&
                      userBloc.phone!.length > 12) {
                    await userBloc.getCodeUser();

                    if (userBloc.codeSMS != "") {
                      userBloc.incrementPageRegister();
                    } else {
                      userBloc.setTelUse();
                    }
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
