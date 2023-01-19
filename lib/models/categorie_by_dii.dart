class CategorieShopList {
  final String url;
  final String nom;
  final String nomFrench;
  final String id;

  CategorieShopList({
    required this.url,
    required this.nom,
    required this.nomFrench,
    required this.id,
  });

  static CategorieShopList fromJson(dynamic data) {
    return CategorieShopList(
        id: data['_id'],
        nom: data['title'],
        nomFrench: data['tiltleFrench'] ?? "pas de nom",
        url: data['image']['url']);
  }

  static List<CategorieShopList> fromCategorie({required data}) {
    List<CategorieShopList> liste = [];
    for (var item in data) {
      liste.add(fromJson(item));
    }
    return liste;
  }
}
