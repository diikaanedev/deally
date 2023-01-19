// ignore: file_names
String priceFormatByDii(int price) {
  String v = price.toString();
  print(v);
  int d = v.length;

  List priceTab = [];

  for (var i = d; i > 0; i--) {
    print("priceFormatByDii");
    print(i);
    print(v[i - 1]);
    if (i % 3 == 0) {
      priceTab.add(v[i - 1]);
      priceTab.add(',');
    } else {
      priceTab.add(v[i - 1]);
    }
  }

  return priceTab.reversed.join();
}

String priceDevice(String contry) {
  switch (contry) {
    case 'Nigeria':
      return 'NGN';
    case 'Guinee':
      return 'GNF';
    default:
      return 'FCFA';
  }
}
