import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:notredame/includes/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import '../../player/PlayingControls.dart';
import '../../player/PositionSeekWidget.dart';
import '../../player/SongsSelector.dart';

class EntendreTout extends StatefulWidget {
  const EntendreTout({Key? key}) : super(key: key);
  @override
  _EntendreToutState createState() => _EntendreToutState();
}

class _EntendreToutState extends State<EntendreTout> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool _play = false;
  late VideoPlayerController _controller;
  bool showText = false;
  Directory? mydir;

  Future getDir() async {
    final dir = await getApplicationDocumentsDirectory();
    setState(() {
      mydir = dir;
    });
    return dir;
  }

  @override
  void initState() {
    super.initState();
    getDir().then((value) {
      assetsAudioPlayer.open(
          Playlist(audios: [
            Audio.file('${mydir?.path}/annonciation.mp3'),
            Audio.file('${mydir?.path}/isitation.mp3'),
            Audio.file('${mydir?.path}/3-La-Nativite.mp3'),
            Audio.file('${mydir?.path}/4-La-Presentation.mp3'),
            Audio.file('${mydir?.path}/5-recouvrement.mp3'),
            Audio.file('${mydir?.path}/6-agonie.mp3'),
            Audio.file('${mydir?.path}/7-flagellation.mp3'),
            Audio.file('${mydir?.path}/8-couronnement.mp3'),
            Audio.file('${mydir?.path}/9-portement.mp3'),
            Audio.file('${mydir?.path}/10-crucifixion.mp3'),
            Audio.file('${mydir?.path}/11-resurrection.mp3'),
            Audio.file('${mydir?.path}/12-ascension.mp3'),
            Audio.file('${mydir?.path}/13-pentecote.mp3'),
            Audio.file('${mydir?.path}/14-assomption.mp3'),
            Audio.file('${mydir?.path}/15-couronnement.mp3'),
          ], startIndex: 0),
          autoStart: false,
          loopMode: LoopMode.playlist //loop the full playlist
          );

      //assetsAudioPlayer.next();
      // assetsAudioPlayer.previous();
      //assetsAudioPlayer.playlistPlayAtIndex(1);

      //video player
      _controller = VideoPlayerController.file(
          File('${mydir?.path}/1-annonciation.mp4'),
          videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
        ..initialize().then((_) {
          // Once the video has been loaded we play the video and set looping to true.
          _controller.play();
          _controller.setLooping(true);
          _controller.setVolume(0.0);
          _controller.setLooping(true);
          // Ensure the first frame is shown after the video is initialized.
          setState(() {});
        });
    });

    // assetsAudioPlayer.open(
    //     Playlist(audios: [
    //       Audio("assets/audio/annonciation.mp3"),
    //     ]),
    //     loopMode: LoopMode.playlist //loop the full playlist
    //     );

    // assetsAudioPlayer.next();
    // assetsAudioPlayer.previous();
    // assetsAudioPlayer.playlistPlayAtIndex(0);
    // // Pointing the video controller to our local asset.
  }

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return mydir == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('Entendre Tout'),
            ),
            body: Stack(
              children: [
                SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              color: colorPrimary,
                              onPressed: () {
                                // print(mydir?.path);
                                setState(() {
                                  _play = !_play;
                                });
                                _play
                                    ? assetsAudioPlayer.play()
                                    : assetsAudioPlayer.pause();
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.play_circle_outline_sharp),
                                  Text('ENTENDRE')
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            MaterialButton(
                              color: colorPrimary,
                              onPressed: () {
                                setState(() {
                                  showText = !showText;
                                });
                              },
                              child: Row(
                                children: [
                                  showText == false
                                      ? Icon(Icons.check)
                                      : Icon(Icons.cancel_outlined),
                                  Text('LIRE')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      showText != true
                          ? Container()
                          : AspectRatio(
                              aspectRatio: 4 / 5,
                              child: Container(
                                child: ListView(
                                  children: [
                                    Container(
                                      color: Colors.white30,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                          'JOYEUX\n\n'
                                          'Comment ??a s???est pass?? r??ellement, pour toi, cette rencontre avec l???ange? Je sais bien, moi, qu???il y a toujours un d??calage entre ce qu\'on entend et ce qu\'on comprend. D\'ailleurs, peut-on r??ellement rencontrer un ange? Si c???est possible, alors j???en ai s??rement crois?? quelques-uns moi-m??me. Dis donc, avais-tu d??j?? enlev?? tes sandales, ou les as-tu plut??t retir??es au moment de l\'apparition de l\'ange? C\'est ce qu\'avait d?? faire Mo??se en pr??sence du Tout-Puissant. C???est ce qu???on fait dans un lieu saint. Et cette grotte que tu habites est maintenant un lieu sanctuaire, Marie. Peux-tu le r??aliser ?? ce moment pr??cis?\n\n'
                                          'Tu es toute jeune quand l???ange Gabriel t???appara??t. Moi, ?? cet ??ge, si je devais rencontrer un messager c??leste, je serais probablement terrifi??. J???exigerais des preuves qu???il est r??ellement un ange du Ciel. Ou peut-??tre encore aurais-je ??t?? saisi d???une telle exaltation que j???en aurais perdu la raison. Mais toi, tu ??coutes, tu tressailles, tu poses des questions. Tu as une attitude simple, d??licate, discr??te, forte, mais non servile, d??sireuse de savoir, de voir clair et, en m??me temps, tu souhaites aimer et vouloir conna??tre la v??rit?? . \n\n'
                                          'Cette branche que tient en main l\'ange Gabriel, cette branche qui fleurit, en comprends-tu le sens? Comprends-tu que la racine de Jess??, d??laiss??e depuis des si??cles et ass??ch??e, refleurit au moment o?? tu entends les paroles de l???ange? Tu es si jeune, Marie! Peut-??tre quinze ans, peut-??tre m??me quatorze. Peux-tu r??ellement comprendre ce qui t???arrive? Peux-tu croire ?? quel point cette rencontre avec l???ange va transformer le monde? Peux-tu imaginer qu???un jour, on comptera les ann??es AVANT et apr??s ton accouchement? S??rement pas! Bien des ann??es plus tard, tu confias que tu gardais tout cela en toi-m??me et que tu m??ditais sur leur sens profond. Dans la joie. Dans l\'esp??rance de jours meilleurs. \n\n'
                                          'Au fond, Marie, tu ressembles ?? toutes les jeunes mamans : ?? la fois pleine d\'espoir en l\'avenir et inqui??te pour ce qui peut arriver. Comme plusieurs mamans, tu doutes peut-??tre parfois de pouvoir ??tre ?? la hauteur. Mais tu te remets dans les mains de Dieu, tu as confiance. Tu sais que ta vie sera boulevers??e par cette grossesse impr??vue. Tu aurais souhait?? un moment plus opportun pour la vivre, cette grossesse. Tu sais qu???on va te juger, peut-??tre m??me te lapider, parce que tu attends un b??b?? avant m??me d?????tre mari??e. Tu connais ce qui peut arriver de pire. Mais ce qui peut arriver de mieux, tu l???attends. C???est ce que signifie le mot esp??rer : attendre ce qui doit arriver. Tu t\'en remets ?? Dieu. Tu dis : ?? Voici la servante du Seigneur. Qu\'il me soit fait selon ta parole. ??\n\n\n(MARTINI 1986), p. 11\n\n\n'
                                          'Comment ??a s???est pass?? r??ellement, pour toi, cette rencontre avec l???ange? Je sais bien, moi, qu???il y a toujours un d??calage entre ce qu\'on entend et ce qu\'on comprend. D\'ailleurs, peut-on r??ellement rencontrer un ange? Si c???est possible, alors j???en ai s??rement crois?? quelques-uns moi-m??me. Dis donc, avais-tu d??j?? enlev?? tes sandales, ou les as-tu plut??t retir??es au moment de l\'apparition de l\'ange? C\'est ce qu\'avait d?? faire Mo??se en pr??sence du Tout-Puissant. C???est ce qu???on fait dans un lieu saint. Et cette grotte que tu habites est maintenant un lieu sanctuaire, Marie. Peux-tu le r??aliser ?? ce moment pr??cis?\n\n'
                                          'Tu es toute jeune quand l???ange Gabriel t???appara??t. Moi, ?? cet ??ge, si je devais rencontrer un messager c??leste, je serais probablement terrifi??. J???exigerais des preuves qu???il est r??ellement un ange du Ciel. Ou peut-??tre encore aurais-je ??t?? saisi d???une telle exaltation que j???en aurais perdu la raison. Mais toi, tu ??coutes, tu tressailles, tu poses des questions. Tu as une attitude simple, d??licate, discr??te, forte, mais non servile, d??sireuse de savoir, de voir clair et, en m??me temps, tu souhaites aimer et vouloir conna??tre la v??rit?? . \n\n'
                                          'Cette branche que tient en main l\'ange Gabriel, cette branche qui fleurit, en comprends-tu le sens? Comprends-tu que la racine de Jess??, d??laiss??e depuis des si??cles et ass??ch??e, refleurit au moment o?? tu entends les paroles de l???ange? Tu es si jeune, Marie! Peut-??tre quinze ans, peut-??tre m??me quatorze. Peux-tu r??ellement comprendre ce qui t???arrive? Peux-tu croire ?? quel point cette rencontre avec l???ange va transformer le monde? Peux-tu imaginer qu???un jour, on comptera les ann??es AVANT et apr??s ton accouchement? S??rement pas! Bien des ann??es plus tard, tu confias que tu gardais tout cela en toi-m??me et que tu m??ditais sur leur sens profond. Dans la joie. Dans l\'esp??rance de jours meilleurs. \n\n'
                                          'Au fond, Marie, tu ressembles ?? toutes les jeunes mamans : ?? la fois pleine d\'espoir en l\'avenir et inqui??te pour ce qui peut arriver. Comme plusieurs mamans, tu doutes peut-??tre parfois de pouvoir ??tre ?? la hauteur. Mais tu te remets dans les mains de Dieu, tu as confiance. Tu sais que ta vie sera boulevers??e par cette grossesse impr??vue. Tu aurais souhait?? un moment plus opportun pour la vivre, cette grossesse. Tu sais qu???on va te juger, peut-??tre m??me te lapider, parce que tu attends un b??b?? avant m??me d?????tre mari??e. Tu connais ce qui peut arriver de pire. Mais ce qui peut arriver de mieux, tu l???attends. C???est ce que signifie le mot esp??rer : attendre ce qui doit arriver. Tu t\'en remets ?? Dieu. Tu dis : ?? Voici la servante du Seigneur. Qu\'il me soit fait selon ta parole. ??\n\n\n(MARTINI 1986), p. 11\n\n\n'
                                          'Tu es surprise de voir arriver ta jeune cousine. Marie n???a-t-elle pas un mariage ?? pr??parer et des histoires ?? clarifier? Apr??s tout, on dit qu???il faut d???abord s???aider pour aider les autres. Comment ses parents ont-ils bien pu la laisser partir si loin, toute seule?\n\n'
                                          'Quand tu l???aper??ois, tes entrailles sont remu??es de joie. Tu t???exclames : ?? Tu es b??nie entre toutes les femmes, et le fruit de tes entrailles est b??ni! ?? Tu sens bien que Marie n???arrive pas par hasard. D???ailleurs, plusieurs croient que les hasards n???existent pas, et que la synchronicit?? est un signe que Dieu est toujours ?? l?????uvre de nos jours. Tu demandes : ?? Comment m\'est-il donn?? que vienne ?? moi la m??re de mon Sauveur? ??\n\n'
                                          'Oui, bienheureuse celle qui a cru en l\'accomplissement de ce qui lui a ??t?? dit de la part du Seigneur! En c??toyant ta jeune cousine, tu la d??couvres dans l???intimit??. Quand elle ??coute, elle ne per??oit pas seulement un ??v??nement, mais aussi sa signification. Par l???oreille, elle per??oit une r??alit?? en m??me temps que son sens profond : ?? c???est la seule mani??re d?????couter ??, dit-elle nonchalamment en haussant ses jeunes ??paules. Elle ne s???est d???ailleurs pas content??e de seulement entendre l???ange lui dire que tu ??tais enceinte par l???intervention miraculeuse de Dieu : elle d??cide d???aller tr??s vite ?? ta rencontre. Marie est faite d???un seul bloc : ce qu???elle entend, elle en trouve le sens profond en son c??ur. Puis, elle d??cide de ce qu???il y a de mieux ?? faire, et elle le fait. Elle r??concilie ton ??il et ton oreille avec ton c??ur et tes mains.\n\n'
                                          'J???imagine la r??ponse qu???elle t???aurait donn??e si tu lui avais demand?? pourquoi une jeune fille de cet ??ge, et en une telle situation, a d??cid?? de partir si rapidement : ?? Une d??cision, prise dans le tr??fonds du c??ur, doit passer imm??diatement ?? ex??cution, sinon dans le cas contraire, elle pourrirait. ??\n\n'
                                          'La f??condit?? est un myst??re imp??n??trable. Tant de gens auraient souhait?? ??tre parents sans qu???ils puissent conna??tre cette joie, alors que d???autres se sentent d??sempar??s en apprenant la venue d???un nouveau-n??. Toi, ??lisabeth, qu???on appelait la st??rile, voil?? que tu attends miraculeusement un enfant. Tu le sais maintenant de tout ton ??tre : ?? Dieu, rien n???est impossible. Cet enfant est devenu un tr??s grand proph??te : Jean, le Baptiste. Il dit : ?? Repentez-vous de vos erreurs du pass?? et plongez dans la vie nouvelle qui vous attend. Pr??parez-vous pour la grande Rencontre : le Messie arrive, il va changer votre vie si vous le voulez! ??),\n\n'
                                          'Dieu, tu es vraiment un Dieu ??tonnant! Tu viens nous sauver toi-m??me en chair et en os. Tu ne descends pas du ciel en chariots de feu, ce n???est pas ton style. Tu es plut??t du genre humble et doux. Doux comme un b??b?? qui a besoin d???une maman et d???un papa. Tu as choisi Marie parce qu???elle ??tait promise ?? Joseph, un homme humble, lui aussi. Un gars de la construction, peu bavard, mais fiable. Tu nais comme nous tous, dans le sang et la douleur. Tu es vuln??rable, comme nous tous. On doit prendre soin de notre Dieu.\n\n'
                                          'Tu es humble. Est-ce la raison pour laquelle tu choisis toujours les pauvres en premier, eux qui acceptent plus facilement que tu les sauves? Heureux les pauvres en esprit, car le Royaume des Cieux est ?? eux! ?? ta naissance, tes anges annoncent donc la Bonne Nouvelle ?? des marginaux, des bergers. Comme toi, ils sont humbles et ils savent prendre soin de petites b??tes vuln??rables. L?????vangile selon saint Luc raconte, lorsque J??sus est n??, que Marie l???a envelopp?? dans des langes et l???a couch?? dans une cr??che. C???est ?? ce signe qu???ils ont reconnu ton Fils : un enfant lang?? et couch?? dans une cr??che. Il ne pouvait y en avoir qu???un seul dans tout Bethl??em : personne ne prend soin d???un b??b?? avec autant d???amour et de pr??cautions pour ensuite le d??poser dans une mangeoire d???animaux!\n\n'
                                          'Mais ce n???est pas parce qu???il manquait de soins et d???amour que cet enfant est envelopp?? de langes et couch?? dans une mangeoire. C???est plut??t parce qu???il n???y avait pas de place pour toi, ce jour-l??, pour que tu naisses dans des conditions dignes du roi que Tu as toujours ??t??, que Tu es et que Tu seras toujours. Comme des millions d???autres humains, P??re, ton Fils J??sus est n?? pendant que ses parents ??taient en d??placement. Mais d???o?? vient cette lumi??re qui rend vos visages si lumineux, dans cette grotte sombre et sale? C???est la joie de tout parent qui se p??me devant la perfection de leur nouveau-n??! Une lumi??re si ??blouissante ne peut ??tre contenue. Dans cet endroit froid et sombre, cette lumi??re, J??sus, me permet d???admirer ton doux visage de b??b??. Ton visage humain ressemble au mien. Je suis fait ?? ton image, mais en basse r??solution, pourrait-on dire.\n\n'
                                          'Il n???y a pas de place pour toi, ?? Bethl??em, ce jour-l??, pour que tu naisses dans des conditions dignes d???un roi. Il n???y avait pas de place pour toi, non plus, dans mon c??ur, pour que tu y naisses et y grandisses. Heureusement, tu m???as touch?? d???une mani??re douce et humble, au moment opportun. ??, Seigneur, grandis encore en mon ??me!\n\n'
                                          'Dans ta religion, J??sus, le premier gar??on d???une famille doit ??tre consacr?? au Seigneur. Peut-??tre tes parents ont-ils h??sit?? ?? t???emmener au Temple pour te pr??senter au Seigneur. Apr??s tout, ils savaient, eux, que tu ??tais son Fils. Mais peut-??tre se sont-ils dit, comme plusieurs d???entre nous aujourd???hui, que m??me si on ne sait pas tout le temps exactement pourquoi, nous rendre au Temple pour r??p??ter des gestes religieux qui nous ont ??t?? transmis ne fait de mal ?? personne. Au contraire, il arrive souvent que de belles choses se produisent quand on d??cide de faire un pas vers Dieu, m??me si on ne comprend pas compl??tement le sens des gestes et des paroles. Nous rendre au Temple et comprendre lentement, c???est cela aussi, avancer dans la foi.\n\n'
                                          'Tes parents avancent dans la foi et ils se rendent au Temple pour y faire la rencontre de deux ??trangers qui prononceront des paroles myst??rieuses. D???abord, il y a ce vieux Sym??on, qui attend le Messie depuis de nombreuses ann??es, et qui dit ?? qui veut bien l???entendre que Dieu lui a promis qu???il Le verrait de son vivant. Il peut se compter heureux que tes parents aient accept?? de laisser un ??tranger te prendre dans ses bras. Plusieurs parents auraient refus??. Mais dans ce genre d???endroits, on se permet parfois de poser des gestes qu???on n???oserait pas poser en d???autres circonstances. Le vieux Sym??on te prend, et il l??ve les yeux au ciel et prononce des paroles que ta m??re n???a jamais oubli??es : ?? Maintenant, ??, Ma??tre souverain, tu peux laisser ton serviteur partir en paix, selon ta parole. Car mes yeux ont vu le salut que tu pr??parais ?? la face des peuples : lumi??re qui se r??v??le aux nations, et donne gloire ?? ton peuple Isra??l. ??\n\n'
                                          'M??me si tes parents savaient qui tu ??tais et d???o?? tu venais, ils ont ??t?? ??tonn??s de ce que des inconnus disaient de toi. Ce n???est donc pas difficile d???imaginer qu???une fois devenu adulte, des gens qui ont vu ce que tu peux faire, et entendu tes paroles qui donnent la vie, ne t???aient pas reconnu comme le Messie! Dans ce contexte, ils ont raison de trouver un peu ??tonnant que de purs ??trangers, en voyant ce petit b??b?? qui leur est pr??sent??, reconnaissent en lui le Fils du Dieu Vivant. Puis Sym??on a b??ni tes parents et a dit ?? ta maman : ?? Vois! cet enfant doit amener la chute et le rel??vement d???un grand nombre en Isra??l ; il doit ??tre un signe en butte ?? la contradiction - et toi-m??me, une ??p??e te transpercera l?????me! ??? afin que se r??v??lent les pens??es intimes de bien des c??urs. ??\n\n'
                                          'Si l???anecdote de ta Pr??sentation au Temple s???arr??tait l??, J??sus, je serais d??j?? bien troubl??. Mais il y a encore cette vieille femme de 84 ans, Anne, qui ??tait une proph??tesse. Elle ne quittait pas le Temple depuis plus de cinquante ans, servant Dieu nuit et jour. Bref, c?????tait une sainte femme. Tout le monde la connaissait et l???appr??ciait. Elle aussi louait Dieu et parlait de toi ?? tous ceux qui attendaient la d??livrance que Dieu avait promise ?? ceux qui l???aiment.\n\n'
                                          'Je ne sais trop comment, mais quand je regarde ces sc??nes de ta vie, je me mets ?? r??fl??chir ?? ce que tu repr??sentes pour moi. Est-ce que je crois que tu es le Messie qui veut me sauver, moi,\n\n'
                                          'aujourd\'hui? As-tu d??j?? m??me vraiment exist??? Es-tu bel et bien vivant en ce moment m??me? Est-ce que je peux te faire confiance? J???imagine que le simple fait de me poser ces questions est un bon d??but. Si tu es vraiment celui que tu dis ??tre, ne tarde pas pour me le faire savoir!\n\n'
                                          'DOULOUREUX\N\N'
                                          'Tu as toujours aim?? te retrouver dans ce jardin sur la colline, ?? l???ombre des oliviers. Tu t???y es toujours senti en paix. ??a sent bon. Mais ce soir, ce jardin sent la mort. Tu as peur. Tu n???as pas envie de souffrir. Tu veux bien suivre le plan, mais ce soir, ??a ne te tente plus. Tu n???as jamais eu autant besoin de la pr??sence de tes amis, et pourtant ils se sont endormis. Tu leur as pourtant explicitement demand?? de veiller et de prier avec toi : l???esprit est ardent, mais la chair est faible. Tu sais que les prochaines heures vont t???apporter une douleur qui va faire mal dans chaque cellule de ton corps. Tu as tellement peur que tu sues du sang. \n\n'
                                          'Je me reconnais, J??sus, dans ton agonie. Moi aussi, j???ai ??t?? abandonn?? et trahi par des amis en qui j???avais confiance. Moi aussi, des fois, j???ai peur de souffrir dans mon corps. Moi aussi, j???ai peur de mourir. Quand ??a m???arrive, tout est aussi noir que dans ce jardin des Oliviers, ce soir. J???ai peur de cet instant o?? la vie va quitter mon corps. Je ne sais pas ce qui va m???arriver apr??s. J???ai confiance que ce sera beau, mais j???ai peur de faire ce pas que je n???aurai pas le choix de faire. Comme toi, j???ai envie de demander ?? Notre P??re : ?? ??loigne de moi cette coupe ??. \n\n'
                                          'Mais tu ajoutes : ?? Non pas comme je veux, mais comme tu veux ??. Tu accomplis ton destin. Tu ne te d??fileras pas. Tu sais que pour que le Mal soit vaincu une fois pour toutes, il faut que l???amour aille jusque-l?? : jusqu???au don de soi, jusqu???au d??pouillement total, jusqu????? donner sa propre vie. C???est ta mission, la raison pour laquelle tu es venu au monde. Tu es l???Agneau de Dieu. \n\n'
                                          'Tu as confiance en ton P??re et en sa promesse. Un ange vient te calmer, te rassurer : Dieu est avec toi. Tu peux aller au-devant des coups et de la mort : tu vaincras. Tu es Dieu en chair et en os. Il faut que Dieu souffre dans sa chair pour montrer sa Toute-Puissance. \n\n'
                                          'Je me demande pourquoi il faut souffrir et je ne comprends toujours pas. Mais j???ai confiance en Toi. Si Dieu lui-m??me a v??cu la mort, cela doit avoir un sens. Il semble que cela soit une n??cessit??, un passage. \n\n'
                                          'J???ai envie d?????tre comme toi devant la souffrance et la mort : humble et confiant. Mais j???ai peur. J???ai peur, comprends-tu? \n\n'
                                          'Tu me r??ponds : ?? Oui, je comprends. Je suis pass?? par l??, moi aussi. Aie confiance. Je serai avec toi. De l???autre c??t??, il y a la vie en pl??nitude. Il y a la vie ??ternelle. Je te tiendrai par la main. Courage! Avan??ons. L???heure est venue. ??\n\n'
                                          'Il y a tellement de haine en nos c??urs, par moment, J??sus! Toi, tu acceptes de subir cette haine dans ta chair. Les gens qui te fouettent semblent y trouver un certain plaisir. Il y en a m??me un qui a ??t?? attir?? par tes cris de douleur et qui vient prendre part ?? cette manifestation diabolique. Il n???a pas manqu?? d???agripper un fouet, lui aussi, pour assouvir la haine qui l???habite.\n\n'
                                          'Il y a en moi aussi de la haine, J??sus, et je le regrette. Je souhaiterais avoir un c??ur pur, mais il y a des situations o?? la haine prend le dessus. Je voudrais parfois, moi aussi, faire mal ?? l???autre.\n\n'
                                          'D???autres fois, je n?????prouve pas particuli??rement de haine envers une personne. Mais comme un requin est attir?? par le sang, je me laisse attirer par les cris et les clameurs. Je vois quelqu???un souffrir et je m???empare, moi aussi, de ce fouet pour prendre part ?? un exercice de d??foulement collectif. J???avoue que j???y trouve un peu de satisfaction, car j???ai moi aussi ??t?? mis au pilori.\n\n'
                                          'Mais toi, tu es doux et humble de c??ur. Tu incarnes l???amour, la douceur, la bienveillance. Tu compatis avec les marginalis??s, tu t???approches des malades contagieux ?? qui on ordonne de s???isoler. Tu pardonnes ?? ceux qui, selon la plupart d???entre nous, ne le m??riteraient m??me pas. ?? l???inverse, tu condamnes les orgueilleux qui se permettent de pointer les autres du doigt. Tu redonnes leur dignit?? ?? ceux qui l???ont perdue en cours de route. Tu les regardes dans les yeux et tu leur dis : ?? Suis-moi ??. Tu rends m??me la vie aux morts. Tu es le Bon Dieu en personne.\n\n'
                                          'Toi qui n???as rien fait, tu as ??t?? condamn?? injustement. On a menti, on a trouv?? des pr??textes pour t???infliger un ch??timent inhumain. Quand je te regarde, attach?? ?? ce poteau, je vois ce qu???on peut trouver de plus beau en l?????tre humain ??tre confront?? ?? ce qui y a de plus laid. La haine, l???indiff??rence, la violence physique, verbale, psychologique, ??conomique, judiciaire : le Malin y va d???une charge absolument d??cha??n??e.\n\n'
                                          'Ton Pr??cieux Sang coule. Il expie le mal. Tu as pris sur toi, dans ta chair, tout le p??ch?? du monde.\n\n'
                                          'Contrairement ?? ceux de ton ??poque, les rois d???aujourd???hui n???ont plus le pouvoir qu???ils avaient. De nos jours, la plupart des rois tiennent un r??le symbolique. Ils sont le signe d\'une gloire pass??e. ?? ton ??poque, chaque ville peut aspirer ?? couronner son propre roi. Il suffit de lever une arm??e assez courageuse pour se battre contre le gouvernant en place et un nouveau roi si??ge alors ?? la table des nations.\n\n'
                                          'Une fois ??tabli sur la terre promise, les enfants de Jacob t???ont demand?? de leur donner un roi, ?? eux aussi. Ils voulaient ??tre comme les autres peuples voisins. Jusque-l??, c?????tait toi, Yahw??, le roi d???Isra??l. Mais ton peuple voulait un roi en chair et en os pour r??gner sur eux, pour exercer les fonctions royales : rendre justice aux opprim??s, les d??fendre contre les assauts des ennemis et assurer la coh??sion de la soci??t??. Malheureusement, tous les rois de l???Histoire n???ont pas ??t?? ?? la hauteur de leur fonction.\n\n'
                                          'Toi, tu prends notre chair et tu agis comme un roi sans pour autant en r??clamer le titre. M??me que lorsque la foule voulut te faire roi, tu as d??guerpi au plus vite. Tu n???es pas du type temporel ; plut??t du type ??ternel. Tu rel??ves les accabl??s, tu pardonnes nos erreurs, tu nous donnes les moyens de combattre le p??ch??, le v??ritable ennemi ?? notre libert??. Tu nous donnes un commandement nouveau : aimez-vous les uns les autres comme je vous ai aim??s. Pour la coh??sion sociale, aucun livre de lois ne pourra jamais faire mieux.\n\n'
                                          'C\'est dans la souffrance que tu acceptes d\'??tre sacr?? roi de l\'univers : dans le rejet, le sang, la faim, le manque de sommeil et la mort. Les Romains ont eu beau te couronner d?????pines pour se moquer, n???en demeure pas moins qu???ils avaient vu juste : tu es vraiment le roi des Juifs, et m??me, de tout l???univers!\n\n'
                                          '?? J??sus! Trop souvent je me suis mis ?? ta place dans ma vie! Je tente parfois de me rendre justice moi-m??me. Je manque souvent d???humilit??. Je juge les autres, et en m??me temps je me cache mes propres errances. Il y a des occasions o?? je voudrais assurer la coh??sion sociale en exigeant que tout fonctionne ?? ma mani??re, allant jusqu????? mentir et manipuler les autres pour arranger la r??alit?? en fonction de ce que je crois ??tre mon int??r??t. Quand j???essaie de faire tout ??a, je subis des revers plus souvent qu????? mon tour. Alors aujourd???hui, je prends toutes mes erreurs et je les tresse ensemble pour les remettre ?? leur place : sur ta t??te. Je te reconnais comme mon roi. Je te demande de r??gner sur ma vie. Je laisse ?? ton jugement mis??ricordieux les situations injustes que j???ai pu vivre et que je vivrai encore dans l???avenir. Je te demande de me d??fendre contre les assauts du mal et de m???aider ?? prendre les d??cisions justes que je dois prendre. Je te demande, enfin, de me donner la force d???aimer les autres comme tu as aim?? : dans l???abn??gation et le don total de ma personne. Amen!\n\n'
                                          'Pour toi et beaucoup d???autres travailleurs, la nuit est synonyme de labeur. Tu travailles de nuit parce que la chaleur est moins suffocante. Tu es heureux que la semaine soit finie. Une petite sieste te permettra de te remettre en forme pour la longue fin de semaine des festivit??s de la P??que qui commencent. Au loin, les clameurs de la foule attirent ton attention. Un autre condamn?? avance vers le Golgotha. Tu as d??j?? crois?? le chemin de beaucoup de condamn??s depuis que tu es venu de Cyr??ne pour travailler ?? J??rusalem, mais ce condamn??-ci a l???air sp??cial, vu le nombre de gens qui le suivent et les femmes qui se frappent la poitrine en pleurant. En passant devant toi, tu vois qu???il est beaucoup plus amoch?? que la moyenne des condamn??s. Il peine ?? avancer. Un soldat t???interpelle : ?? Toi! Aide-le ?? porter sa croix! ?? Toi qui as beaucoup de courses ?? faire pour pr??parer les f??tes de la P??que, ??a tombe mal. Mais on ne peut pas vraiment refuser d???ob??ir ?? un soldat de l???arm??e romaine, n???est-ce pas?\n\n'
                                          'L???id??e d???aider un condamn?? ?? mort te d??go??te. Mais, en marchant ?? ses c??t??s, en soutenant sa croix, tu commences ?? le regarder. Tu commences ?? avoir piti??. Cet homme, au fond, te ressemble. Comme toi, il n???a pas dormi de la nuit. Comme toi, son corps lui fait mal. Comme Lui, tu tr??buches toi-m??me sur les cailloux et les crevasses. Il s???arr??te devant un groupe de femmes et il leur dit : ?? Ne pleurez pas sur moi, femmes de J??rusalem! Pleurez plut??t sur vous-m??mes et vos enfants! Car voici venir des jours o?? l???on dira : ?? Heureuses les femmes st??riles, les entrailles qui n???ont pas enfant?? et les seins qui n???ont pas nourri! Car si on traite ainsi le bois vert, qu???adviendra-t-il du sec? ??\n\n'
                                          'Il est innocent, c???est clair. Mais qu???y a-t-il ?? faire, pour un ??tranger, devant l???injustice de tout un syst??me? Rien d???autre que d???y mettre un peu de charit?? en l???accompagnant vers sa mort. Alors tu portes sa croix en l???encourageant ?? avancer. Tu es peut-??tre un ??tranger, Simon, mais tu es le seul ami qui lui reste en ce moment. Tu as v??cu un moment privil??gi?? qu???aucun autre de ses disciples n???a v??cu. Tu as incarn?? la parabole que ce condamn?? racontait ?? propos d???un bon Samaritain : tu as pris sur toi une partie de sa peine et de sa souffrance.\n\n'
                                          'Quand je te vois, Simon, porter la croix de J??sus, je pense ?? tant d???autres personnes qui ont tenu la main d?????trangers au moment o?? ils passaient de ce monde ?? l???autre. Je ne peux m???emp??cher de penser ?? ceux qui sont morts sans que personne ne les y accompagne, parce que seuls ou isol??s. J???aimerais suivre ton exemple et trouver un sens aux obligations qui me sont impos??es. J???aimerais porter la croix d???un autre, de temps en temps. J???aimerais me rapprocher de J??sus, au moment o?? il a besoin de moi. Comme toi, je veux m?????merveiller d???avoir pu aider Dieu.\n\n'
                                          'Il fait noir en plein jour. Tu es broy??, battu, ext??nu??. Tous tes os te font mal. Tes bras lev??s, clou??s sur le bois, te font suffoquer. Les clous rouill??s qui frottent sur les os de tes poignets envoient des esp??ces de d??charges ??lectriques dans ton dos. Pour t???aider ?? respirer, tu pousses parfois sur tes pieds pour te relever, mais ce sont alors les clous qui traversent tes pieds qui envoient des chocs ??lectriques. Tes plaies, caus??es par les coups de fouet, s???infectent ?? cause du sable qui y est entr?? quand tu es tomb??. Les ??pines sur ta t??te percent ta peau et frottent sur ton cr??ne. Les mots ne suffisent pas ?? exprimer la douleur que tu ressens dans ta chair et dans ton ??me.\n\n'
                                          'Ta m??re est l??. Bien que ce soit toi qui es clou?? ?? la croix, elle se tord de douleur. La proph??tie du vieux Sym??on est accomplie : une ??p??e lui transperce le c??ur. Elle savait que ce jour risquait d???arriver, mais elle ne se doutait pas que ce pouvait ??tre pire que ce qu???elle aurait pu imaginer. Tu as beau ??tre un homme mature, SON ENFANT est en train de mourir. Une m??re ne veut pas voir mourir son enfant. Ce n???est pas dans l???ordre naturel des choses.\n\n'
                                          'Ton ami Jean arrive. Tu trouves encore la force de lui sourire : ?? Voici ta m??re ??. Et d??s ce jour, il la prit chez elle, et elle le prit comme son fils. Il se rappelle ce que tu avais dit, la veille : ?? Voici mon corps, livr?? pour vous. ?? Tu as dit aussi : ?? Voici mon sang, le sang de la nouvelle Alliance, ??ternelle. Voici mon sang, vers?? pour vous et beaucoup d???autres. Buvez-en tous ??. Au pied de ta croix, en effet, il se retient de recueillir ce Pr??cieux Sang, vers?? pour racheter nos fautes. Nos fautes les plus graves.\n\n'
                                          'Les soldats se partagent tes v??tements. Tu as piti?? d???eux. Tu dis: ?? P??re, pardonne-leur, car ils ne savent pas ce qu???ils font. ?? M??me au seuil de la mort, tu pardonnes ?? ceux qui te font du mal.\n\n'
                                          'Les clameurs de la foule se taisent. Tu dis : ?? Tout est accompli ??. Et, inclinant la t??te, tu dis : ?? P??re, entre tes mains, je remets mon esprit ??. Puis tu pousses un grand cri. Tu es mort.\n\n'
                                          'On pense que c???est fini, que le Christ, ce n?????tait peut-??tre pas toi, finalement. Le Christ pourrait-il mourir clou?? sur une croix? Ce serait un scandale!\n\n'
                                          'Tu es mort. Tes disciples ont peur qu???il leur arrive la m??me chose qu????? toi. Ils se cachent. On t???enveloppe dans un grand drap de lin. Tu es mort, on n???arrive pas ?? le croire.\n\n'
                                          'On te met dans un tombeau tout neuf. On n???a m??me pas le temps de laver ton corps parce que la nuit tombe et que c???est le Sabbat qui commence. On ne comprend pas ce qui vient de se passer. Tes amis n???arrivent pas ?? y croire. Il y a cinq jours, on t???acclamait comme le Messie et ce soir, tu gis, sans vie. On t???a transperc?? d???une lance. Tu as perdu tout ton sang.\n\n'
                                          'Il fait noir. On a perdu celui qu???on aimait, celui qui illuminait nos vies par sa pr??sence lumineuse. Celui qui rendait la vue aux aveugles et leur dignit?? aux afflig??s ne parcourra plus les routes du\n\n'
                                          'pays. Tu es mort. Il fait noir. On a peur. Nous sommes d??sempar??s. On dirait que le mal a gagn??. Dieu a quitt?? cette Terre.'
                                          'GLORIEUX\n\n'
                                          'Tu n???as pas dormi de la nuit. Tu n???en reviens pas de la vitesse avec laquelle toute ta vie s???est ??croul??e, une fois de plus. Tu te demandes si tu es condamn??e pour toujours ?? t???accrocher aux mauvaises personnes. Tu en as fait, des gaffes, Marie, dans ta vie. Tu as donn?? ton c??ur et ton ??me ?? des gens qui ne te m??ritaient pas. Tu as souffert d???amour, Madeleine. Tu as ??t?? trahie, violent??e. Tu as violent?? ?? ton tour pour r??parer le tort qu\'on t\'avait fait, mais ??a ne t???a apport?? aucune satisfaction. Depuis que tu l???avais rencontr??, tu ??tais soudainement devenue lumineuse. Ton pass??, aussi douloureux f??t-il, n?????tait qu???un lointain souvenir. Tu t?????tais sentie aim??e, compl??tement, par cet homme qui n???avait jamais cherch?? pourtant ?? te poss??der comme les autres hommes. Il voyait au fond de toi ce qu???il y avait de meilleur, de plus beau. Et aujourd???hui, il git au fond d???un tombeau apr??s avoir ??t?? tortur?? et humili?? publiquement. \n\n'
                                          'Le soleil vient de se lever, alors tu peux aller prendre soin de ce qui reste de lui. Tu n???attends pas plus longtemps. En arrivant devant le tombeau, la pierre qui, hier, en bloquait l???entr??e a ??t?? roul??e plus loin. Tu t???approches de l???entr??e et tu vois que le corps de ton ami n???est pas l??. Tout pr??s, un homme b??che une plate-bande. Il doit avoir eu une belle P??que, lui, parce qu???il arbore un sourire presque narquois en levant les yeux vers toi pour te regarder, paniqu??e. Tu lui dis : ?? Si c???est toi qui l???as enlev??, dis-moi o?? tu l???as mis! ?? Non, mais, ce n???est pas le genre de farce qu???on fait! Alors son sourire s?????largit encore plus, comme si c?????tait possible. ?? Marie! ??. Un grand frisson te traverse. Comment est-ce possible? Tu ne r??fl??chis pas plus avant et tu t???exclames par le petit nom que tu lui donnais quand tu voulais lui montrer ton affection : ?? Rabbouni! ??. \n\n'
                                          'Tu retournes le dire aux autres, comme il te l???a demand??. Les autres ont du mal ?? te croire. Personne ne peut revenir de la mort, c???est impossible! Mais Jean se souvient soudainement que le ma??tre en avait parl?? sans qu???ils y portent vraiment attention : ?? le troisi??me jour, le Fils de l???Homme ressuscitera ??. Alors Pierre court vers le tombeau, et Jean ?? sa suite. Il voit et il croit. \n\n'
                                          'Il est donc bel et bien Celui qu???il disait ??tre! C???est formidable! Il n???y a pas de mots pour d??crire cette joie : il n???est pas mort, IL EST VIVANT! Il dit ?? Thomas : ?? mets ton doigt dans le trou de mon poignet, mets ta main dans mon c??t?? ??. Ce n???est pas un fant??me. Ce n???est pas une illusion. Il est bien l??, en chair et en os. Il mange et il boit. Il reste avec vous pendant quarante jours. Il ne ressemble plus ?? ce qu???il ??tait avant, par contre. Il est transfigur??. Il s???est joint ?? deux disciples qui marchaient vers une ville voisine, et ils ne l???ont reconnu que le soir venu, au repas. Il a pris du pain et il a dit : ceci est mon corps, faites ceci en m??moire de moi. Ce n???est qu????? ce moment qu???ils l???ont reconnu, mais il a disparu. Vraiment, Il n???a pas fini de nous surprendre! IL EST VIVANT! IL EST VRAIMENT RESSUSCIT??!\n\n'
                                          'On entend souvent qu???on ne sait pas ce qu???il y a de l???autre c??t?? de la mort, car personne n???en est jamais revenu pour nous dire comment c???est. Toi, tu sais bien que ce n???est pas vrai : J??sus en est bel et bien revenu pour nous le dire : ?? n???ayez pas peur. Tout est accompli. Croyez seulement en moi. ?? Tu commences ?? int??grer ce qu???il dit depuis le d??but : il faut mourir afin de vivre.\n\n'
                                          'Depuis qu???Il est ressuscit??, il n???est plus tout ?? fait le m??me. En fait, oui, c???est le m??me, mais diff??rent. Il porte une joie, une pl??nitude de l???existence que tu n???avais jamais vue auparavant. Il parle encore du Royaume de Dieu, il utilise les m??mes mots, mais ils r??sonnent diff??remment, maintenant qu???il est pass?? de la mort ?? la vie. Il te dit : ?? meurs ?? toi-m??me, plonge dans ma mort et renais d??s maintenant ?? la vie! ?? Tu trouves ??a bizarre, tu ne sais pas trop ce que ??a signifie, mais tu te laisses aller. Tu d??cides de lui faire confiance.\n\n'
                                          'Puis un jour, il commence ?? dire qu???il va falloir qu???il parte pour de bon. Tes amis et toi ??tes attrist??s par cette nouvelle ??tape. Vous l???aviez perdu une premi??re fois, vous ne voulez pas qu???il parte une deuxi??me fois! Mais il vous dit : ?? il faut que je parte afin que je vous envoie une force, celle de l???Esprit Saint qui descendra sur vous. ?? Ce sont des paroles bien myst??rieuses que vous ne comprenez pas. Puis il est enlev?? au ciel, comme ??a, au complet. Il monte, et il dispara??t comme une fus??e traverse l???atmosph??re. Mais cette fois, il n???y a pas de chagrin. Deux hommes v??tus de blanc sont ?? vos c??t??s, mais vous ne savez pas depuis combien de temps ni d???o?? ils sont venus. Ils disent, en haussant les ??paules : ?? Pourquoi restez-vous l?? ?? regarder le ciel? Ce J??sus qui ??t?? enlev?? au ciel viendra comme ??a, de la m??me mani??re que vous l???avez vu s???en aller au ciel. ?? Dans l???attente de ce jour, nous avan??ons dans l???esp??rance.\n\n'
                                          'Tous les juifs du monde veulent ??tre ?? J??rusalem durant les festivit??s pascales, et ?? eux se joignent quelques touristes de l???empire qui viennent voir cette merveille du monde qu???est le Temple de la Ville. Toi, tu te caches encore, de peur qu???il ne t???arrive la m??me chose que ce qu???ils ont fait au ma??tre il y a cinquante jours. Sa m??re est avec vous, c???est-??-dire toi et les autres disciples. O?? d???autre pourrait-elle aller, d???ailleurs? Elle vous parle de lui. Elle vous rassure, vous donne du courage. Tu aimes passer du temps avec elle, parce qu???elle te montre des aspects de sa personnalit?? qui t?????chappent. Elle, elle le conna??t comme si elle l???avait tricot??. Elle en conna??t chaque maille, chaque contour. Quand tu te rapproches d???elle, tu te rapproches de lui. Il te manque. Tu as h??te qu???il revienne.\n\n'
                                          'Soudain, il y a un grand bruit. Il y a du vent ?? l???int??rieur de la pi??ce. Les papiers volent. Les disciples ont un peu peur. Quand le ma??tre ??tait l??, il calmait les temp??tes, il ma??trisait les forces de la nature. Mais depuis qu???il n???est plus l??, tu te sens plus vuln??rable. Les ph??nom??nes surnaturels s???additionnent, mais celui-ci est une coche au-dessus de tous les autres. On dirait qu???il y a un feu qui appara??t, et que des petites flammes de ce grand feu se posent sur chacun de vous. C???est cette force que J??sus disait qu???il nous enverrait : celle de l???Esprit Saint.\n\n'
                                          'D??s lors que tu l???as re??u, plus rien ne t???a jamais arr??t??. Cet Esprit Saint, c???est l???Esprit de libert??. C???est la force qui te guide maintenant, et qui t?????claire devant les d??cisions ?? prendre. L???Esprit qui unifiait J??sus ?? son P??re, il t???est maintenant donn??, ?? toi. Tout ce que tu as ?? faire, c???est de t???asseoir en silence et de l?????couter. C???est cette flamme qui est en accord avec ta t??te et ton c??ur. C???est celle qui te dit : fais-moi confiance, aie confiance en la Vie. C???est celle qui te fait regarder au-del?? du ciel et qui te fait crier ?? Abba! PAPA! ?? Cette ??nergie dont parlent certains, c???est l???Esprit de Dieu qui parle ?? ton c??ur. Il n???y a pas de contradiction en l???Esprit, mais Il est plut??t un signe d???unit??, interne d???abord, puis avec tout ce qui est. On le devine par ses effets, comme on voit les feuilles des arbres bouger sous la brise. C???est cette intuition qui te permet de savoir, visc??ralement, qui est ce Dieu dont parle J??sus. C???est cette force surnaturelle qui te permet de pardonner quand tu penses que c???est juste impossible. C???est l???Esprit qui t???a voulu et cr???? dans le sein de ta m??re, qui te conna??t et qui veut te d??voiler ?? toi-m??me. C???est le courant qui te fait voir les hasards de la vie et qui te fait te demander : ?? quelles ??taient les chances que cette co??ncidence arrive, ?? cet endroit et en ce moment pr??cis? ??\n\n'
                                          'C???est Dieu qui te parle.\n\n'
                                          'C???est J??sus qui t???envoie un bec souffl?? : re??ois l???Esprit Saint.\n\n'
                                          'J???ai lu dans la Bible que je suis fait ?? l???image de Dieu. C???est difficile ?? comprendre pour moi. Mais Dieu a engendr?? un homme qui est en tout point pareil ?? Lui : c???est J??sus. Si je ressemble physiquement ?? J??sus, je sais pertinemment que je ne suis pas Dieu. Mais toi, Marie, tu me ressembles davantage. Tu avances dans la foi, comme moi. Tu ne comprends pas tout, mais tu m??dites tout en ton c??ur. Tu pries le Seigneur, comme moi. Tu es pour moi une m??re, une s??ur. En vieillissant, nos s??urs deviennent m??res et on te comprend toujours un peu mieux, peut-??tre ?? mesure qu???on se rend compte qu???on ne ma??trise absolument rien. Plus je me rapproche de toi, Marie, et plus je me rapproche de ton fils.\n\n'
                                          'Ton humilit?? parfaite est un exemple pour moi. Tu m???apprends ?? aimer Dieu et ?? Lui faire confiance. Tu es un exemple d???ob??issance, non pas servile, mais libre. Tu es la femme qui dit oui. Tu es la femme de la r??conciliation, celle qui sait concr??tement mettre le bien de l???avant dans ta r??alit??. Tu es l?????pouse et la m??re de Dieu, toi, petite humaine d???un petit village modeste et isol??. Tu me montres qu???on peut r??aliser de grandes choses en ??tant tout petits.\n\n'
                                          'Ton Assomption, Marie, c???est la promesse de la mort qui m???attend. Non pas une mort qui est une fin, mais un endormissement en attendant la r??surrection des morts. Tu es d??j?? parvenue l?? o?? nous esp??rons arriver gr??ce ?? la promesse de ton Fils. Toi, Marie, dans toute ta vie et m??me ta mort, tu ASSUMES la vie v??cue et la promise. Tu es la preuve, si une telle chose existe dans le monde de la foi, que la confiance en ton Fils donne lieu ?? une vie pleinement v??cue.\n\n'
                                          'Tu n???as pas ??t?? heureuse tous les jours de ta vie. Tu as eu plus que ta part de souffrances. Mais la fa??on dont tu meurs paisiblement et que tu retrouves imm??diatement ta place au ciel est une esp??rance pour moi, qui choisis de prendre le chemin de l???humilit?? que tu as emprunt??.\n\n'
                                          'Tu es belle, Marie. Prie pour moi, toi qui es au ciel, tout pr??s de ton Fils, pour que je tienne bon. Merci d?????tre toujours attentive envers moi et ceux qui comptent pour moi. Aide-moi ?? obtenir de Dieu la gr??ce que mes demandes soient exauc??es. Prie pour moi, pauvre p??cheur, maintenant et ?? l???heure de ma mort.\n\n'
                                          'De tous les humains n??s de deux humains, personne n???a jamais ??t?? plus pr??s de J??sus que toi, Marie. Toutes les paroles qu???il dit, tu les fais tiennes comme si elles avaient toujours ??t?? l??, en toi. ?? sa suite, tu te penches sur les plus vuln??rables avec cet amour surnaturel que nous demandons de recevoir et de transmettre. Quand je te regarde, Marie, je vois l???exemple de ce qu???est une m??re parfaite. Tu adoptes les amis de ton Fils comme tes propres enfants. Tu es l???esp??rance, pour moi, que gr??ce ?? ton fils je pourrai vivre, moi aussi, dans cette pl??nitude de vie ??ternelle que j???aurai tant recherch??e durant ma vie. Personne ne t???a jamais vue manquer ton coup, Marie, et pourtant, tu es une humaine comme nous. Moi, j???aurai manqu?? la cible ?? quelques reprises, parfois de peu, parfois par des kilom??tres.\n\n'
                                          'Imiter ton fils est un d??fi qui m???appara??t trop grand pour moi, humain bien imparfait. Alors je choisis de te prendre comme mod??le ?? imiter. Comme toi, je veux m??diter la Parole de Dieu pour la mettre en pratique dans mon quotidien, dans ma r??alit??. Comme toi, je veux ??tre attentif aux autres et interc??der pour eux aupr??s de Dieu. ?? Ils n???ont plus de vin ??. C???est tout ce que tu as eu ?? dire pour que le Christ se d??voile enfin ?? toute l???humanit??. Comme toi, je veux ??tre remu?? de tout mon ??tre devant la souffrance des cr??atures de Dieu. Comme toi, je veux vivre parmi les disciples de ton Fils, pour nous encourager les uns les autres ?? marcher vers le ciel, d??s notre vie terrestre. Quand je te regarde, toi, l???objectif s???approche de ma port??e.\n\n'
                                          'Toutes les m??res de rois exercent une grande influence aupr??s de leurs fils, bien que le pouvoir ne leur appartienne pas ?? proprement parler. Toi, Marie, M??re de Dieu, tu peux attirer l???attention du Tout-Puissant envers ma d??tresse et mon besoin d???amour et de paix. ??, Marie, ma m??re et ma soeur, permets-moi de me rapprocher de toi et de t???entendre parler ?? mon c??ur de tout ce que ton Fils veut faire de moi!\n\n',
                                          style: TextStyle(color: black)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                      // Column(children: [
                      //   AudioWidget.assets(
                      //     path: "",
                      //     child: IconButton(
                      //       icon: Icon(
                      //         _play ? Icons.pause_circle : Icons.play_circle,
                      //         size: 40,
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           _play = !_play;
                      //         });
                      //         _play
                      //             ? assetsAudioPlayer.play()
                      //             : assetsAudioPlayer.pause();
                      //       },
                      //     ),
                      //     onReadyToPlay: (duration) {
                      //       //onReadyToPlay
                      //     },
                      //     onPositionChanged: (current, duration) {
                      //       //onPositionChanged
                      //     },
                      //   ),
                      //   assetsAudioPlayer.builderRealtimePlayingInfos(
                      //       builder: (context, RealtimePlayingInfos? infos) {
                      //     if (infos == null) {
                      //       return SizedBox();
                      //     }
                      //     //print('infos: $infos');
                      //     return Column(
                      //       children: [
                      //         PositionSeekWidget(
                      //           currentPosition: infos.currentPosition,
                      //           duration: infos.duration,
                      //           seekTo: (to) {
                      //             assetsAudioPlayer.seek(to);
                      //           },
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             IconButton(
                      //               onPressed: () {
                      //                 assetsAudioPlayer.seekBy(Duration(seconds: -10));
                      //               },
                      //               icon: Icon(Icons.replay_10),
                      //             ),
                      //             SizedBox(
                      //               width: 12,
                      //             ),
                      //             IconButton(
                      //                 onPressed: () {
                      //                   assetsAudioPlayer.seekBy(Duration(seconds: 10));
                      //                 },
                      //                 icon: Icon(Icons.forward_10))
                      //           ],
                      //         )
                      //       ],
                      //     );
                      //   }),
                      // ])
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
