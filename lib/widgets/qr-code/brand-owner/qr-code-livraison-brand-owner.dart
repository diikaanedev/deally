import 'package:deally/models/order-model.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeLivraisonBrandOwner extends StatefulWidget {
  final OrderModel order;
  const QrCodeLivraisonBrandOwner({super.key, required this.order});

  @override
  State<QrCodeLivraisonBrandOwner> createState() =>
      _QrCodeLivraisonBrandOwnerState();
}

class _QrCodeLivraisonBrandOwnerState extends State<QrCodeLivraisonBrandOwner> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * .03,
          ),
          Center(
            child: Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2), color: gris),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Center(
            child: Container(
              height: size.height * .3,
              width: size.width * .65,
              child: Center(
                child: QrImage(
                    data: widget.order.id +
                        widget.order.reference +
                        DateTime.now().toIso8601String()),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'QR code use to track the quality of our services. kindly contact our support if help is needed: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, color: noir, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Tel: (+224) 611 66 57 75'),
              Text('Tel: (+224) 622 65 71 58'),
              SizedBox(
                height: 8,
              ),
              Text('B.djenabou@deally.fr'),
              Text('B.mamadou@deally.fr')
            ],
          ),
          const Spacer(),
          SizedBox(
            height: size.height * .06,
            width: size.width * .9,
            child: BtnBorderRound(
                haveBg: true,
                onTap: () => Navigator.pop(context),
                titre: 'Close'),
          ),
          SizedBox(
            height: size.height * .05,
          )
        ],
      ),
    );
  }
}
