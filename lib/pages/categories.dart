import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:flutter/services.dart';
import 'package:notredame/includes/public.dart';
import 'package:path_provider/path_provider.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
    return loadingDone == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: colorPrimary,
              appBar: AppBar(
                iconTheme: IconThemeData(color: maincolor),
                backgroundColor: white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mystère',
                      style: TextStyle(color: maincolor),
                    ),
                  ],
                ),
                bottom: TabBar(
                  indicatorColor: maincolor,
                  labelColor: maincolor,
                  tabs: [
                    Tab(
                      text: 'Joyeux',
                    ),
                    Tab(
                      text: 'Douloureux',
                    ),
                    Tab(
                      text: 'Glorieux',
                    )
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 600,
                      child: TabBarView(
                        children: [
                          ListView(
                            padding: const EdgeInsets.all(8),
                            children: <Widget>[
                              ListTile(
                                leading: Image(
                                  image: FileImage(File(
                                      '${mydir?.path}/1-annonciation_thumb.png')),
                                ),
                                title: Text('L\'Annonciation'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/annonciation.mp3',
                                        videoFile:
                                            '${mydir?.path}/1-annonciation.mp4',
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
                                      ));
                                },
                              ),
                              Divider(),
                              ListTile(
                                leading: Image(
                                  image: FileImage(File(
                                      '${mydir?.path}/2-visitation_thumb.png')),
                                ),
                                title: Text('La Visitation'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                          audioFile:
                                              '${mydir?.path}/isitation.mp3',
                                          videoFile:
                                              '${mydir?.path}/2-visitation.mp4',
                                          textNo: 2,
                                          minAudio: 1,
                                          maxAudio: 5,
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
                                leading: Image(
                                  image: FileImage(File(
                                      '${mydir?.path}/3-nativite_thumb.png')),
                                ),
                                title: Text('La Natitivité'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/3-La-Nativite.mp3',
                                        videoFile:
                                            '${mydir?.path}/3-nativite.mp4',
                                        textNo: 3,
                                        minAudio: 1,
                                        maxAudio: 5,
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
                                leading: Image(
                                  image: FileImage(File(
                                      '${mydir?.path}/4-presentation_thumb.png')),
                                ),
                                title: Text('La Présentation au Temple'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/4-La-Presentation.mp3',
                                        videoFile:
                                            '${mydir?.path}/4-presentation.mp4',
                                        textNo: 4,
                                        minAudio: 1,
                                        maxAudio: 5,
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
                                leading: Image(
                                  image: FileImage(File(
                                      '${mydir?.path}/5-recouvrement_thumb.png')),
                                ),
                                title: Text(
                                    'Jésus enseigne au Temple (le recouvrement)'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/5-recouvrement.mp3',
                                        videoFile:
                                            '${mydir?.path}/5-recouvrement.mp4',
                                        textNo: 5,
                                        minAudio: 1,
                                        maxAudio: 5,
                                        title:
                                            "Jésus enseigne au Temple (le recouvrement)",
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
                          ListView(
                            padding: const EdgeInsets.all(8),
                            children: <Widget>[
                              ListTile(
                                leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.file(
                                      File('${mydir?.path}/6-agonie_thumb.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('L\'agonie'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/6-agonie.mp3',
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
                                      ));
                                },
                              ),
                              Divider(),
                              ListTile(
                                leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.file(
                                    File(
                                        '${mydir?.path}/7-flagellation_thumb.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                title: Text('La flagellation'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/7-flagellation.mp3',
                                        videoFile:
                                            '${mydir?.path}/7-flagellation.mp4',
                                        textNo: 7,
                                        minAudio: 6,
                                        maxAudio: 10,
                                        title: "La flagellation",
                                        audioText: Text(
                                            'Il y a tellement de haine en nos cœurs, par moment, Jésus! Toi, tu acceptes de subir cette haine dans ta chair. Les gens qui te fouettent semblent y trouver un certain plaisir. Il y en a même un qui a été attiré par tes cris de douleur et qui vient prendre part à cette manifestation diabolique. Il n’a pas manqué d’agripper un fouet, lui aussi, pour assouvir la haine qui l’habite.\n\n'
                                            'Il y a en moi aussi de la haine, Jésus, et je le regrette. Je souhaiterais avoir un cœur pur, mais il y a des situations où la haine prend le dessus. Je voudrais parfois, moi aussi, faire mal à l’autre.\n\n'
                                            'D’autres fois, je n’éprouve pas particulièrement de haine envers une personne. Mais comme un requin est attiré par le sang, je me laisse attirer par les cris et les clameurs. Je vois quelqu’un souffrir et je m’empare, moi aussi, de ce fouet pour prendre part à un exercice de défoulement collectif. J’avoue que j’y trouve un peu de satisfaction, car j’ai moi aussi été mis au pilori.\n\n'
                                            'Mais toi, tu es doux et humble de cœur. Tu incarnes l’amour, la douceur, la bienveillance. Tu compatis avec les marginalisés, tu t’approches des malades contagieux à qui on ordonne de s’isoler. Tu pardonnes à ceux qui, selon la plupart d’entre nous, ne le mériteraient même pas. À l’inverse, tu condamnes les orgueilleux qui se permettent de pointer les autres du doigt. Tu redonnes leur dignité à ceux qui l’ont perdue en cours de route. Tu les regardes dans les yeux et tu leur dis : « Suis-moi ». Tu rends même la vie aux morts. Tu es le Bon Dieu en personne.\n\n'
                                            'Toi qui n’as rien fait, tu as été condamné injustement. On a menti, on a trouvé des prétextes pour t’infliger un châtiment inhumain. Quand je te regarde, attaché à ce poteau, je vois ce qu’on peut trouver de plus beau en l’être humain être confronté à ce qui y a de plus laid. La haine, l’indifférence, la violence physique, verbale, psychologique, économique, judiciaire : le Malin y va d’une charge absolument déchaînée.\n\n'
                                            'Ton Précieux Sang coule. Il expie le mal. Tu as pris sur toi, dans ta chair, tout le péché du monde.\n\n',
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
                                      File(
                                          '${mydir?.path}/8-couronnement_thumb.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('Le couronnement d\'épines'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/8-couronnement.mp3',
                                        videoFile:
                                            '${mydir?.path}/8-couronnement.mp4',
                                        textNo: 8,
                                        minAudio: 6,
                                        maxAudio: 10,
                                        title: "Le couronnement d'épines",
                                        audioText: Text(
                                            'Contrairement à ceux de ton époque, les rois d’aujourd’hui n’ont plus le pouvoir qu’ils avaient. De nos jours, la plupart des rois tiennent un rôle symbolique. Ils sont le signe d\'une gloire passée. À ton époque, chaque ville peut aspirer à couronner son propre roi. Il suffit de lever une armée assez courageuse pour se battre contre le gouvernant en place et un nouveau roi siège alors à la table des nations.\n\n'
                                            'Une fois établi sur la terre promise, les enfants de Jacob t’ont demandé de leur donner un roi, à eux aussi. Ils voulaient être comme les autres peuples voisins. Jusque-là, c’était toi, Yahwé, le roi d’Israël. Mais ton peuple voulait un roi en chair et en os pour régner sur eux, pour exercer les fonctions royales : rendre justice aux opprimés, les défendre contre les assauts des ennemis et assurer la cohésion de la société. Malheureusement, tous les rois de l’Histoire n’ont pas été à la hauteur de leur fonction.\n\n'
                                            'Toi, tu prends notre chair et tu agis comme un roi sans pour autant en réclamer le titre. Même que lorsque la foule voulut te faire roi, tu as déguerpi au plus vite. Tu n’es pas du type temporel ; plutôt du type éternel. Tu relèves les accablés, tu pardonnes nos erreurs, tu nous donnes les moyens de combattre le péché, le véritable ennemi à notre liberté. Tu nous donnes un commandement nouveau : aimez-vous les uns les autres comme je vous ai aimés. Pour la cohésion sociale, aucun livre de lois ne pourra jamais faire mieux.\n\n'
                                            'C\'est dans la souffrance que tu acceptes d\'être sacré roi de l\'univers : dans le rejet, le sang, la faim, le manque de sommeil et la mort. Les Romains ont eu beau te couronner d’épines pour se moquer, n’en demeure pas moins qu’ils avaient vu juste : tu es vraiment le roi des Juifs, et même, de tout l’univers!\n\n'
                                            'Ô Jésus! Trop souvent je me suis mis à ta place dans ma vie! Je tente parfois de me rendre justice moi-même. Je manque souvent d’humilité. Je juge les autres, et en même temps je me cache mes propres errances. Il y a des occasions où je voudrais assurer la cohésion sociale en exigeant que tout fonctionne à ma manière, allant jusqu’à mentir et manipuler les autres pour arranger la réalité en fonction de ce que je crois être mon intérêt. Quand j’essaie de faire tout ça, je subis des revers plus souvent qu’à mon tour. Alors aujourd’hui, je prends toutes mes erreurs et je les tresse ensemble pour les remettre à leur place : sur ta tête. Je te reconnais comme mon roi. Je te demande de régner sur ma vie. Je laisse à ton jugement miséricordieux les situations injustes que j’ai pu vivre et que je vivrai encore dans l’avenir. Je te demande de me défendre contre les assauts du mal et de m’aider à prendre les décisions justes que je dois prendre. Je te demande, enfin, de me donner la force d’aimer les autres comme tu as aimé : dans l’abnégation et le don total de ma personne. Amen!\n\n',
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
                                      File(
                                          '${mydir?.path}/9-portement_thumb.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('Le portement de la croix'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/9-portement.mp3',
                                        videoFile:
                                            '${mydir?.path}/9-portement2.mp4',
                                        textNo: 9,
                                        minAudio: 6,
                                        maxAudio: 10,
                                        title: "Le portement de la croix",
                                        audioText: Text(
                                            'Pour toi et beaucoup d’autres travailleurs, la nuit est synonyme de labeur. Tu travailles de nuit parce que la chaleur est moins suffocante. Tu es heureux que la semaine soit finie. Une petite sieste te permettra de te remettre en forme pour la longue fin de semaine des festivités de la Pâque qui commencent. Au loin, les clameurs de la foule attirent ton attention. Un autre condamné avance vers le Golgotha. Tu as déjà croisé le chemin de beaucoup de condamnés depuis que tu es venu de Cyrène pour travailler à Jérusalem, mais ce condamné-ci a l’air spécial, vu le nombre de gens qui le suivent et les femmes qui se frappent la poitrine en pleurant. En passant devant toi, tu vois qu’il est beaucoup plus amoché que la moyenne des condamnés. Il peine à avancer. Un soldat t’interpelle : « Toi! Aide-le à porter sa croix! » Toi qui as beaucoup de courses à faire pour préparer les fêtes de la Pâque, ça tombe mal. Mais on ne peut pas vraiment refuser d’obéir à un soldat de l’armée romaine, n’est-ce pas?\n\n'
                                            'L’idée d’aider un condamné à mort te dégoûte. Mais, en marchant à ses côtés, en soutenant sa croix, tu commences à le regarder. Tu commences à avoir pitié. Cet homme, au fond, te ressemble. Comme toi, il n’a pas dormi de la nuit. Comme toi, son corps lui fait mal. Comme Lui, tu trébuches toi-même sur les cailloux et les crevasses. Il s’arrête devant un groupe de femmes et il leur dit : « Ne pleurez pas sur moi, femmes de Jérusalem! Pleurez plutôt sur vous-mêmes et vos enfants! Car voici venir des jours où l’on dira : « Heureuses les femmes stériles, les entrailles qui n’ont pas enfanté et les seins qui n’ont pas nourri! Car si on traite ainsi le bois vert, qu’adviendra-t-il du sec? »\n\n'
                                            'Il est innocent, c’est clair. Mais qu’y a-t-il à faire, pour un étranger, devant l’injustice de tout un système? Rien d’autre que d’y mettre un peu de charité en l’accompagnant vers sa mort. Alors tu portes sa croix en l’encourageant à avancer. Tu es peut-être un étranger, Simon, mais tu es le seul ami qui lui reste en ce moment. Tu as vécu un moment privilégié qu’aucun autre de ses disciples n’a vécu. Tu as incarné la parabole que ce condamné racontait à propos d’un bon Samaritain : tu as pris sur toi une partie de sa peine et de sa souffrance.\n\n'
                                            'Quand je te vois, Simon, porter la croix de Jésus, je pense à tant d’autres personnes qui ont tenu la main d’étrangers au moment où ils passaient de ce monde à l’autre. Je ne peux m’empêcher de penser à ceux qui sont morts sans que personne ne les y accompagne, parce que seuls ou isolés. J’aimerais suivre ton exemple et trouver un sens aux obligations qui me sont imposées. J’aimerais porter la croix d’un autre, de temps en temps. J’aimerais me rapprocher de Jésus, au moment où il a besoin de moi. Comme toi, je veux m’émerveiller d’avoir pu aider Dieu.\n\n',
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
                                      File(
                                          '${mydir?.path}/10-crucifixion_thumb.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('La crucifixion'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/10-crucifixion.mp3',
                                        videoFile:
                                            '${mydir?.path}/10-crucifixion.mp4',
                                        textNo: 10,
                                        minAudio: 6,
                                        maxAudio: 10,
                                        title: "La crucifixion",
                                        audioText: Text(
                                            'Il fait noir en plein jour. Tu es broyé, battu, exténué. Tous tes os te font mal. Tes bras levés, cloués sur le bois, te font suffoquer. Les clous rouillés qui frottent sur les os de tes poignets envoient des espèces de décharges électriques dans ton dos. Pour t’aider à respirer, tu pousses parfois sur tes pieds pour te relever, mais ce sont alors les clous qui traversent tes pieds qui envoient des chocs électriques. Tes plaies, causées par les coups de fouet, s’infectent à cause du sable qui y est entré quand tu es tombé. Les épines sur ta tête percent ta peau et frottent sur ton crâne. Les mots ne suffisent pas à exprimer la douleur que tu ressens dans ta chair et dans ton âme.\n\n'
                                            'Ta mère est là. Bien que ce soit toi qui es cloué à la croix, elle se tord de douleur. La prophétie du vieux Syméon est accomplie : une épée lui transperce le cœur. Elle savait que ce jour risquait d’arriver, mais elle ne se doutait pas que ce pouvait être pire que ce qu’elle aurait pu imaginer. Tu as beau être un homme mature, SON ENFANT est en train de mourir. Une mère ne veut pas voir mourir son enfant. Ce n’est pas dans l’ordre naturel des choses.\n\n'
                                            'Ton ami Jean arrive. Tu trouves encore la force de lui sourire : « Voici ta mère ». Et dès ce jour, il la prit chez elle, et elle le prit comme son fils. Il se rappelle ce que tu avais dit, la veille : « Voici mon corps, livré pour vous. » Tu as dit aussi : « Voici mon sang, le sang de la nouvelle Alliance, éternelle. Voici mon sang, versé pour vous et beaucoup d’autres. Buvez-en tous ». Au pied de ta croix, en effet, il se retient de recueillir ce Précieux Sang, versé pour racheter nos fautes. Nos fautes les plus graves.\n\n'
                                            'Les soldats se partagent tes vêtements. Tu as pitié d’eux. Tu dis: « Père, pardonne-leur, car ils ne savent pas ce qu’ils font. » Même au seuil de la mort, tu pardonnes à ceux qui te font du mal.\n\n'
                                            'Les clameurs de la foule se taisent. Tu dis : « Tout est accompli ». Et, inclinant la tête, tu dis : « Père, entre tes mains, je remets mon esprit ». Puis tu pousses un grand cri. Tu es mort.\n\n'
                                            'On pense que c’est fini, que le Christ, ce n’était peut-être pas toi, finalement. Le Christ pourrait-il mourir cloué sur une croix? Ce serait un scandale!\n\n'
                                            'Tu es mort. Tes disciples ont peur qu’il leur arrive la même chose qu’à toi. Ils se cachent. On t’enveloppe dans un grand drap de lin. Tu es mort, on n’arrive pas à le croire.\n\n'
                                            'On te met dans un tombeau tout neuf. On n’a même pas le temps de laver ton corps parce que la nuit tombe et que c’est le Sabbat qui commence. On ne comprend pas ce qui vient de se passer. Tes amis n’arrivent pas à y croire. Il y a cinq jours, on t’acclamait comme le Messie et ce soir, tu gis, sans vie. On t’a transpercé d’une lance. Tu as perdu tout ton sang.\n\n'
                                            'Il fait noir. On a perdu celui qu’on aimait, celui qui illuminait nos vies par sa présence lumineuse. Celui qui rendait la vue aux aveugles et leur dignité aux affligés ne parcourra plus les routes du\n\n'
                                            'pays. Tu es mort. Il fait noir. On a peur. Nous sommes désemparés. On dirait que le mal a gagné. Dieu a quitté cette Terre.',
                                            style: TextStyle(color: black)),
                                      ));
                                },
                              ),
                            ],
                          ),
                          ListView(
                            padding: const EdgeInsets.all(8),
                            children: <Widget>[
                              ListTile(
                                leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.file(
                                      File(
                                          '${mydir?.path}/11-resurrection_thumb.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('La résurrection'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/11-resurrection.mp3',
                                        videoFile:
                                            '${mydir?.path}/11-resurrection.mp4',
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
                                      ));
                                },
                              ),
                              Divider(),
                              ListTile(
                                leading: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.file(
                                    File(
                                        '${mydir?.path}/12-ascension_thumb.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                title: Text('L\'Ascension'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/12-ascension.mp3',
                                        videoFile:
                                            '${mydir?.path}/12-ascension.mp4',
                                        textNo: 12,
                                        minAudio: 11,
                                        maxAudio: 15,
                                        title: "L'Ascension",
                                        audioText: Text(
                                            'On entend souvent qu’on ne sait pas ce qu’il y a de l’autre côté de la mort, car personne n’en est jamais revenu pour nous dire comment c’est. Toi, tu sais bien que ce n’est pas vrai : Jésus en est bel et bien revenu pour nous le dire : « n’ayez pas peur. Tout est accompli. Croyez seulement en moi. » Tu commences à intégrer ce qu’il dit depuis le début : il faut mourir afin de vivre.\n\n'
                                            'Depuis qu’Il est ressuscité, il n’est plus tout à fait le même. En fait, oui, c’est le même, mais différent. Il porte une joie, une plénitude de l’existence que tu n’avais jamais vue auparavant. Il parle encore du Royaume de Dieu, il utilise les mêmes mots, mais ils résonnent différemment, maintenant qu’il est passé de la mort à la vie. Il te dit : « meurs à toi-même, plonge dans ma mort et renais dès maintenant à la vie! » Tu trouves ça bizarre, tu ne sais pas trop ce que ça signifie, mais tu te laisses aller. Tu décides de lui faire confiance.\n\n'
                                            'Puis un jour, il commence à dire qu’il va falloir qu’il parte pour de bon. Tes amis et toi êtes attristés par cette nouvelle étape. Vous l’aviez perdu une première fois, vous ne voulez pas qu’il parte une deuxième fois! Mais il vous dit : « il faut que je parte afin que je vous envoie une force, celle de l’Esprit Saint qui descendra sur vous. » Ce sont des paroles bien mystérieuses que vous ne comprenez pas. Puis il est enlevé au ciel, comme ça, au complet. Il monte, et il disparaît comme une fusée traverse l’atmosphère. Mais cette fois, il n’y a pas de chagrin. Deux hommes vêtus de blanc sont à vos côtés, mais vous ne savez pas depuis combien de temps ni d’où ils sont venus. Ils disent, en haussant les épaules : « Pourquoi restez-vous là à regarder le ciel? Ce Jésus qui été enlevé au ciel viendra comme ça, de la même manière que vous l’avez vu s’en aller au ciel. » Dans l’attente de ce jour, nous avançons dans l’espérance.\n\n',
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
                                      File(
                                          '${mydir?.path}/13-pentecote_thumb.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('La Pentecôte'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/13-pentecote.mp3',
                                        videoFile:
                                            '${mydir?.path}/13-pentecote.mp4',
                                        textNo: 13,
                                        minAudio: 11,
                                        maxAudio: 15,
                                        title: "La Pentecôte",
                                        audioText: Text(
                                            'Tous les juifs du monde veulent être à Jérusalem durant les festivités pascales, et à eux se joignent quelques touristes de l’empire qui viennent voir cette merveille du monde qu’est le Temple de la Ville. Toi, tu te caches encore, de peur qu’il ne t’arrive la même chose que ce qu’ils ont fait au maître il y a cinquante jours. Sa mère est avec vous, c’est-à-dire toi et les autres disciples. Où d’autre pourrait-elle aller, d’ailleurs? Elle vous parle de lui. Elle vous rassure, vous donne du courage. Tu aimes passer du temps avec elle, parce qu’elle te montre des aspects de sa personnalité qui t’échappent. Elle, elle le connaît comme si elle l’avait tricoté. Elle en connaît chaque maille, chaque contour. Quand tu te rapproches d’elle, tu te rapproches de lui. Il te manque. Tu as hâte qu’il revienne.\n\n'
                                            'Soudain, il y a un grand bruit. Il y a du vent à l’intérieur de la pièce. Les papiers volent. Les disciples ont un peu peur. Quand le maître était là, il calmait les tempêtes, il maîtrisait les forces de la nature. Mais depuis qu’il n’est plus là, tu te sens plus vulnérable. Les phénomènes surnaturels s’additionnent, mais celui-ci est une coche au-dessus de tous les autres. On dirait qu’il y a un feu qui apparaît, et que des petites flammes de ce grand feu se posent sur chacun de vous. C’est cette force que Jésus disait qu’il nous enverrait : celle de l’Esprit Saint.\n\n'
                                            'Dès lors que tu l’as reçu, plus rien ne t’a jamais arrêté. Cet Esprit Saint, c’est l’Esprit de liberté. C’est la force qui te guide maintenant, et qui t’éclaire devant les décisions à prendre. L’Esprit qui unifiait Jésus à son Père, il t’est maintenant donné, à toi. Tout ce que tu as à faire, c’est de t’asseoir en silence et de l’écouter. C’est cette flamme qui est en accord avec ta tête et ton cœur. C’est celle qui te dit : fais-moi confiance, aie confiance en la Vie. C’est celle qui te fait regarder au-delà du ciel et qui te fait crier « Abba! PAPA! » Cette Énergie dont parlent certains, c’est l’Esprit de Dieu qui parle à ton cœur. Il n’y a pas de contradiction en l’Esprit, mais Il est plutôt un signe d’unité, interne d’abord, puis avec tout ce qui est. On le devine par ses effets, comme on voit les feuilles des arbres bouger sous la brise. C’est cette intuition qui te permet de savoir, viscéralement, qui est ce Dieu dont parle Jésus. C’est cette force surnaturelle qui te permet de pardonner quand tu penses que c’est juste impossible. C’est l’Esprit qui t’a voulu et créé dans le sein de ta mère, qui te connaît et qui veut te dévoiler à toi-même. C’est le courant qui te fait voir les hasards de la vie et qui te fait te demander : « quelles étaient les chances que cette coïncidence arrive, à cet endroit et en ce moment précis? »\n\n'
                                            'C’est Dieu qui te parle.\n\n'
                                            'C’est Jésus qui t’envoie un bec soufflé : reçois l’Esprit Saint.\n\n',
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
                                      File(
                                          '${mydir?.path}/14-assomption_thumb.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('L\'Assomption'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/14-assomption.mp3',
                                        videoFile:
                                            '${mydir?.path}/14-assomption.mp4',
                                        textNo: 14,
                                        minAudio: 11,
                                        maxAudio: 15,
                                        title: "L\'Assomption",
                                        audioText: Text(
                                            'J’ai lu dans la Bible que je suis fait à l’image de Dieu. C’est difficile à comprendre pour moi. Mais Dieu a engendré un homme qui est en tout point pareil à Lui : c’est Jésus. Si je ressemble physiquement à Jésus, je sais pertinemment que je ne suis pas Dieu. Mais toi, Marie, tu me ressembles davantage. Tu avances dans la foi, comme moi. Tu ne comprends pas tout, mais tu médites tout en ton cœur. Tu pries le Seigneur, comme moi. Tu es pour moi une mère, une sœur. En vieillissant, nos sœurs deviennent mères et on te comprend toujours un peu mieux, peut-être à mesure qu’on se rend compte qu’on ne maîtrise absolument rien. Plus je me rapproche de toi, Marie, et plus je me rapproche de ton fils.\n\n'
                                            'Ton humilité parfaite est un exemple pour moi. Tu m’apprends à aimer Dieu et à Lui faire confiance. Tu es un exemple d’obéissance, non pas servile, mais libre. Tu es la femme qui dit oui. Tu es la femme de la réconciliation, celle qui sait concrètement mettre le bien de l’avant dans ta réalité. Tu es l’épouse et la mère de Dieu, toi, petite humaine d’un petit village modeste et isolé. Tu me montres qu’on peut réaliser de grandes choses en étant tout petits.\n\n'
                                            'Ton Assomption, Marie, c’est la promesse de la mort qui m’attend. Non pas une mort qui est une fin, mais un endormissement en attendant la résurrection des morts. Tu es déjà parvenue là où nous espérons arriver grâce à la promesse de ton Fils. Toi, Marie, dans toute ta vie et même ta mort, tu ASSUMES la vie vécue et la promise. Tu es la preuve, si une telle chose existe dans le monde de la foi, que la confiance en ton Fils donne lieu à une vie pleinement vécue.\n\n'
                                            'Tu n’as pas été heureuse tous les jours de ta vie. Tu as eu plus que ta part de souffrances. Mais la façon dont tu meurs paisiblement et que tu retrouves immédiatement ta place au ciel est une espérance pour moi, qui choisis de prendre le chemin de l’humilité que tu as emprunté.\n\n'
                                            'Tu es belle, Marie. Prie pour moi, toi qui es au ciel, tout près de ton Fils, pour que je tienne bon. Merci d’être toujours attentive envers moi et ceux qui comptent pour moi. Aide-moi à obtenir de Dieu la grâce que mes demandes soient exaucées. Prie pour moi, pauvre pécheur, maintenant et à l’heure de ma mort.\n\n',
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
                                      File(
                                          '${mydir?.path}/15-couronnement.png'),
                                      fit: BoxFit.contain),
                                ),
                                title: Text('Le couronnement de Marie au Ciel'),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.pushNamed(context, '/audiopage',
                                      arguments: MysteryFields(
                                        audioFile:
                                            '${mydir?.path}/15-couronnement.mp3',
                                        videoFile:
                                            '${mydir?.path}/15-couronnement.mp4',
                                        textNo: 15,
                                        minAudio: 11,
                                        maxAudio: 15,
                                        title:
                                            "Le couronnement de Marie au Ciel",
                                        audioText: Text(
                                            'De tous les humains nés de deux humains, personne n’a jamais été plus près de Jésus que toi, Marie. Toutes les paroles qu’il dit, tu les fais tiennes comme si elles avaient toujours été là, en toi. À sa suite, tu te penches sur les plus vulnérables avec cet amour surnaturel que nous demandons de recevoir et de transmettre. Quand je te regarde, Marie, je vois l’exemple de ce qu’est une mère parfaite. Tu adoptes les amis de ton Fils comme tes propres enfants. Tu es l’espérance, pour moi, que grâce à ton fils je pourrai vivre, moi aussi, dans cette plénitude de vie éternelle que j’aurai tant recherchée durant ma vie. Personne ne t’a jamais vue manquer ton coup, Marie, et pourtant, tu es une humaine comme nous. Moi, j’aurai manqué la cible à quelques reprises, parfois de peu, parfois par des kilomètres.\n\n'
                                            'Imiter ton fils est un défi qui m’apparaît trop grand pour moi, humain bien imparfait. Alors je choisis de te prendre comme modèle à imiter. Comme toi, je veux méditer la Parole de Dieu pour la mettre en pratique dans mon quotidien, dans ma réalité. Comme toi, je veux être attentif aux autres et intercéder pour eux auprès de Dieu. « Ils n’ont plus de vin ». C’est tout ce que tu as eu à dire pour que le Christ se dévoile enfin à toute l’humanité. Comme toi, je veux être remué de tout mon être devant la souffrance des créatures de Dieu. Comme toi, je veux vivre parmi les disciples de ton Fils, pour nous encourager les uns les autres à marcher vers le ciel, dès notre vie terrestre. Quand je te regarde, toi, l’objectif s’approche de ma portée.\n\n'
                                            'Toutes les mères de rois exercent une grande influence auprès de leurs fils, bien que le pouvoir ne leur appartienne pas à proprement parler. Toi, Marie, Mère de Dieu, tu peux attirer l’attention du Tout-Puissant envers ma détresse et mon besoin d’amour et de paix. Ô, Marie, ma mère et ma soeur, permets-moi de me rapprocher de toi et de t’entendre parler à mon cœur de tout ce que ton Fils veut faire de moi!\n\n',
                                            style: TextStyle(color: black)),
                                      ));
                                },
                              ),
                            ],
                          ),
                        ],
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
            ));
  }

  _onItemTapped(int index) {
    // if (index == 0) {
    //   Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    // } else
    if (index == 0) {
      Navigator.pushNamed(context, '/categories');
    } else {
      Navigator.pushNamed(context, '/contacts');
    }
  }
}
