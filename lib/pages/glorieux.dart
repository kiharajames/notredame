import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:flutter/services.dart';
import 'package:notredame/includes/public.dart';
import 'package:path_provider/path_provider.dart';

class Glorieux extends StatefulWidget {
  const Glorieux({Key? key}) : super(key: key);

  @override
  _GlorieuxState createState() => _GlorieuxState();
}

class _GlorieuxState extends State<Glorieux> {
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
              title: Text('MYSTÈRES GLORIEUX'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.file(
                        File('${mydir?.path}/11-resurrection_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('La résurrection'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/11-resurrection.mp3',
                          videoFile: '${mydir?.path}/11-resurrection.mp4',
                          textNo: 11,
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
                      File('${mydir?.path}/12-ascension_thumb.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text('L\'Ascension'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/12-ascension.mp3',
                          videoFile: '${mydir?.path}/12-ascension.mp4',
                          textNo: 12,
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
                        File('${mydir?.path}/13-pentecote_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('La Pentecôte'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/13-pentecote.mp3',
                          videoFile: '${mydir?.path}/13-pentecote.mp4',
                          textNo: 13,
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
                        File('${mydir?.path}/14-assomption_thumb.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('L\'Assomption'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/14-assomption.mp3',
                          videoFile: '${mydir?.path}/14-assomption.mp4',
                          textNo: 14,
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
                        File('${mydir?.path}/15-couronnement.png'),
                        fit: BoxFit.contain),
                  ),
                  title: Text('Le couronnement de Marie au Ciel'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, '/audiopage',
                        arguments: MysteryFields(
                          audioFile: '${mydir?.path}/15-couronnement.mp3',
                          videoFile: '${mydir?.path}/15-couronnement.mp4',
                          textNo: 15,
                          title: "Le couronnement de Marie au Ciel",
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
          );
  }
}
