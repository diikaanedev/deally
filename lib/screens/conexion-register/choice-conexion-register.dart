import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/screens/conexion-register/register.dart';
import 'package:deally/utils/close-app.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:provider/provider.dart';

class ChoiceConexionRegister extends StatelessWidget {
  const ChoiceConexionRegister({super.key});

  @override
  Widget build(BuildContext context) {
    var appBlock = context.read<ApplicationBloc>();
    var userBlock = context.read<UserBlock>();
    return WillPopScope(
      onWillPop: () => onpressKit(context),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: .0,
            elevation: .0,
          ),
          resizeToAvoidBottomInset: true,
          backgroundColor: meuveClair,
          body: Center(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      reverse: false,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * .45,
                            width: MediaQuery.of(context).size.width * .75,
                            decoration: BoxDecoration(
                                color: blanc,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      offset: const Offset(1, 1),
                                      color: Colors.black.withOpacity(.3))
                                ]),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Form(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: constraints.maxHeight * .06,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: constraints.maxWidth * .07,
                                        ),
                                        Icon(
                                          CupertinoIcons.person_alt_circle,
                                          color: noir,
                                          size: constraints.maxHeight * .07,
                                        ),
                                        SizedBox(
                                          width: constraints.maxWidth * .02,
                                        ),
                                        Text(
                                          appBlock.langue == 1
                                              ? 'Login'.toUpperCase()
                                              : 'Se connecter'.toUpperCase(),
                                          style: TextStyle(
                                              color: noir,
                                              fontWeight: FontWeight.w300,
                                              fontSize:
                                                  constraints.maxHeight * .04),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * .05,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: constraints.maxWidth * .03,
                                            ),
                                            Container(
                                              height:
                                                  constraints.maxHeight * .2,
                                              width: constraints.maxWidth * .94,
                                              child: IntlPhoneField(
                                                invalidNumberMessage: appBlock
                                                            .langue ==
                                                        1
                                                    ? 'Invalid Mobile Number'
                                                    : 'Numéro de portable invalide',
                                                onCountryChanged: (value) {
                                                  switch (value.code) {
                                                    case "GN":
                                                      appBlock.setLangue(2);
                                                      break;
                                                    case "CI":
                                                      appBlock.setLangue(2);
                                                      break;
                                                    case "SN":
                                                      appBlock.setLangue(2);
                                                      break;

                                                    default:
                                                      appBlock.setLangue(1);
                                                      break;
                                                  }
                                                  print(appBlock.langue);
                                                },
                                                countries: [
                                                  'SN',
                                                  'GN',
                                                  'NG',
                                                  'CI'
                                                ],
                                                decoration: InputDecoration(
                                                  labelText:
                                                      appBlock.langue == 1
                                                          ? 'Phone Number'
                                                          : 'Téléphone',
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(),
                                                  ),
                                                ),
                                                initialCountryCode: 'GN',
                                                onChanged: (phone) {
                                                  userBlock.setPhone(
                                                      phone.completeNumber);
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * .04,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: constraints.maxWidth * .03,
                                            ),
                                            Container(
                                              width: constraints.maxWidth * .94,
                                              child: PasswordField(
                                                color: noir,
                                                passwordConstraint: '',
                                                onChanged: (value) => userBlock
                                                    .setPassword(value),
                                                inputDecoration:
                                                    PasswordDecoration(
                                                        inputStyle: TextStyle(
                                                  fontSize: 14,
                                                )),
                                                hintText: appBlock.langue == 1
                                                    ? 'Password'
                                                    : 'Mot de passe',
                                                border: PasswordBorder(
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: meuveFonce),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: noir,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        width: 2, color: noir),
                                                  ),
                                                ),
                                                errorMessage: '',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * .03,
                                    ),
                                    // if (isInvalidIdentifiant)
                                    //   Column(
                                    //     children: [
                                    //       Padding(
                                    //         padding: const EdgeInsets.all(8.0),
                                    //         child: Center(
                                    //           child: Text(
                                    //             appBlock.langue == 1
                                    //                 ? 'Incorrect credentials'
                                    //                 : 'Identifiants incorrects',
                                    //             style: TextStyle(color: rouge),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, "/recouver-password");
                                          },
                                          child: Text(
                                            appBlock.langue == 1
                                                ? 'Forgot your password ?'
                                                : 'Mot de passe oublier ?',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: noir.withOpacity(.7),
                                                fontSize:
                                                    constraints.maxHeight *
                                                        .03),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .05,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * .06,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     SizedBox(
                                    //       width: constraints.maxWidth * .04,
                                    //     ),
                                    //     Text(
                                    //       appBlock.langue == 1
                                    //           ? 'Remember me'
                                    //           : 'Se souvenir',
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.w300,
                                    //           fontSize: 12),
                                    //     ),
                                    //     const Spacer(),
                                    //     Container(
                                    //         height: constraints.maxHeight * .06,
                                    //         width: constraints.maxWidth * .2,
                                    //         child: Center(
                                    //             child: Switch(
                                    //                 activeColor: meuveFonce,
                                    //                 value: souvenir,
                                    //                 onChanged: (t) {
                                    //                   setState(() {
                                    //                     souvenir = !souvenir;
                                    //                   });
                                    //                 }))),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: constraints.maxHeight * .06,
                                    // ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: constraints.maxWidth * .03,
                                        ),
                                        Container(
                                            height: constraints.maxHeight * .13,
                                            width: constraints.maxWidth * .94,
                                            child: BtnBorderRound(
                                              haveBg: true,
                                              color: noir,
                                              onTap: () async {
                                                userBlock.setIsLoadingTrue();

                                                await userBlock.conexion();

                                                if (userBlock
                                                        .isInvalidIdentifiant !=
                                                    true) {
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pushNamed(
                                                      context, '/');
                                                }
                                              },
                                              titre: userBlock.isLoding
                                                  ? appBlock.langue == 1
                                                      ? 'Loading ...'
                                                      : 'Chargement ...'
                                                  : appBlock.langue == 1
                                                      ? 'Login'
                                                      : 'Se connecter',
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .13,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .3,
                          width: MediaQuery.of(context).size.width,
                          color: blanc,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Container(
                                    height: 1,
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    color: noir,
                                  ),
                                  Spacer(),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .1,
                                    child: Center(
                                      child: Text(
                                        appBlock.langue == 1 ? 'OR' : 'OU',
                                        style: TextStyle(color: noir),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 1,
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    color: noir,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .03,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: BtnBorderRound(
                                      haveBg: true,
                                      color: noir,
                                      titre: appBlock.langue == 1
                                          ? 'Sing up'
                                          : 'S\'inscrire',
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Register(),
                                          )))),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
