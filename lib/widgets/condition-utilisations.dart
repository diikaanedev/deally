import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ConditionUtilisationScreen extends StatelessWidget {
  final String title;
  final Color color;
  const ConditionUtilisationScreen(
      {super.key, required this.title, this.color = const Color(0xff9D0208)});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: color,
        elevation: .2,
        title: Text(title),
      ),
      body: Center(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  """
    1. Introduction
    2. Inscription et compte
    3. Conditions générales de vente
    4. Backs et remboursements
    5. Paiements
    6. Règles concernant votre contenu
    7. Nos droits d'utilisation de votre contenu
    8. Utilisation du site Web et des applications mobiles
    9. Propriété intellectuelle (Copyright) et marques déposées
    10. Protection des données
    11. Contrôle raisonnable et droits d'audit
    12. Rôle de SODIDIN en tant que Marketplace
    13. Limitations et exclusions de responsabilité
    14. Indemnisation
    15. Violation des présentes conditions générales
    16. Intégralité de l'accord
    17. Hiérarchie
    18. Modification
    19. Divisibilité
    20. Cession
    21. Droits des tiers
    22. Loi applicable et juridiction
    23. Les coordonnées de notre société
    1. Introduction
      1. FLASHSTORES SAS (« SODIDIN » ou « nous » ou« notre ») exploite une plate-forme de commerce électronique composée d'un site Web et d'une application mobile (ci-après désignée par le terme«Marketplace »), ainsi qu'une infrastructure de services logistiques et de paiement, pour la vente et l'achat de divers produits de consommation en Côte d’Ivoire («Territoire»).
      2. Ces Conditions Générales s'appliquent aux acheteurs et aux vendeurs sur la Marketplace et régissent leur utilisation de la Marketplace et de tous les services associés.
      3. En utilisant notre Marketplace, vous acceptez ces conditions générales dans leur intégralité. Si vous n'êtes pas d'accord avec ces conditions générales ou une partie de ces conditions générales, dans ce cas, vous ne devez pas utiliser notre Marketplace.
      4. Si vous utilisez notre Marketplace dans le cadre d'une entreprise ou d'un quelconque autre projet commercial, vous:
        1. confirmez que vous avez obtenu l'autorisation nécessaire pour accepter les présentes conditions générales;
        2. vous engagez, ainsi que la personne, la société ou toute autre entité juridique qui exploite cette entreprise ou ce projet commercial, à respecter les présentes conditions générales; et
        3. acceptez que le terme «vous», utilisé dans les présentes conditions générales fasse référence à la fois à l'utilisateur individuel et à la personne, à la société ou à l'entité juridique concernée, sauf indication contraire du contexte.
    2. Inscription et compte
        1. Vous ne pouvez pas vous inscrire sur notre Marketplace si vous avez moins de 18 ans (en utilisant notre Marketplace ou en acceptant les présentes conditions générales, vous nous garantissez et déclarez que vous avez au moins 18 ans).
        2. Vous pouvez vous inscrire à un compte sur notre Marketplace en remplissant et en soumettant le formulaire d’inscription disponible sur notre Marketplace.
        3. Vous déclarez et garantissez que toutes les informations fournies dans le formulaire d'inscription sont complètes et exactes.
        4. Si vous vous inscrivez pour la création d’un compte sur notre Marketplace, il vous sera demandé de fournir un numéro de téléphone / ID (nom d’utilisateur) et mot de passe, et vous acceptez de:
          1. garder votre mot de passe confidentiel;
          2. nous informer immédiatement par écrit (en utilisant nos coordonnées fournies à la section 23 ci-dessous), si vous avez connaissance d'une divulgation de votre mot de passe; et
          3. être responsable de toute activité sur notre Marketplace résultant d'un manquement à la confidentialité de votre mot de passe, et que vous puissiez être tenu responsable de toute perte résultant d'un tel manquement.
        5. Votre compte doit être utilisé exclusivement par vous et vous ne devez en aucun cas transférer votre compte à un tiers. Si vous autorisez un tiers à gérer votre compte en votre nom, cela se fera à vos propres risques et périls.
        6. Nous pouvons suspendre ou annuler votre compte, et / ou modifier les détails de votre compte, à tout moment, à notre seule discrétion et sans préavis ni explication, à condition que si nous annulons des produits ou des services que vous avez déjà payés mais que vous n’avez pas encore reçus, et qu’à condition que vous n'ayez pas enfreint les présentes conditions générales, nous nous engageons à vous rembourser le montant que vous avez payé.
        7. Vous pouvez, à tout moment, vous désinscrire et supprimer votre compte sur notre Marketplace, en nous contactant aux coordonnées indiquées à la section 23 ci-dessous.
    3. Conditions Générales de Vente
      1. Vous reconnaissez et acceptez que:
        1. notre Marketplace offre un lieu de rencontre en ligne et de facilitation des transactions pour les vendeurs afin de lister et de vendre leurs produits sur notre Marketplace, et pour les acheteurs afin d’acheter les produits proposés par les vendeurs;
        2. nous acceptons et faisons en sorte de faciliter les transactions et la finalisation des ventes sur notre Marketplace, pour le compte des vendeurs, toutefois, SODIDIN n'est pas partie à la transaction entre le vendeur et l'acheteur. Par conséquence, un contrat de vente est formé uniquement entre l’acheteur et le vendeur et SODIDIN n’assume aucune responsabilité découlant de ce contrat de vente; et
        3. un contrat pour la vente et l'achat d'un ou de plusieurs produits entrera en vigueur entre l’acheteur et le vendeur, et en conséquence vous vous engagez à acheter ou vendre le ou les produits concernés, dès la confirmation d'achat par l'acheteur via notre Marketplace.
      2. Sous réserve des présentes conditions générales, les conditions commerciales du vendeur régissent le contrat de vente et d'achat entre l'acheteur et le vendeur. Nonobstant ce qui précède, les dispositions suivantes seront incorporées dans le contrat de vente et d'achat entre l'acheteur et le vendeur:
        1. le prix de tout produit sera celui indiqué dans la liste et le descriptif du produit concerné;
        2. le prix de tout produit doit inclure toutes les taxes et être conforme aux lois applicables en vigueur dans le Territoire;
        3. les frais de livraison, les frais d'emballage, les frais de manutention, les frais administratifs, les frais d'assurance, les autres frais et charges accessoires ne seront à la charge de l'acheteur que si cela est expressément et clairement indiqué dans la liste et le descriptif des produits concernés;
        4. les produits concernés doivent être de bonne qualité, adaptés et sûrs pour tout usage spécifié dans le descriptif des produits et conformes à tous les aspects matériels, ainsi que toute autre description des produits fournie ou mis à disposition de l'acheteur par le vendeur; et
        5. le vendeur garantit qu’il détient un titre de propriété et est le seul propriétaire légal et bénéficiaire des produits qu’il vend et ces produits ne sont soumis à aucun droit des tiers ou restriction ou prohibition, y compris en ce qui concerne les droits de propriété intellectuelle et / ou toute enquête ou procédure pénale, d'insolvabilité ou fiscale.
    4. Backs et remboursements
      1. Les Backs de produits par les acheteurs et l'acceptation des produits Backnés par les vendeurs seront gérés par nous conformément aux conditions définies à la « page des Backs » disponible sur notre Marketplace, qui peut être modifiée de temps à autre. L'acceptation des Backs sera à notre discrétion, sous réserve du respect des lois applicables dans le Territoire.
      2. Les remboursements concernant les produits Backnés seront gérés conformément aux conditions définies à la « page des remboursements » disponible sur notre Marketplace, qui peut être modifiée de temps à autre. Nos règles sur les remboursements seront exercées à notre discrétion, sous réserve du respect des lois applicables dans le Territoire. Nous pouvons offrir des remboursements, à notre discrétion:
      1. en ce qui concerne le prix du produit concerné par le remboursement;
      2. les frais d'expédition locaux et / ou internationaux (comme indiqué sur la page des remboursements sur notre Marketplace); et
      3. au moyen de crédits en boutique, de remboursements de portefeuille, de bons d’achat (vouchers), d'un transfert d'argent via mobile money et ou mobile bank, de virements bancaires ou de tout autre moyen que nous pouvons déterminer de temps à autre.
      4. Les produits Backnés seront acceptés et les remboursements seront effectués par SODIDIN, pour et au nom du vendeur.
      5. Les modifications apportées à notre « page des Backs » ou à la « page des remboursements » disponibles sur notre Marketplace, seront effectives et s'appliqueront à tous les achats effectués à partir de la date de publication de ladite modification sur notre site Web.
    5. Paiements
      1. Vous devez effectuer les paiements dus en vertu des présentes conditions générales conformément aux Informations et Directives sur les Paiements disponibles sur notre Marketplace.
    6. Règles concernant votre contenu
      1. Dans les présentes conditions générales, "votre contenu" signifie:
      1. tous les éléments, travaux et matériaux (y compris, sans s'y limiter, les textes, les graphiques, les images, le matériel audio, le matériel vidéo, le matériel audiovisuel, les scripts, les logiciels et les fichiers) que vous nous soumettez à nous ou à notre Marketplace pour stockage ou publication, traitement ou transmission ultérieure ; et
      2. toutes les communications sur notre Marketplace, y compris les avis sur les produits, les remarques et les commentaires.
      3. Votre contenu et l'utilisation de votre contenu par nous, conformément aux présentes conditions générales, doit être exact, complet et authentique.
      4. Votre contenu doit être approprié, civil et de bon goût, et être conforme aux normes d'éthique et de comportement généralement acceptés sur Internet, et ne doit pas:
        1. être offensant, obscène, indécent, pornographique, suggestif ou sexuellement explicite;
        2. dépeindre la violence de manière explicite, graphique ou gratuite; ou
        3. être blasphématoire, en violation de la législation sur la haine raciale ou religieuse ou la discrimination;
        4. être trompeur, frauduleux, menaçant, abusif, harcelant, antisocial, haineux, discriminatoire ou incendiaire;
        5. causer de la gêne, des désagréments ou une anxiété inutile à quiconque; ou
        6. constitue un spam.
        7. Votre contenu ne doit pas être illégal ou illicite, porter atteinte aux droits légaux de toute personne ou être susceptible de donner lieu à des poursuites judiciaires contre toute personne (dans chaque cas dans n'importe quelle juridiction et en vertu de toute loi applicable). Votre contenu ne doit pas enfreindre ni violer:
          1. tout droit d'auteur, droit moral, droit de base de données, droit de marque, droit de conception de dessins et modèles, droit de substitution ou tout autre droit de propriété intellectuelle;
          2. tout droit de confidentialité, droit à la vie privée ou droit en vertu de la législation sur la protection des données;
          3. toute obligation contractuelle due à toute personne; ou
          4. toute ordonnance du tribunal et décision judiciaire.
        5. Vous ne devez pas utiliser notre Marketplace pour créer un lien vers un site Web ou une page Web consistant en ou contenant un élément ou contenu qui, s'il était affiché sur notre Marketplace, violerait les dispositions des présentes conditions générales.
        6. Vous ne devez pas soumettre à notre Marketplace tout matériel ou contenu qui fait ou a déjà fait l'objet de menaces ou de réelles poursuites judiciaires ou de toute autre plainte similaire.
        7. La fonction qui permet aux utilisateurs sur notre Marketplace de donner leur avis et commentaires peut être utilisée pour faciliter les évaluations des acheteurs sur les produits. Vous ne devez pas utiliser ladite fonction ou toute autre forme de communication pour fournir des critiques et/ou des avis inexacts, inauthentiques ou faux.
        8. Vous ne devez pas interférer avec une transaction en: (i) contactant un autre utilisateur pour acheter ou vendre un article listé sur notre Marketplace en dehors de notre Marketplace; ou (ii) communiquer avec un utilisateur impliqué dans une transaction active ou terminée pour l'avertir d’éviter un acheteur, un vendeur ou un article particulier; ou (iii) contacter un autre utilisateur avec l'intention de collecter des paiements.
        9. Vous reconnaissez que tous les utilisateurs de notre Marketplace sont seuls responsables des interactions avec les autres utilisateurs et vous devez faire preuve de prudence et de bon jugement dans votre communication avec les utilisateurs. Vous ne devez pas leur envoyer des informations personnelles, y compris les détails de votre carte de crédit et tout moyen de paiement.
        10. Nous pouvons examiner périodiquement votre contenu et nous nous réservons le droit de supprimer tout contenu à notre discrétion pour quelque raison que ce soit.
        11. Si vous avez connaissance de tout élément, contenu ou activité illégale et illicite sur notre Marketplace, ou de tout élément, contenu ou activité qui enfreint les présentes conditions générales, vous pouvez nous en informer en nous contactant aux coordonnées définies à la section 23 ci-dessous.
    7. Nos droits d’utilisation de votre contenu
        1. Vous nous accordez une licence mondiale, irrévocable, non exclusive et libre des redevances des droits d'utilisation, de reproduction, de stockage, d'adaptation, de publication, de traduction et de distribution de votre contenu sur nos canaux de commercialisation et marketing et tout autre support existant ou futur.
        2. Vous nous accordez le droit de sous-licencier les droits concédés en vertu de l'article 7.1.
        3. Vous nous accordez le droit d'intenter une action pour violation des droits concédés en vertu de l'article 7.1.
        4. Vous renoncez par la présente à tous vos droits moraux sur votre contenu dans la limite autorisée par la loi applicable; et vous garantissez et déclarez que tous les autres droits moraux sur votre contenu ont fait l’objet d’une renonciation dans la mesure maximale autorisée par la loi applicable.
        5. Sans préjudice de nos autres droits en vertu des présentes conditions générales, si vous enfreignez nos règles sur le contenu de quelque manière que ce soit, ou si nous soupçonnons raisonnablement que vous avez enfreint nos règles sur le contenu, nous pouvons supprimer, annuler la publication ou modifier tout ou partie de votre contenu.
    8. Utilisation du site Web et des applications mobiles
        1. Dans cette section 8, les mots «Marketplace» et «site Web» doivent être utilisés de manière interchangeable pour désigner les sites Web et les applications mobiles de SODIDIN.
        2. Vous pouvez:
            1. afficher les pages de notre site Web dans un navigateur Web;
            2. télécharger des pages de notre site Web pour la mise en cache dans un navigateur Web;
            3. imprimer des pages de notre site Web pour votre usage personnel et non commercial, à condition que cette impression ne soit pas systématique ou excessive;
            4. diffuser des fichiers audio et vidéo à partir de notre site Web à l'aide du lecteur multimédia de notre site Web; et
            5. utiliser nos services de Marketplace au moyen d’un navigateur Web, sous réserve du respect des autres dispositions des présentes conditions générales.
        3. Sauf dans les cas expressément autorisés par la section 8.2 ou les autres dispositions des présentes conditions générales, vous ne devez télécharger aucun élément de notre site Web ni enregistrer un tel élément sur votre ordinateur.
        4. Vous ne pouvez utiliser notre site Web qu'à des fins personnelles et professionnelles pour vendre ou acheter des produits sur notre Marketplace.
        5. Sauf dans les cas expressément autorisés par les présentes conditions générales, vous ne devez pas éditer ou modifier, de quelque manière que ce soit, tout élément ou contenu sur notre site Web.
        6. À moins que vous ne possédiez ou ne contrôliez des droits réels et pertinents sur le matériel ou le contenu en question, vous ne devez pas:
            1. republier le contenu ou le matériel de notre site Web (y compris la republication sur un autre site Web);
            2. vendre, louer ou concéder en sous-licence du contenu ou du matériel de notre site Web;
            3. montrer tout matériel ou contenu de notre site Web en public;
            4. exploiter le matériel ou contenu de notre site Web à des fins commerciales; ou
            5. redistribuer le matériel ou le contenu de notre site Web.
        7. Nonobstant la section 8.6, vous pouvez transmettre des liens vers des produits sur notre site Web et redistribuer notre bulletin d'information (newsletter) et notre matériel promotionnel sous forme imprimée et électronique à toute personne.
        8. Nous nous réservons le droit de suspendre ou de restreindre l'accès à notre site Web, à certaines parties de notre site Web et / ou aux fonctionnalités de notre site Web. Nous pouvons, par exemple, suspendre l'accès au site Web pendant la maintenance du serveur ou lorsque nous mettons à jour le site Web. Vous ne devez pas contourner, ou tenter de contourner, toute mesure de restriction d'accès sur le site Web.
        9. Vous ne devez pas:
            1. utiliser notre site Web de quelque manière que ce soit ou prendre des mesures qui causent ou peuvent causer des dommages au site Web ou une altération des performances, de la disponibilité, de l'accessibilité, de l'intégrité ou de la sécurité du site Web;
            2. utiliser notre site Web d'une manière contraire à l'éthique, illégale, illicite, frauduleuse ou nuisible, ou en relation avec un but ou une activité illégale, illicite, frauduleuse ou nuisible;
            3. pirater ou altérer par tout autre moyen notre site Web;
            4. sonder, scanner ou tester la vulnérabilité de notre site Web sans notre permission;
            5. contourner tout système ou processus d'authentification ou de sécurité sur notre site Web ou en relation avec ce dernier;
            6. utiliser notre site Web pour copier, stocker, héberger, transmettre, envoyer, utiliser, publier ou distribuer tout matériel ou contenu constitué de (ou lié à) tout logiciel espion, virus informatique, cheval de Troie, ver, enregistreur de frappe, rootkit ou tout autre logiciel informatique malveillant ;
            7. imposer une charge déraisonnablement élevée sur les ressources de notre site Web (y compris la bande passante, la capacité de stockage et la capacité de traitement);
            8. déchiffrer ou décrypter toute communication envoyée par ou vers notre site Web sans notre permission;
            9. mener des activités de collecte de données systématiques ou automatisées (y compris, sans limitation, le grattage, l'exploration de données, l'extraction de données et la collecte de données) sur ou en relation avec notre site Web sans notre consentement écrit exprès;
            10. accéder à notre site Web ou interagir autrement avec lui à l'aide de tout robot, araignée ou tout autre moyen automatisé, sauf à des fins d'indexation des moteurs de recherche;
            11. utiliser notre site Web sauf au moyen de nos interfaces publiques;
            12. enfreindre les directives énoncées dans le fichier robots.txt de notre site Web;
            13. utiliser les données collectées sur notre site Web pour toute activité de marketing direct (y compris, sans limitation, le marketing par courrier électronique, le marketing par SMS, le télémarketing et le publipostage); ou
            14. faire tout ce qui interfère avec l'utilisation normale de notre site Web.
    9. Propriété intellectuelle (Copyright) et marques déposées
        1. Sous réserve des dispositions expresses des présentes conditions générales:
            1. nous, avec nos concédants de licence, détenons et contrôlons tous les droits d'auteur et autres droits de propriété intellectuelle sur notre site Web ainsi que sur le matériel et tout contenu sur notre site Web; et
            2. tous les droits d'auteur et autres droits de propriété intellectuelle sur notre site Web ainsi que le matériel et contenu sur notre site Web sont réservés.
        2. Les logos de SODIDIN et nos autres marques déposées et non déposées sont des marques qui nous appartiennent; nous n'accordons aucune autorisation pour l'utilisation de ces marques, et une telle utilisation peut constituer une violation de nos droits.
        3. Les marques commerciales ou marques de service enregistrées et non enregistrées par des tiers sur notre site Web appartiennent à leurs propriétaires respectifs et nous n'endossons pas et nous ne sommes affiliés à aucun des titulaires de ces droits et, en tant que tels, nous ne pouvons accorder aucune licence pour exercer de tels droits.
    10. Protection des données
        1. Les acheteurs acceptent le traitement de leurs données personnelles conformément aux conditions de la politique de confidentialité et de protection des données, et de la notification relative aux cookies de SODIDIN, accessibles sur notre Marketplace.
        2. SODIDIN traitera toutes les données personnelles obtenues via la Marketplace et les services associés conformément aux termes de notre Politique de confidentialité et de protection des données et de la notification relative aux Cookies.
        3. Les vendeurs sont directement responsables envers les acheteurs de toute utilisation abusive de leurs données personnelles et SODIDIN n'assume aucune responsabilité envers les acheteurs en ce qui concerne toute utilisation abusive de leurs données personnelles par les vendeurs.
    11. Contrôle raisonnable et droits d'audit
        1. Nous avons mis en place un programme de conformité de lutte contre le blanchiment d'argent et nous nous réservons le droit d'effectuer des vérifications de diligence raisonnable sur tous les utilisateurs de notre Marketplace.
        2. Vous vous engagez à nous fournir toutes les informations, documents et accès à vos locaux commerciaux dont nous pouvons avoir besoin:
            1. afin de vérifier votre adhésion et l'exécution de vos obligations en vertu du présent Accord;
            2. aux fins de divulgation, en vertu d’une ordonnance valide d'un tribunal ou d'un autre organisme gouvernemental; ou
            3. dans la mesure où la loi ou la réglementation applicable l’exige.
    12. Le rôle de SODIDIN en tant que Marketplace
        1. Vous reconnaissez que:
            1. nous ne confirmons pas l'identité de tous les utilisateurs de notre Marketplace, nous ne vérifions pas leur solvabilité ou leur bonne foi, et dans tous les cas, nous ne les contrôlons pas;
            2. nous ne vérifions pas, nous n’auditons pas et nous ne contrôlons pas toutes les informations contenues dans les listes et les descriptifs des produits vendus sur notre Marketplace ;
            3. nous ne sommes partie à aucun contrat de vente ou d'achat de produits listés sur la Marketplace, dans la mesure où notre rôle est de faciliter les transactions réalisées entre les acheteurs et les vendeurs. Par conséquent, nous n’assumons aucune responsabilité ayant pour origine un tel contrat de vente et nous ne sommes ni l’agent ni le mandataire des vendeurs et ces derniers sont responsables des ventes des produits et des réclamations ou tout autre problème survenant ou lié au contrat de vente entre eux et les acheteurs;
            4. nous ne sommes impliqués dans aucune transaction entre un acheteur et un vendeur de quelque manière que ce soit, sauf que nous facilitons les transactions sur la Marketplace pour les acheteurs et les vendeurs et traitons les paiements et le cas échéant la  livraison au nom des vendeurs;
            5. nous ne sommes pas les agents ou mandataires des acheteurs ou des vendeurs, et en conséquence, nous ne serons pas responsables envers quiconque en ce qui concerne l'offre de vente, la vente ou l'achat de tout produit annoncé et listé sur notre Marketplace; en outre, nous ne sommes pas responsables de l'exécution des obligations contractuelles découlant d'un contrat de vente ou d'achat de tout produit et nous n'aurons aucune obligation de médiation entre les parties à un tel contrat.
        2. Nous ne garantissons ni ne représentons:
            1. l'exhaustivité ou l'exactitude des informations publiées sur notre Marketplace;
            2. que toute information, élément ou contenu publié sur notre Marketplace est à jour;
            3. que notre Marketplace fonctionnera sans faute ou erreur en tout temps; ou
            4. que notre Marketplace ou tout service sur notre Marketplace restera disponible en tout temps.
        3. Nous nous réservons le droit d'interrompre, de discontinuer ou de modifier tout ou partie de nos services disponibles sur notre Marketplace, et de cesser de publier sur notre Marketplace, à tout moment à notre seule discrétion, sans préavis ni explication; et vous n'aurez droit à aucune compensation ou autre paiement en cas d'interruption, de discontinuité, de modification ou d’altération des services sur la Marketplace, ou si nous cessons de publier la Marketplace.
        4. Nous ne garantissons aucun résultat commercial concernant l'utilisation de notre Marketplace.
        5. Dans la mesure maximale autorisée par la loi applicable et sous réserve de la section 13.1 ci-dessous, nous excluons toutes les déclarations et garanties relatives à l'objet des présentes conditions générales, de notre Marketplace et de l'utilisation de notre Marketplace.
    13. Limitations et exclusions de responsabilité
        1. Rien dans les présentes conditions générales ne viendra:
            1. limiter toute responsabilité d'une manière non autorisée par la loi applicable; ou
            2. exclure toute responsabilité ou tout droit légal qui ne peut être exclu en vertu de la loi applicable.
        2. Les limitations et exclusions de responsabilité énoncées dans la présente section 13 et ailleurs dans les présentes conditions générales:
            1. sont soumises aux dispositions de la section 13.1; et
            2. régissent toutes les responsabilités découlant des présentes conditions générales ou liées à l'objet des présentes conditions générales, y compris les responsabilités contractuelles, responsabilité délictuelle (y compris la négligence) et pour manquement à une obligation légale, sauf dans la mesure où les présentes conditions générales en disposent expressément autrement.
        3. En ce qui concerne les services qui vous sont offerts gratuitement, nous ne serons pas responsables envers vous de toute perte ou dommage de quelque nature que ce soit.
        4. Notre responsabilité globale envers vous en ce qui concerne tout contrat visant à vous fournir des services en vertu des présentes conditions générales, ne doit pas dépasser le montant total payé et payable à nous en vertu dudit contrat. Chaque transaction distincte sur notre Marketplace constitue un contrat distinct aux fins de la présente section 13.4.
        5. Nonobstant la section 13.4 ci-dessus, nous ne serons pas responsables envers vous de toute perte ou dommage de quelque nature que ce soit, y compris en ce qui concerne:
            1. toute perte occasionnée par une interruption ou un dysfonctionnement du site Web;
            2. toute perte découlant d'un événement ou de plusieurs événements hors de notre contrôle raisonnable;
            3. toute perte commerciale, y compris (sans limitation) la perte des bénéfices ou dommages sur les profits, des revenus, des recettes de l'utilisation, de la production, des économies anticipées, des affaires,des contrats, des opportunités commerciales ou des fonds de commerce;
            4. toute perte ou corruption de toute donnée, base de données ou logiciel; ou
            5. toute perte ou dommage spécial, indirect ou consécutif.
        6. Nous acceptons que nous avons un intérêt à limiter la responsabilité personnelle de nos dirigeants et employés et, eu égard à cet intérêt, vous reconnaissez que nous sommes une entité à responsabilité limitée; vous acceptez de ne pas porter plainte personnellement contre nos dirigeants ou employés pour toute perte que vous subissez en rapport avec l’utilisation de notre Marketplace ou les présentes conditions générales (cela ne limitera ni n'exclura la responsabilité de l'entité à responsabilité limitée elle-même pour le actes et omissions de nos dirigeants et employés).
        7. Notre Marketplace comprend des liens hypertexte vers d'autres sites Web détenus et exploités par des tiers; ces liens hypertexte ne sont pas des recommandations. Nous n'avons aucun contrôle sur les sites Web tiers et leur contenu, et nous déclinons toute responsabilité à leur égard ou pour toute perte ou dommage pouvant résulter de leur utilisation.
    14. Indemnisation
        1. Par la présente, vous nous indemnisez et vous vous engagez à nous tenir indemnisés contre:
            1. toutes les pertes, dommages, coûts, responsabilités et dépenses (y compris, sans limitation, les frais de justice et tous les montants payés par nous à un tiers en règlement d'une réclamation ou d'un litige) encourus ou subis par nous et résultant directement ou indirectement de votre utilisation de notre Marketplace ou de toute violation par vous de toute disposition des présentes conditions générales ou des codes, politiques ou directives de SODIDIN; et
            2. toute responsabilité en matière de TVA ou autre responsabilité en matière fiscale que nous pourrions encourir en relation avec toute vente, fourniture ou achat effectué via notre Marketplace, lorsque cette responsabilité découle de votre défaut de paiement, de retenue, de déclaration ou d'enregistrement pour le paiement de toute TVA ou autre taxe dûment due dans une quelconque juridiction.
    15. Violation des présentes conditions générales
        1. Si nous autorisons la création et l'enregistrement d'un compte sur notre Marketplace, celui-ci restera ouvert indéfiniment, sous réserve des présentes conditions générales.
        2. Si vous enfreignez les présentes conditions générales ou si nous soupçonnons raisonnablement que vous avez enfreint les présentes conditions générales ou tout code, politique ou directive de SODIDIN de quelque manière que ce soit, nous nous réservons le droit de:
            1. suspendre temporairement votre accès à notre Marketplace;
            2. vous interdire définitivement l'accès à notre Marketplace;
            3. empêcher les ordinateurs utilisant votre adresse IP d'accéder à notre Marketplace;
            4. contacter l’un ou l’ensemble de vos fournisseurs de services Internet et leur demander de bloquer votre accès à notre Marketplace;
            5. suspendre ou supprimer votre compte sur notre Marketplace; et / ou intenter une action en justice contre vous, que ce soit pour rupture de contrat ou autre.
        3. Lorsque nous suspendons, interdisons ou bloquons votre accès à notre Marketplace ou à une partie de notre Marketplace:
            1. vous ne devez prendre aucune mesure pour contourner une telle suspension, interdiction ou blocage (y compris, sans limitation, la création et / ou l'utilisation d'un compte différent).
    16. Intégralité de l’accord
        1. Les présentes conditions générales, et les codes, politiques et directives de SODIDIN accessibles sur notre Marketplace (et en ce qui concerne les vendeurs : les conditions générales applicables au vendeur) constituent l'intégralité de l'accord entre vous et nous en ce qui concerne votre utilisation de notre Marketplace et remplacent tous les accords précédents entre vous et nous en ce qui concerne votre utilisation de notre Marketplace.
    17. Hiérarchie
        1. En cas de conflit entre les présentes conditions générales, les conditions générales du vendeur et les codes, politiques et directives de SODIDIN, les présentes conditions générales, les conditions générales du vendeur et les codes, politiques et directives de SODIDIN prévaudront dans l'ordre indiqué ici.
    18. Modification
        1.  Nous pouvons réviser les présentes conditions générales, les conditions générales du vendeur et les codes, politiques et directives de SODIDIN de temps à autre.
        2.  Les conditions générales révisées s'appliquent à compter de la date de leur publication sur notre Marketplace.
    19. Divisibilité
        1.  Si une disposition des présentes conditions générales est jugée par un tribunal ou une autre autorité compétente comme étant illégale et/ou inapplicable, les autres dispositions resteront en vigueur.
        2.  Si une disposition illégale et/ou inapplicable des présentes conditions générales deviendrait légale ou applicable si une partie de celle-ci était supprimée, cette partie sera considérée comme supprimée, et le reste de la disposition continuera à produire ses effets.
    20. Cession
        1.  Vous acceptez par les présentes que nous puissions céder, transférer, sous-traiter ou traiter de toute autre manière nos droits et/ou obligations en vertu des présentes conditions générales
        2.  Vous ne pouvez pas, sans notre consentement écrit préalable, céder, transférer, sous-traiter ou traiter de toute autre manière vos droits et/ou obligations en vertu des présentes conditions générales.
    21. Droits des tiers
        1. Un contrat conclu dans le cadre des présentes conditions générales est à notre avantage et à votre avantage, et n'est pas destiné à bénéficier à un tiers ou à être exécutoire par un tiers.
        2. L'exercice des droits des parties dans le cadre d'un contrat conclu en vertu des présentes conditions générales n'est soumis au consentement d'aucun tiers.
    22. Loi applicable et juridiction
        1. Les présentes conditions générales sont régies et interprétées conformément au droit du Territoire.
        2. Tout litige relatif aux présentes conditions générales est soumis à la compétence exclusive des tribunaux compétents du Territoire.
    23. Les Coordonnées de notre société
        1. La Marketplace SODIDIN est exploitée par : FLASHSTORES SAS Au capital de 1 000 EUROS, Dont le siège social est au 52 Rue de Roubaix, 59200 Tourcoing, France Immatriculée au RCCM sous le numéro Vous pouvez nous contacter en utilisant notre formulaire de contact disponible sur notre Site web.
  
                """,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: noir,
                      letterSpacing: -0.1),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
