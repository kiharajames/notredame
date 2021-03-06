import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:flutter/services.dart';
import 'package:notredame/includes/public.dart';
import 'package:path_provider/path_provider.dart';

class Prier extends StatefulWidget {
  const Prier({Key? key}) : super(key: key);

  @override
  _PrierState createState() => _PrierState();
}

class _PrierState extends State<Prier> {
  int _selectedIndex = 0;
  Directory? mydir;
  int loadingDone = 0;

  Future getDir() async {
    final dir = await getApplicationDocumentsDirectory();
    setState(() {
      mydir = dir;
      loadingDone = 1;
    });
    return dir;
  }

  @override
  void initState() {
    super.initState();
    getDir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(
          'Prier le Rosaire avec Ozias Leduc',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  color: colorPrimaryAlt,
                  textColor: white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/entendre_tout');
                  },
                  child: Row(
                    children: [
                      Icon(Icons.play_arrow),
                      Text(
                        'ENTENDRE TOUT',
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            loadingDone == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/annonciation.mp3',
                          videoFile: '${mydir?.path}/1-annonciation.mp4',
                          textNo: 1,
                          minAudio: 1,
                          maxAudio: 5,
                          title: "L'Annonciation",
                          audioText: Text(
                              'Comment ??a s???est pass?? r??ellement, pour toi, cette rencontre avec l???ange? Je sais bien, moi, qu???il y a toujours un d??calage entre ce qu\'on entend et ce qu\'on comprend. D\'ailleurs, peut-on r??ellement rencontrer un ange? Si c???est possible, alors j???en ai s??rement crois?? quelques-uns moi-m??me. Dis donc, avais-tu d??j?? enlev?? tes sandales, ou les as-tu plut??t retir??es au moment de l\'apparition de l\'ange? C\'est ce qu\'avait d?? faire Mo??se en pr??sence du Tout-Puissant. C???est ce qu???on fait dans un lieu saint. Et cette grotte que tu habites est maintenant un lieu sanctuaire, Marie. Peux-tu le r??aliser ?? ce moment pr??cis?\n\n'
                              'Tu es toute jeune quand l???ange Gabriel t???appara??t. Moi, ?? cet ??ge, si je devais rencontrer un messager c??leste, je serais probablement terrifi??. J???exigerais des preuves qu???il est r??ellement un ange du Ciel. Ou peut-??tre encore aurais-je ??t?? saisi d???une telle exaltation que j???en aurais perdu la raison. Mais toi, tu ??coutes, tu tressailles, tu poses des questions. Tu as une attitude simple, d??licate, discr??te, forte, mais non servile, d??sireuse de savoir, de voir clair et, en m??me temps, tu souhaites aimer et vouloir conna??tre la v??rit?? . \n\n'
                              'Cette branche que tient en main l\'ange Gabriel, cette branche qui fleurit, en comprends-tu le sens? Comprends-tu que la racine de Jess??, d??laiss??e depuis des si??cles et ass??ch??e, refleurit au moment o?? tu entends les paroles de l???ange? Tu es si jeune, Marie! Peut-??tre quinze ans, peut-??tre m??me quatorze. Peux-tu r??ellement comprendre ce qui t???arrive? Peux-tu croire ?? quel point cette rencontre avec l???ange va transformer le monde? Peux-tu imaginer qu???un jour, on comptera les ann??es AVANT et apr??s ton accouchement? S??rement pas! Bien des ann??es plus tard, tu confias que tu gardais tout cela en toi-m??me et que tu m??ditais sur leur sens profond. Dans la joie. Dans l\'esp??rance de jours meilleurs. \n\n'
                              'Au fond, Marie, tu ressembles ?? toutes les jeunes mamans : ?? la fois pleine d\'espoir en l\'avenir et inqui??te pour ce qui peut arriver. Comme plusieurs mamans, tu doutes peut-??tre parfois de pouvoir ??tre ?? la hauteur. Mais tu te remets dans les mains de Dieu, tu as confiance. Tu sais que ta vie sera boulevers??e par cette grossesse impr??vue. Tu aurais souhait?? un moment plus opportun pour la vivre, cette grossesse. Tu sais qu???on va te juger, peut-??tre m??me te lapider, parce que tu attends un b??b?? avant m??me d?????tre mari??e. Tu connais ce qui peut arriver de pire. Mais ce qui peut arriver de mieux, tu l???attends. C???est ce que signifie le mot esp??rer : attendre ce qui doit arriver. Tu t\'en remets ?? Dieu. Tu dis : ?? Voici la servante du Seigneur. Qu\'il me soit fait selon ta parole. ??\n\n',
                              style: TextStyle(color: black)),
                        )),
                    child: Card(
                      color: white,
                      elevation: 20,
                      child: Column(
                        children: [
                          Text(
                            'MYST??RES JOYEUX',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: titleColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: titleColor, width: 3)),
                            child: Image.asset(
                                'assets/images/mysteries_button_joyeux.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Divider(height: 2),
            SizedBox(
              height: 10,
            ),
            loadingDone == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/6-agonie.mp3',
                          videoFile:
                              '${mydir?.path}/6-agonie_not-stretched.mp4',
                          textNo: 6,
                          minAudio: 6,
                          maxAudio: 10,
                          title: "L'Agonie",
                          audioText: Text(
                              'Tu as toujours aim?? te retrouver dans ce jardin sur la colline, ?? l???ombre des oliviers. Tu t???y es toujours senti en paix. ??a sent bon. Mais ce soir, ce jardin sent la mort. Tu as peur. Tu n???as pas envie de souffrir. Tu veux bien suivre le plan, mais ce soir, ??a ne te tente plus. Tu n???as jamais eu autant besoin de la pr??sence de tes amis, et pourtant ils se sont endormis. Tu leur as pourtant explicitement demand?? de veiller et de prier avec toi : l???esprit est ardent, mais la chair est faible. Tu sais que les prochaines heures vont t???apporter une douleur qui va faire mal dans chaque cellule de ton corps. Tu as tellement peur que tu sues du sang. \n\n'
                              'Je me reconnais, J??sus, dans ton agonie. Moi aussi, j???ai ??t?? abandonn?? et trahi par des amis en qui j???avais confiance. Moi aussi, des fois, j???ai peur de souffrir dans mon corps. Moi aussi, j???ai peur de mourir. Quand ??a m???arrive, tout est aussi noir que dans ce jardin des Oliviers, ce soir. J???ai peur de cet instant o?? la vie va quitter mon corps. Je ne sais pas ce qui va m???arriver apr??s. J???ai confiance que ce sera beau, mais j???ai peur de faire ce pas que je n???aurai pas le choix de faire. Comme toi, j???ai envie de demander ?? Notre P??re : ?? ??loigne de moi cette coupe ??. \n\n'
                              'Mais tu ajoutes : ?? Non pas comme je veux, mais comme tu veux ??. Tu accomplis ton destin. Tu ne te d??fileras pas. Tu sais que pour que le Mal soit vaincu une fois pour toutes, il faut que l???amour aille jusque-l?? : jusqu???au don de soi, jusqu???au d??pouillement total, jusqu????? donner sa propre vie. C???est ta mission, la raison pour laquelle tu es venu au monde. Tu es l???Agneau de Dieu. \n\n'
                              'Tu as confiance en ton P??re et en sa promesse. Un ange vient te calmer, te rassurer : Dieu est avec toi. Tu peux aller au-devant des coups et de la mort : tu vaincras. Tu es Dieu en chair et en os. Il faut que Dieu souffre dans sa chair pour montrer sa Toute-Puissance. \n\n'
                              'Je me demande pourquoi il faut souffrir et je ne comprends toujours pas. Mais j???ai confiance en Toi. Si Dieu lui-m??me a v??cu la mort, cela doit avoir un sens. Il semble que cela soit une n??cessit??, un passage. \n\n'
                              'J???ai envie d?????tre comme toi devant la souffrance et la mort : humble et confiant. Mais j???ai peur. J???ai peur, comprends-tu? \n\n'
                              'Tu me r??ponds : ?? Oui, je comprends. Je suis pass?? par l??, moi aussi. Aie confiance. Je serai avec toi. De l???autre c??t??, il y a la vie en pl??nitude. Il y a la vie ??ternelle. Je te tiendrai par la main. Courage! Avan??ons. L???heure est venue. ??\n\n',
                              style: TextStyle(color: black)),
                        )),
                    child: Card(
                      color: white,
                      elevation: 20,
                      child: Column(
                        children: [
                          Text(
                            'MYST??RES DOULOUREUX',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: titleColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: titleColor, width: 3)),
                            child: Image.asset(
                                'assets/images/mysteries_button_douloureux.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            Divider(height: 2),
            SizedBox(
              height: 20,
            ),
            loadingDone == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/11-resurrection.mp3',
                          videoFile: '${mydir?.path}/11-resurrection.mp4',
                          textNo: 11,
                          minAudio: 11,
                          maxAudio: 15,
                          title: "La r??surrection",
                          audioText: Text(
                              'Tu n???as pas dormi de la nuit. Tu n???en reviens pas de la vitesse avec laquelle toute ta vie s???est ??croul??e, une fois de plus. Tu te demandes si tu es condamn??e pour toujours ?? t???accrocher aux mauvaises personnes. Tu en as fait, des gaffes, Marie, dans ta vie. Tu as donn?? ton c??ur et ton ??me ?? des gens qui ne te m??ritaient pas. Tu as souffert d???amour, Madeleine. Tu as ??t?? trahie, violent??e. Tu as violent?? ?? ton tour pour r??parer le tort qu\'on t\'avait fait, mais ??a ne t???a apport?? aucune satisfaction. Depuis que tu l???avais rencontr??, tu ??tais soudainement devenue lumineuse. Ton pass??, aussi douloureux f??t-il, n?????tait qu???un lointain souvenir. Tu t?????tais sentie aim??e, compl??tement, par cet homme qui n???avait jamais cherch?? pourtant ?? te poss??der comme les autres hommes. Il voyait au fond de toi ce qu???il y avait de meilleur, de plus beau. Et aujourd???hui, il git au fond d???un tombeau apr??s avoir ??t?? tortur?? et humili?? publiquement. \n\n'
                              'Le soleil vient de se lever, alors tu peux aller prendre soin de ce qui reste de lui. Tu n???attends pas plus longtemps. En arrivant devant le tombeau, la pierre qui, hier, en bloquait l???entr??e a ??t?? roul??e plus loin. Tu t???approches de l???entr??e et tu vois que le corps de ton ami n???est pas l??. Tout pr??s, un homme b??che une plate-bande. Il doit avoir eu une belle P??que, lui, parce qu???il arbore un sourire presque narquois en levant les yeux vers toi pour te regarder, paniqu??e. Tu lui dis : ?? Si c???est toi qui l???as enlev??, dis-moi o?? tu l???as mis! ?? Non, mais, ce n???est pas le genre de farce qu???on fait! Alors son sourire s?????largit encore plus, comme si c?????tait possible. ?? Marie! ??. Un grand frisson te traverse. Comment est-ce possible? Tu ne r??fl??chis pas plus avant et tu t???exclames par le petit nom que tu lui donnais quand tu voulais lui montrer ton affection : ?? Rabbouni! ??. \n\n'
                              'Tu retournes le dire aux autres, comme il te l???a demand??. Les autres ont du mal ?? te croire. Personne ne peut revenir de la mort, c???est impossible! Mais Jean se souvient soudainement que le ma??tre en avait parl?? sans qu???ils y portent vraiment attention : ?? le troisi??me jour, le Fils de l???Homme ressuscitera ??. Alors Pierre court vers le tombeau, et Jean ?? sa suite. Il voit et il croit. \n\n'
                              'Il est donc bel et bien Celui qu???il disait ??tre! C???est formidable! Il n???y a pas de mots pour d??crire cette joie : il n???est pas mort, IL EST VIVANT! Il dit ?? Thomas : ?? mets ton doigt dans le trou de mon poignet, mets ta main dans mon c??t?? ??. Ce n???est pas un fant??me. Ce n???est pas une illusion. Il est bien l??, en chair et en os. Il mange et il boit. Il reste avec vous pendant quarante jours. Il ne ressemble plus ?? ce qu???il ??tait avant, par contre. Il est transfigur??. Il s???est joint ?? deux disciples qui marchaient vers une ville voisine, et ils ne l???ont reconnu que le soir venu, au repas. Il a pris du pain et il a dit : ceci est mon corps, faites ceci en m??moire de moi. Ce n???est qu????? ce moment qu???ils l???ont reconnu, mais il a disparu. Vraiment, Il n???a pas fini de nous surprendre! IL EST VIVANT! IL EST VRAIMENT RESSUSCIT??!\n\n',
                              style: TextStyle(color: black)),
                        )),
                    child: Card(
                      color: white,
                      elevation: 20,
                      child: Column(
                        children: [
                          Text(
                            'MYST??RES GLORIEUX',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: titleColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: titleColor, width: 3)),
                            child: Image.asset(
                                'assets/images/mysteries_button_glorieux.png'),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorPrimaryAlt,
        selectedItemColor: colorPrimary,
        unselectedItemColor: white,
        items: [
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Prier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) {
    // if (index == 0) {
    //   Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    // } else
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/categories1', (route) => false);
      //Navigator.pushNamed(context, '/categories');
    } else {
      Navigator.pushNamed(context, '/contacts');
    }
  }
}
