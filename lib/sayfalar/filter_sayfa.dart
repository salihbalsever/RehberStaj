import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:hexcolor/hexcolor.dart';
class FiltreSayfa extends StatefulWidget {
  @override
  _FiltreSayfaState createState() => _FiltreSayfaState();
}

class _FiltreSayfaState extends State<FiltreSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: HexColor("#0e2d85"), title:  Text("Filtre",style: TextStyle(fontSize: 24),),),
    body:  ExpansionTile(
      title: Text(
        "Title",
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold
        ),
      ),
      children: <Widget>[
        ExpansionTile(
          title: Text(""

          ),
          children: <Widget>[
            ListTile(
              title: Text('data'),
            )
          ],
        ),
        ListTile(
          title: Text(
              'data'
          ),
        ),
        ExpansionTile(
          title: Text(
            'Sub title',
          ),
          children: <Widget>[
            ListTile(
              title: Text('data'),
            )
          ],
        ),

      ],
    ),

    );
  }
}
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry('A0'),
      Entry('A1'),
      Entry('A2'),
      Entry('A1'),
      Entry('A2'),
      Entry('A1'),
      Entry('A2'),
      Entry('A1'),
      Entry('A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('B0'),
      Entry('B1'),
      Entry('B2'),
    ],
  ),
  Entry(
    'Chapter C',
    <Entry>[
      Entry('C0'),
      Entry('C1'),
      Entry('C2'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    //if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: <Widget>[
        RadioButtonGroup(
            labels: root.children.map((child) => child.title).toList(),
            onSelected: (String selected) => print(selected)),
      ],
    ); //root.children.map(_buildTiles).toList(),
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
