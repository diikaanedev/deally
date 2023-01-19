class IndicatifByDii {
  final String url;
  final String indicatif;
  final String pays;

  IndicatifByDii({
    required this.url,
    required this.indicatif,
    required this.pays,
  });
}

List<IndicatifByDii> listeIndicatif = [
  IndicatifByDii(
      url: "assets/images/drapeau-nigeria.png",
      indicatif: "+234",
      pays: "Nigéria"),
  IndicatifByDii(
      url: "assets/images/drapeau-senegal.png",
      indicatif: "+221",
      pays: "Sénégal"),
  IndicatifByDii(
      url: "assets/images/drapeau-guinee.png",
      indicatif: "+224",
      pays: "Guinee"),
  IndicatifByDii(
      url: "assets/images/drapeau-cote-ivoire.png",
      indicatif: "+225",
      pays: "Cote d\'ivoire"),
];
