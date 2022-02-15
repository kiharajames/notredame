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
                              'Comment ça s’est passé réellement, pour toi, cette rencontre avec l’ange? Je sais bien, moi, qu’il y a toujours un décalage entre ce qu\'on entend et ce qu\'on comprend. D\'ailleurs, peut-on réellement rencontrer un ange? Si c’est possible, alors j’en ai sûrement croisé quelques-uns moi-même. Dis donc, avais-tu déjà enlevé tes sandales, ou les as-tu plutôt retirées au moment de l\'apparition de l\'ange? C\'est ce qu\'avait dû faire Moïse en présence du Tout-Puissant. C’est ce qu’on fait dans un lieu saint. Et cette grotte que tu habites est maintenant un lieu sanctuaire, Marie. Peux-tu le réaliser à ce moment précis?\n\n'
                              'Tu es toute jeune quand l’ange Gabriel t’apparaît. Moi, à cet âge, si je devais rencontrer un messager céleste, je serais probablement terrifié. J’exigerais des preuves qu’il est réellement un ange du Ciel. Ou peut-être encore aurais-je été saisi d’une telle exaltation que j’en aurais perdu la raison. Mais toi, tu écoutes, tu tressailles, tu poses des questions. Tu as une attitude simple, délicate, discrète, forte, mais non servile, désireuse de savoir, de voir clair et, en même temps, tu souhaites aimer et vouloir connaître la vérité . \n\n'
                              'Cette branche que tient en main l\'ange Gabriel, cette branche qui fleurit, en comprends-tu le sens? Comprends-tu que la racine de Jessé, délaissée depuis des siècles et asséchée, refleurit au moment où tu entends les paroles de l’ange? Tu es si jeune, Marie! Peut-être quinze ans, peut-être même quatorze. Peux-tu réellement comprendre ce qui t’arrive? Peux-tu croire à quel point cette rencontre avec l’ange va transformer le monde? Peux-tu imaginer qu’un jour, on comptera les années AVANT et après ton accouchement? Sûrement pas! Bien des années plus tard, tu confias que tu gardais tout cela en toi-même et que tu méditais sur leur sens profond. Dans la joie. Dans l\'espérance de jours meilleurs. \n\n'
                              'Au fond, Marie, tu ressembles à toutes les jeunes mamans : à la fois pleine d\'espoir en l\'avenir et inquiète pour ce qui peut arriver. Comme plusieurs mamans, tu doutes peut-être parfois de pouvoir être à la hauteur. Mais tu te remets dans les mains de Dieu, tu as confiance. Tu sais que ta vie sera bouleversée par cette grossesse imprévue. Tu aurais souhaité un moment plus opportun pour la vivre, cette grossesse. Tu sais qu’on va te juger, peut-être même te lapider, parce que tu attends un bébé avant même d’être mariée. Tu connais ce qui peut arriver de pire. Mais ce qui peut arriver de mieux, tu l’attends. C’est ce que signifie le mot espérer : attendre ce qui doit arriver. Tu t\'en remets à Dieu. Tu dis : « Voici la servante du Seigneur. Qu\'il me soit fait selon ta parole. »\n\n',
                              style: TextStyle(color: black)),
                        )),
                    child: Card(
                      color: white,
                      elevation: 20,
                      child: Column(
                        children: [
                          Text(
                            'MYSTÈRES JOYEUX',
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
                              'Tu as toujours aimé te retrouver dans ce jardin sur la colline, à l’ombre des oliviers. Tu t’y es toujours senti en paix. Ça sent bon. Mais ce soir, ce jardin sent la mort. Tu as peur. Tu n’as pas envie de souffrir. Tu veux bien suivre le plan, mais ce soir, ça ne te tente plus. Tu n’as jamais eu autant besoin de la présence de tes amis, et pourtant ils se sont endormis. Tu leur as pourtant explicitement demandé de veiller et de prier avec toi : l’esprit est ardent, mais la chair est faible. Tu sais que les prochaines heures vont t’apporter une douleur qui va faire mal dans chaque cellule de ton corps. Tu as tellement peur que tu sues du sang. \n\n'
                              'Je me reconnais, Jésus, dans ton agonie. Moi aussi, j’ai été abandonné et trahi par des amis en qui j’avais confiance. Moi aussi, des fois, j’ai peur de souffrir dans mon corps. Moi aussi, j’ai peur de mourir. Quand ça m’arrive, tout est aussi noir que dans ce jardin des Oliviers, ce soir. J’ai peur de cet instant où la vie va quitter mon corps. Je ne sais pas ce qui va m’arriver après. J’ai confiance que ce sera beau, mais j’ai peur de faire ce pas que je n’aurai pas le choix de faire. Comme toi, j’ai envie de demander à Notre Père : « Éloigne de moi cette coupe ». \n\n'
                              'Mais tu ajoutes : « Non pas comme je veux, mais comme tu veux ». Tu accomplis ton destin. Tu ne te défileras pas. Tu sais que pour que le Mal soit vaincu une fois pour toutes, il faut que l’amour aille jusque-là : jusqu’au don de soi, jusqu’au dépouillement total, jusqu’à donner sa propre vie. C’est ta mission, la raison pour laquelle tu es venu au monde. Tu es l’Agneau de Dieu. \n\n'
                              'Tu as confiance en ton Père et en sa promesse. Un ange vient te calmer, te rassurer : Dieu est avec toi. Tu peux aller au-devant des coups et de la mort : tu vaincras. Tu es Dieu en chair et en os. Il faut que Dieu souffre dans sa chair pour montrer sa Toute-Puissance. \n\n'
                              'Je me demande pourquoi il faut souffrir et je ne comprends toujours pas. Mais j’ai confiance en Toi. Si Dieu lui-même a vécu la mort, cela doit avoir un sens. Il semble que cela soit une nécessité, un passage. \n\n'
                              'J’ai envie d’être comme toi devant la souffrance et la mort : humble et confiant. Mais j’ai peur. J’ai peur, comprends-tu? \n\n'
                              'Tu me réponds : « Oui, je comprends. Je suis passé par là, moi aussi. Aie confiance. Je serai avec toi. De l’autre côté, il y a la vie en plénitude. Il y a la vie éternelle. Je te tiendrai par la main. Courage! Avançons. L’heure est venue. »\n\n',
                              style: TextStyle(color: black)),
                        )),
                    child: Card(
                      color: white,
                      elevation: 20,
                      child: Column(
                        children: [
                          Text(
                            'MYSTÈRES DOULOUREUX',
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
                          title: "La résurrection",
                          audioText: Text(
                              'Tu n’as pas dormi de la nuit. Tu n’en reviens pas de la vitesse avec laquelle toute ta vie s’est écroulée, une fois de plus. Tu te demandes si tu es condamnée pour toujours à t’accrocher aux mauvaises personnes. Tu en as fait, des gaffes, Marie, dans ta vie. Tu as donné ton cœur et ton âme à des gens qui ne te méritaient pas. Tu as souffert d’amour, Madeleine. Tu as été trahie, violentée. Tu as violenté à ton tour pour réparer le tort qu\'on t\'avait fait, mais ça ne t’a apporté aucune satisfaction. Depuis que tu l’avais rencontré, tu étais soudainement devenue lumineuse. Ton passé, aussi douloureux fût-il, n’était qu’un lointain souvenir. Tu t’étais sentie aimée, complètement, par cet homme qui n’avait jamais cherché pourtant à te posséder comme les autres hommes. Il voyait au fond de toi ce qu’il y avait de meilleur, de plus beau. Et aujourd’hui, il git au fond d’un tombeau après avoir été torturé et humilié publiquement. \n\n'
                              'Le soleil vient de se lever, alors tu peux aller prendre soin de ce qui reste de lui. Tu n’attends pas plus longtemps. En arrivant devant le tombeau, la pierre qui, hier, en bloquait l’entrée a été roulée plus loin. Tu t’approches de l’entrée et tu vois que le corps de ton ami n’est pas là. Tout près, un homme bêche une plate-bande. Il doit avoir eu une belle Pâque, lui, parce qu’il arbore un sourire presque narquois en levant les yeux vers toi pour te regarder, paniquée. Tu lui dis : « Si c’est toi qui l’as enlevé, dis-moi où tu l’as mis! » Non, mais, ce n’est pas le genre de farce qu’on fait! Alors son sourire s’élargit encore plus, comme si c’était possible. « Marie! ». Un grand frisson te traverse. Comment est-ce possible? Tu ne réfléchis pas plus avant et tu t’exclames par le petit nom que tu lui donnais quand tu voulais lui montrer ton affection : « Rabbouni! ». \n\n'
                              'Tu retournes le dire aux autres, comme il te l’a demandé. Les autres ont du mal à te croire. Personne ne peut revenir de la mort, c’est impossible! Mais Jean se souvient soudainement que le maître en avait parlé sans qu’ils y portent vraiment attention : « le troisième jour, le Fils de l’Homme ressuscitera ». Alors Pierre court vers le tombeau, et Jean à sa suite. Il voit et il croit. \n\n'
                              'Il est donc bel et bien Celui qu’il disait être! C’est formidable! Il n’y a pas de mots pour décrire cette joie : il n’est pas mort, IL EST VIVANT! Il dit à Thomas : « mets ton doigt dans le trou de mon poignet, mets ta main dans mon côté ». Ce n’est pas un fantôme. Ce n’est pas une illusion. Il est bien là, en chair et en os. Il mange et il boit. Il reste avec vous pendant quarante jours. Il ne ressemble plus à ce qu’il était avant, par contre. Il est transfiguré. Il s’est joint à deux disciples qui marchaient vers une ville voisine, et ils ne l’ont reconnu que le soir venu, au repas. Il a pris du pain et il a dit : ceci est mon corps, faites ceci en mémoire de moi. Ce n’est qu’à ce moment qu’ils l’ont reconnu, mais il a disparu. Vraiment, Il n’a pas fini de nous surprendre! IL EST VIVANT! IL EST VRAIMENT RESSUSCITÉ!\n\n',
                              style: TextStyle(color: black)),
                        )),
                    child: Card(
                      color: white,
                      elevation: 20,
                      child: Column(
                        children: [
                          Text(
                            'MYSTÈRES GLORIEUX',
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
