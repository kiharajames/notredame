import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:flutter/services.dart';
import 'package:notredame/includes/public.dart';
import 'package:path_provider/path_provider.dart';

class Douloureux extends StatefulWidget {
  const Douloureux({Key? key}) : super(key: key);

  @override
  _DouloureuxState createState() => _DouloureuxState();
}

class _DouloureuxState extends State<Douloureux> {
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
              title: Text('MYSTÈRES DOULOUREUX'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(File('${mydir?.path}/6-agonie_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('L\'agonie'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/6-agonie.mp3',
                          videoFile:
                              '${mydir?.path}/6-agonie_not-stretched.mp4',
                          textNo: 6,
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
                      File('${mydir?.path}/7-flagellation_thumb.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text('La flagellation'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/7-flagellation.mp3',
                          videoFile: '${mydir?.path}/7-flagellation.mp4',
                          textNo: 7,
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
                        File('${mydir?.path}/8-couronnement_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('Le couronnement d\'épines'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/8-couronnement.mp3',
                          videoFile: '${mydir?.path}/8-couronnement.mp4',
                          textNo: 8,
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
                        File('${mydir?.path}/9-portement_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('Le portement de la croix'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/9-portement.mp3',
                          videoFile: '${mydir?.path}/9-portement2.mp4',
                          textNo: 9,
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
                        File('${mydir?.path}/10-crucifixion_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('La crucifixion'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/10-crucifixion.mp3',
                          videoFile: '${mydir?.path}/10-crucifixion.mp4',
                          textNo: 10,
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
          );
  }
}
