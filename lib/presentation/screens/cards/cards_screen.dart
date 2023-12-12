import 'package:flutter/material.dart';

const cardsData = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    // ** SingleChildScrollView cuando hay mas contenido para ver, que no sea en una LISTA!!!
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cardsData.map(
            (card) => _CardType1(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),
          ...cardsData.map(
            (card) => _CardType2(
              elevation: card['elevation'],
              label: card['label'],
            ),
          ),

          // ** Para brindarle mas espacio al final de ScrollView
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Card(
      // ** <RoundedRectangleBorder> es un decorador para los cards
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color.outline,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - OutLine'),
            )
          ],
        ),
      ),
    );
  }
}
