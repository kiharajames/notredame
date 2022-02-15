import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'http://www.diocesedejoliette.org';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorPrimaryAlt,
        selectedItemColor: white,
        unselectedItemColor: colorPrimary,
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Text('Pour discuter de la foi :\n'),

// '(Phone icon) (450) 555-5555 (to be modified (email icon) pierre@diocesedejoliette.org\n'
          Row(
            children: [
              Icon(Icons.phone),
              Text('(450) 555-5555 (to be modified')
            ],
          ),
          Text('\n'),
          Row(
            children: [Icon(Icons.email), Text('pierre@diocesedejoliette.org')],
          ),
          Text('\n\n'),
          Text('Cette application a été réalisée par :\n'
              'Mathieu Binette\n'
              'Services web à l’Église\n'),
          Row(
            children: [Icon(Icons.phone), Text('514-466-7781')],
          ),
          Row(
            children: [Icon(Icons.web_rounded), Text('mathieubinette.info')],
          ),

          Text('\n\n'),

          Text('Crédits :\n\n'
              'Illustrations : Ozias Leduc\n'
              'Narrations : Paul Bouchard, Evelyne Bouchard, Mathieu Binette\n'
              'Ingénieur son, édition et montages vidéo : Mathieu Binette\n'
              'Programmation : Abeeha Fatima'),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              _launchURL();
            },
            child: Text(
              '      Site web    ',
              style: TextStyle(color: colorPrimary),
            ),
            style: ElevatedButton.styleFrom(primary: white),
          )
        ]),
      ),
    );
  }

  _onItemTapped(int index) {
    // if (index == 0) {
    //   Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    // } else
    if (index == 0) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/categories', (route) => false);
      // Navigator.pushNamed(context, '/categories1');
    } else {
      Navigator.pushNamed(context, '/contacts');
    }
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
