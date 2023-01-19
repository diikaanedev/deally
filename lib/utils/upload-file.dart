import 'dart:convert';
import 'dart:io';

import 'package:deally/utils/requette-by-dii.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getImage(int source) async => ImagePicker.platform
        .getImage(
            imageQuality: 100,
            source: source == 1 ? ImageSource.gallery : ImageSource.camera)
        .then((value) async {
      return [await postpIC(image: value!), await value.readAsBytes()];
    });

Future<String> postpIC({required XFile image}) async {
  print("eeeeee");

  var img = await (image).readAsBytes();

  Map<String, dynamic> body = {
    "image": "data:image/webp;base64,${base64Encode(img)}"
  };

  var response = await postResponse(url: '/files', body: body);

  print(response['body']);
  print(response['status']);
  if (response['status'] == 200) {
    return response['body']['data']['_id'];
  } else {
    print("response zerrrr");
    return "0";
  }
}
