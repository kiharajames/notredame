import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:flutter/services.dart';
import 'package:notredame/includes/public.dart';
import 'package:path_provider/path_provider.dart';

class Joyeux extends StatefulWidget {
  const Joyeux({Key? key}) : super(key: key);

  @override
  _JoyeuxState createState() => _JoyeuxState();
}

class _JoyeuxState extends State<Joyeux> {
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
    return loadingDone == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: colorPrimary,
            appBar: AppBar(
              title: Text('MYSTÈRES JOYEUX'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(
                        File('${mydir?.path}/1-annonciation_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('L\'Annonciation'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/annonciation.mp3',
                          videoFile: '${mydir?.path}/1-annonciation.mp4',
                          textNo: 1,
                          title: "L'Annonciation",
                          audioText: Text(
                              'Comment ça s’est passé réellement, pour toi, cette rencontre avec l’ange? Je sais bien, moi, qu’il y a toujours un décalage entre ce qu\'on entend et ce qu\'on comprend. D\'ailleurs, peut-on réellement rencontrer un ange? Si c’est possible, alors j’en ai sûrement croisé quelques-uns moi-même. Dis donc, avais-tu déjà enlevé tes sandales, ou les as-tu plutôt retirées au moment de l\'apparition de l\'ange? C\'est ce qu\'avait dû faire Moïse en présence du Tout-Puissant. C’est ce qu’on fait dans un lieu saint. Et cette grotte que tu habites est maintenant un lieu sanctuaire, Marie. Peux-tu le réaliser à ce moment précis?\n\n'
                              'Tu es toute jeune quand l’ange Gabriel t’apparaît. Moi, à cet âge, si je devais rencontrer un messager céleste, je serais probablement terrifié. J’exigerais des preuves qu’il est réellement un ange du Ciel. Ou peut-être encore aurais-je été saisi d’une telle exaltation que j’en aurais perdu la raison. Mais toi, tu écoutes, tu tressailles, tu poses des questions. Tu as une attitude simple, délicate, discrète, forte, mais non servile, désireuse de savoir, de voir clair et, en même temps, tu souhaites aimer et vouloir connaître la vérité . \n\n'
                              'Cette branche que tient en main l\'ange Gabriel, cette branche qui fleurit, en comprends-tu le sens? Comprends-tu que la racine de Jessé, délaissée depuis des siècles et asséchée, refleurit au moment où tu entends les paroles de l’ange? Tu es si jeune, Marie! Peut-être quinze ans, peut-être même quatorze. Peux-tu réellement comprendre ce qui t’arrive? Peux-tu croire à quel point cette rencontre avec l’ange va transformer le monde? Peux-tu imaginer qu’un jour, on comptera les années AVANT et après ton accouchement? Sûrement pas! Bien des années plus tard, tu confias que tu gardais tout cela en toi-même et que tu méditais sur leur sens profond. Dans la joie. Dans l\'espérance de jours meilleurs. \n\n'
                              'Au fond, Marie, tu ressembles à toutes les jeunes mamans : à la fois pleine d\'espoir en l\'avenir et inquiète pour ce qui peut arriver. Comme plusieurs mamans, tu doutes peut-être parfois de pouvoir être à la hauteur. Mais tu te remets dans les mains de Dieu, tu as confiance. Tu sais que ta vie sera bouleversée par cette grossesse imprévue. Tu aurais souhaité un moment plus opportun pour la vivre, cette grossesse. Tu sais qu’on va te juger, peut-être même te lapider, parce que tu attends un bébé avant même d’être mariée. Tu connais ce qui peut arriver de pire. Mais ce qui peut arriver de mieux, tu l’attends. C’est ce que signifie le mot espérer : attendre ce qui doit arriver. Tu t\'en remets à Dieu. Tu dis : « Voici la servante du Seigneur. Qu\'il me soit fait selon ta parole. »\n\n',
                              style: TextStyle(color: black)),
                        ));
                  },
                ),
                Divider(),
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(
                      File('${mydir?.path}/2-visitation_thumb.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text('La Visitation'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                            audioFile: '${mydir?.path}/isitation.mp3',
                            videoFile: '${mydir?.path}/2-visitation.mp4',
                            textNo: 2,
                            title: "La Visitation",
                            audioText: Text(
                                'Tu es surprise de voir arriver ta jeune cousine. Marie n’a-t-elle pas un mariage à préparer et des histoires à clarifier? Après tout, on dit qu’il faut d’abord s’aider pour aider les autres. Comment ses parents ont-ils bien pu la laisser partir si loin, toute seule?\n\n'
                                'Quand tu l’aperçois, tes entrailles sont remuées de joie. Tu t’exclames : « Tu es bénie entre toutes les femmes, et le fruit de tes entrailles est béni! » Tu sens bien que Marie n’arrive pas par hasard. D’ailleurs, plusieurs croient que les hasards n’existent pas, et que la synchronicité est un signe que Dieu est toujours à l’œuvre de nos jours. Tu demandes : « Comment m\'est-il donné que vienne à moi la mère de mon Sauveur? »\n\n'
                                'Oui, bienheureuse celle qui a cru en l\'accomplissement de ce qui lui a été dit de la part du Seigneur! En côtoyant ta jeune cousine, tu la découvres dans l’intimité. Quand elle écoute, elle ne perçoit pas seulement un évènement, mais aussi sa signification. Par l’oreille, elle perçoit une réalité en même temps que son sens profond : « c’est la seule manière d’écouter », dit-elle nonchalamment en haussant ses jeunes épaules. Elle ne s’est d’ailleurs pas contentée de seulement entendre l’ange lui dire que tu étais enceinte par l’intervention miraculeuse de Dieu : elle décide d’aller très vite à ta rencontre. Marie est faite d’un seul bloc : ce qu’elle entend, elle en trouve le sens profond en son cœur. Puis, elle décide de ce qu’il y a de mieux à faire, et elle le fait. Elle réconcilie ton œil et ton oreille avec ton cœur et tes mains.\n\n'
                                'J’imagine la réponse qu’elle t’aurait donnée si tu lui avais demandé pourquoi une jeune fille de cet âge, et en une telle situation, a décidé de partir si rapidement : « Une décision, prise dans le tréfonds du cœur, doit passer immédiatement à exécution, sinon dans le cas contraire, elle pourrirait. »\n\n'
                                'La fécondité est un mystère impénétrable. Tant de gens auraient souhaité être parents sans qu’ils puissent connaître cette joie, alors que d’autres se sentent désemparés en apprenant la venue d’un nouveau-né. Toi, Élisabeth, qu’on appelait la stérile, voilà que tu attends miraculeusement un enfant. Tu le sais maintenant de tout ton être : à Dieu, rien n’est impossible. Cet enfant est devenu un très grand prophète : Jean, le Baptiste. Il dit : « Repentez-vous de vos erreurs du passé et plongez dans la vie nouvelle qui vous attend. Préparez-vous pour la grande Rencontre : le Messie arrive, il va changer votre vie si vous le voulez! »),\n\n',
                                style: TextStyle(color: black))));
                  },
                ),
                Divider(),
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(
                        File('${mydir?.path}/3-nativite_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('La Natitivité'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/3-La-Nativite.mp3',
                          videoFile: '${mydir?.path}/3-nativite.mp4',
                          textNo: 3,
                          title: "La Natitivité",
                          audioText: Text(
                              'Dieu, tu es vraiment un Dieu étonnant! Tu viens nous sauver toi-même en chair et en os. Tu ne descends pas du ciel en chariots de feu, ce n’est pas ton style. Tu es plutôt du genre humble et doux. Doux comme un bébé qui a besoin d’une maman et d’un papa. Tu as choisi Marie parce qu’elle était promise à Joseph, un homme humble, lui aussi. Un gars de la construction, peu bavard, mais fiable. Tu nais comme nous tous, dans le sang et la douleur. Tu es vulnérable, comme nous tous. On doit prendre soin de notre Dieu.\n\n'
                              'Tu es humble. Est-ce la raison pour laquelle tu choisis toujours les pauvres en premier, eux qui acceptent plus facilement que tu les sauves? Heureux les pauvres en esprit, car le Royaume des Cieux est à eux! À ta naissance, tes anges annoncent donc la Bonne Nouvelle à des marginaux, des bergers. Comme toi, ils sont humbles et ils savent prendre soin de petites bêtes vulnérables. L’Évangile selon saint Luc raconte, lorsque Jésus est né, que Marie l’a enveloppé dans des langes et l’a couché dans une crèche. C’est à ce signe qu’ils ont reconnu ton Fils : un enfant langé et couché dans une crèche. Il ne pouvait y en avoir qu’un seul dans tout Bethléem : personne ne prend soin d’un bébé avec autant d’amour et de précautions pour ensuite le déposer dans une mangeoire d’animaux!\n\n'
                              'Mais ce n’est pas parce qu’il manquait de soins et d’amour que cet enfant est enveloppé de langes et couché dans une mangeoire. C’est plutôt parce qu’il n’y avait pas de place pour toi, ce jour-là, pour que tu naisses dans des conditions dignes du roi que Tu as toujours été, que Tu es et que Tu seras toujours. Comme des millions d’autres humains, Père, ton Fils Jésus est né pendant que ses parents étaient en déplacement. Mais d’où vient cette lumière qui rend vos visages si lumineux, dans cette grotte sombre et sale? C’est la joie de tout parent qui se pâme devant la perfection de leur nouveau-né! Une lumière si éblouissante ne peut être contenue. Dans cet endroit froid et sombre, cette lumière, Jésus, me permet d’admirer ton doux visage de bébé. Ton visage humain ressemble au mien. Je suis fait à ton image, mais en basse résolution, pourrait-on dire.\n\n'
                              'Il n’y a pas de place pour toi, à Bethléem, ce jour-là, pour que tu naisses dans des conditions dignes d’un roi. Il n’y avait pas de place pour toi, non plus, dans mon cœur, pour que tu y naisses et y grandisses. Heureusement, tu m’as touché d’une manière douce et humble, au moment opportun. Ô, Seigneur, grandis encore en mon âme!\n\n',
                              style: TextStyle(color: black)),
                        ));
                  },
                ),
                Divider(),
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(
                        File('${mydir?.path}/4-presentation_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('La Présentation au Temple'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/4-La-Presentation.mp3',
                          videoFile: '${mydir?.path}/4-presentation.mp4',
                          textNo: 4,
                          title: "La Présentation au Temple",
                          audioText: Text(
                              'Dans ta religion, Jésus, le premier garçon d’une famille doit être consacré au Seigneur. Peut-être tes parents ont-ils hésité à t’emmener au Temple pour te présenter au Seigneur. Après tout, ils savaient, eux, que tu étais son Fils. Mais peut-être se sont-ils dit, comme plusieurs d’entre nous aujourd’hui, que même si on ne sait pas tout le temps exactement pourquoi, nous rendre au Temple pour répéter des gestes religieux qui nous ont été transmis ne fait de mal à personne. Au contraire, il arrive souvent que de belles choses se produisent quand on décide de faire un pas vers Dieu, même si on ne comprend pas complètement le sens des gestes et des paroles. Nous rendre au Temple et comprendre lentement, c’est cela aussi, avancer dans la foi.\n\n'
                              'Tes parents avancent dans la foi et ils se rendent au Temple pour y faire la rencontre de deux étrangers qui prononceront des paroles mystérieuses. D’abord, il y a ce vieux Syméon, qui attend le Messie depuis de nombreuses années, et qui dit à qui veut bien l’entendre que Dieu lui a promis qu’il Le verrait de son vivant. Il peut se compter heureux que tes parents aient accepté de laisser un étranger te prendre dans ses bras. Plusieurs parents auraient refusé. Mais dans ce genre d’endroits, on se permet parfois de poser des gestes qu’on n’oserait pas poser en d’autres circonstances. Le vieux Syméon te prend, et il lève les yeux au ciel et prononce des paroles que ta mère n’a jamais oubliées : « Maintenant, ô, Maître souverain, tu peux laisser ton serviteur partir en paix, selon ta parole. Car mes yeux ont vu le salut que tu préparais à la face des peuples : lumière qui se révèle aux nations, et donne gloire à ton peuple Israël. »\n\n'
                              'Même si tes parents savaient qui tu étais et d’où tu venais, ils ont été étonnés de ce que des inconnus disaient de toi. Ce n’est donc pas difficile d’imaginer qu’une fois devenu adulte, des gens qui ont vu ce que tu peux faire, et entendu tes paroles qui donnent la vie, ne t’aient pas reconnu comme le Messie! Dans ce contexte, ils ont raison de trouver un peu étonnant que de purs étrangers, en voyant ce petit bébé qui leur est présenté, reconnaissent en lui le Fils du Dieu Vivant. Puis Syméon a béni tes parents et a dit à ta maman : « Vois! cet enfant doit amener la chute et le relèvement d’un grand nombre en Israël ; il doit être un signe en butte à la contradiction - et toi-même, une épée te transpercera l’âme! – afin que se révèlent les pensées intimes de bien des cœurs. »\n\n'
                              'Si l’anecdote de ta Présentation au Temple s’arrêtait là, Jésus, je serais déjà bien troublé. Mais il y a encore cette vieille femme de 84 ans, Anne, qui était une prophétesse. Elle ne quittait pas le Temple depuis plus de cinquante ans, servant Dieu nuit et jour. Bref, c’était une sainte femme. Tout le monde la connaissait et l’appréciait. Elle aussi louait Dieu et parlait de toi à tous ceux qui attendaient la délivrance que Dieu avait promise à ceux qui l’aiment.\n\n'
                              'Je ne sais trop comment, mais quand je regarde ces scènes de ta vie, je me mets à réfléchir à ce que tu représentes pour moi. Est-ce que je crois que tu es le Messie qui veut me sauver, moi,\n\n'
                              'aujourd\'hui? As-tu déjà même vraiment existé? Es-tu bel et bien vivant en ce moment même? Est-ce que je peux te faire confiance? J’imagine que le simple fait de me poser ces questions est un bon début. Si tu es vraiment celui que tu dis être, ne tarde pas pour me le faire savoir!\n\n',
                              style: TextStyle(color: black)),
                        ));
                  },
                ),
                Divider(),
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(
                        File('${mydir?.path}/5-recouvrement_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('Jésus enseigne au Temple (le recouvrement)'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/5-recouvrement.mp3',
                          videoFile: '${mydir?.path}/5-recouvrement.mp4',
                          textNo: 5,
                          title: "Jésus enseigne au Temple (le recouvrement)",
                          audioText: Text(
                              'Déjà, à douze ans, tu veux nous montrer comment Dieu pense. De l’extérieur, tu sembles « avoir compris » Dieu et toute l’Écriture de ta religion. Pour toi, c’est tellement clair et simple : il faut aimer Dieu de tout son cœur, de toute son âme et de toute sa force, et aimer les autres autant qu’on aime Dieu. Même ceux qui ne méritent pas d’être aimés. Surtout ceux-là. Les adultes, au Temple, n’en reviennent pas. Comment un petit gars de la campagne, fils d’un gars de la construction, a-t-il pu approfondir autant la Parole de Dieu qu’elle devient tout à fait concrète devant nous? Tu donnes des leçons aux grands théologiens de ton temps. Ils t’écoutent avec passion. Plus tard, ils se demanderont : « Mais d’où tient-il cette autorité? » \n\n'
                              'Nous, on sait, que tu ES la Parole de Dieu, faite chaire. Tout ton être est amour. Tu nous donnes l’exemple, dès ton plus jeune âge.  \n\n'
                              'Comment ça se passe, en toi Jésus, qui es 100% Dieu et 100% humain? As-tu toujours su que tu étais Dieu ou l’as-tu plutôt découvert? Bien fin celui ou celle qui pourrait répondre à cette question. C’est un mystère. Ce qu’on sait, c’est que tu es tellement humain, que tu ressembles à tous les autres humains, sauf le péché. Mais tu es aussi tellement divin que tu incarnes Dieu comme personne ne l’avait encore jamais fait. Tu es Dieu parmi nous.  \n\n'
                              'Ta mère et son mari t’avaient emmené au Temple pour la Pâque et au retour, tu décides de rester au Temple. Ils ont mis trois jours à te retrouver! Comme ils devaient être inquiets! Qu’allaient-ils dire à Dieu, le jour du jugement, pour expliquer qu’ils avaient perdu son Fils!!! Mais lorsqu’ils te retrouvent au Temple, tu les calmes tout de suite : « Pourquoi donc me cherchiez-vous? Ne saviez-vous pas que je dois être dans la maison de mon Père? » Ils ne savaient tout simplement pas que, pour toujours, il ne nous faudrait rien de plus pour te retrouver que de nous mettre en route vers la maison du Seigneur.  \n\n'
                              'Ô Jésus, grand sage parmi les enfants, apprends-moi à respecter les plus jeunes que moi. Permets-moi d’être à l’écoute de ce qu’ils disent et de chercher ce qu’il y a en eux qui te ressemble! \n\n',
                              style: TextStyle(color: black)),
                        ));
                  },
                ),
              ],
            ),
          );
  }
}
