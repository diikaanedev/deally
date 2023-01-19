import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String BASE_URL =
    "https://api.deally.fr/v1/api"; //https://sodidin.laplateforme.cloud/api/
const String BASE_URL_FICHIER = "https://sodidin.laplateforme.cloud";

Future getResponse({
  required String url,
}) async {
  var url1 = BASE_URL + url;

  Uri urlFinal = Uri.parse(url1);
  String token = '';

  await SharedPreferences.getInstance().then((prefs) {
    token = prefs.getString("token") ?? '';
  });
  print(urlFinal);
  print(token);
  return http.get(urlFinal, headers: {
    'Content-Type': 'application/json',
    'authorization': "Bearer $token"
  }).then((value) => json.decode(value.body));
}

Future deleteResponse({
  required String url,
}) async {
  var url1 = BASE_URL + url;

  Uri urlFinal = Uri.parse(url1);
  String token = '';

  await SharedPreferences.getInstance().then((prefs) {
    token = prefs.getString("token") ?? '';
  });
  print(urlFinal);
  print(token);
  return http.delete(urlFinal, headers: {
    'Content-Type': 'application/json',
    'authorization': "Bearer $token"
  }).then((value) => json.decode(value.body));
}

Future putResponse(
    {required String url, required Map<String, dynamic> body}) async {
  var url1 = BASE_URL + url;
  String token = '';

  await SharedPreferences.getInstance().then((prefs) {
    token = prefs.getString("token") ?? '';
  });
  Uri urlFinal = Uri.parse(url1);
  print(urlFinal);
  return http.put(urlFinal, body: json.encode(body), headers: {
    'Content-Type': 'application/json',
    'authorization': "Bearer $token"
  }).then((value) {
    print(value.statusCode);
    return {"body": json.decode(value.body), "status": value.statusCode};
  });
}

Future postResponse(
    {required String url, required Map<String, dynamic> body}) async {
  var url1 = BASE_URL + url;
  print(url1);
  String token = '';

  await SharedPreferences.getInstance().then((prefs) {
    token = prefs.getString("token") ?? '';
  });
  Uri urlFinal = Uri.parse(url1);
  return http.post(urlFinal, body: json.encode(body), headers: {
    'Content-Type': 'application/json',
    'authorization': "Bearer $token"
  }).then((value) {
    print(value.statusCode);
    print(value.body);
    return {"body": json.decode(value.body), "status": value.statusCode};
  });
}

Future postMultipartFile({Uint8List? image}) async {
  String token = '';
  var url1 = BASE_URL + 'upload/';

  await SharedPreferences.getInstance().then((prefs) {
    token = prefs.getString("token")!;
  });

  var request = http.MultipartRequest(
    'POST',
    Uri.parse(url1),
  );

  Map<String, String> headers = {"content": "application/json"};

  request.headers.addAll(headers);
  var multipartFile = await http.MultipartFile.fromBytes(
      'file', image!); //returns a Future<MultipartFile>
  request.files.add(multipartFile);
  http.StreamedResponse response = await request.send();
  final respStr = await response.stream.bytesToString();
  // var jsonData = jsonDecode(respStr);
  print(respStr);
  if (response.statusCode == 200) {
    // success
  } else {
    // error
  }

  // Uint8List imageInUnit8List = image!; // store unit8List image here ;
  // var tempDir = await getTemporaryDirectory();
  // File file = await File('${tempDir.path}/image.png').create();
  // file.writeAsBytesSync(imageInUnit8List);
  // Dio dio = Dio();

  // var formData = FormData.fromMap({
  //   "files": await MultipartFile.fromFile(file.path),
  // });

  // await SharedPreferences.getInstance().then((prefs) {
  //   token = prefs.getString("token")!;
  // });

  // dio
  //     .post(
  //       url1,
  //       options: Options(
  //         contentType: ContentType.parse("application/json").toString(),
  //         headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
  //         followRedirects: false,
  //       ),
  //       data: formData,
  //     )
  //     .then(((value) => print(value)));
}
