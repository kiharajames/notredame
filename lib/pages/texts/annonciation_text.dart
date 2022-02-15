import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';

class MysteresText extends StatefulWidget {
  MysteresText({Key? key}) : super(key: key);

  @override
  _MysteresTextState createState() => _MysteresTextState();
}

class _MysteresTextState extends State<MysteresText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        title: Text('Annonciation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: colorPrimary,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [Icon(Icons.message_outlined), Text('LIRE')],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                  'Comment ça s’est passé réellement, pour toi, cette rencontre avec l’ange? Je sais bien, moi, qu’il y a toujours un décalage entre ce qu\'on entend et ce qu\'on comprend. D\'ailleurs, peut-on réellement rencontrer un ange? Si c’est possible, alors j’en ai sûrement croisé quelques-uns moi-même. Dis donc, avais-tu déjà enlevé tes sandales, ou les as-tu plutôt retirées au moment de l\'apparition de l\'ange? C\'est ce qu\'avait dû faire Moïse en présence du Tout-Puissant. C’est ce qu’on fait dans un lieu saint. Et cette grotte que tu habites est maintenant un lieu sanctuaire, Marie. Peux-tu le réaliser à ce moment précis?\n'
                  'Tu es toute jeune quand l’ange Gabriel t’apparaît. Moi, à cet âge, si je devais rencontrer un messager céleste, je serais probablement terrifié. J’exigerais des preuves qu’il est réellement un ange du Ciel. Ou peut-être encore aurais-je été saisi d’une telle exaltation que j’en aurais perdu la raison. Mais toi, tu écoutes, tu tressailles, tu poses des questions. Tu as une attitude simple, délicate, discrète, forte, mais non servile, désireuse de savoir, de voir clair et, en même temps, tu souhaites aimer et vouloir connaître la vérité . \n'
                  'Cette branche que tient en main l\'ange Gabriel, cette branche qui fleurit, en comprends-tu le sens? Comprends-tu que la racine de Jessé, délaissée depuis des siècles et asséchée, refleurit au moment où tu entends les paroles de l’ange? Tu es si jeune, Marie! Peut-être quinze ans, peut-être même quatorze. Peux-tu réellement comprendre ce qui t’arrive? Peux-tu croire à quel point cette rencontre avec l’ange va transformer le monde? Peux-tu imaginer qu’un jour, on comptera les années AVANT et après ton accouchement? Sûrement pas! Bien des années plus tard, tu confias que tu gardais tout cela en toi-même et que tu méditais sur leur sens profond. Dans la joie. Dans l\'espérance de jours meilleurs. \n'
                  'Au fond, Marie, tu ressembles à toutes les jeunes mamans : à la fois pleine d\'espoir en l\'avenir et inquiète pour ce qui peut arriver. Comme plusieurs mamans, tu doutes peut-être parfois de pouvoir être à la hauteur. Mais tu te remets dans les mains de Dieu, tu as confiance. Tu sais que ta vie sera bouleversée par cette grossesse imprévue. Tu aurais souhaité un moment plus opportun pour la vivre, cette grossesse. Tu sais qu’on va te juger, peut-être même te lapider, parce que tu attends un bébé avant même d’être mariée. Tu connais ce qui peut arriver de pire. Mais ce qui peut arriver de mieux, tu l’attends. C’est ce que signifie le mot espérer : attendre ce qui doit arriver. Tu t\'en remets à Dieu. Tu dis : « Voici la servante du Seigneur. Qu\'il me soit fait selon ta parole. »\n'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('  (MARTINI 1986), p. 11'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
