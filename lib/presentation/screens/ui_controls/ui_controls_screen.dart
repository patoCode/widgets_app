import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ui Controls"),
      ),
      body: const _UiControlsView(),
    );
  }
}

enum Transportation { car, submarine, boat, plane }

// ** Para la gestion de estados es necesario tener un StatefulWidget
class _UiControlsView extends StatefulWidget {
  const _UiControlsView();
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;

  bool breakFast = false;
  bool launch = false;
  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text("Developer mode"),
          subtitle: const Text("Developer controls aditionals"),
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text("Expansion Title"),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text("By car"),
              subtitle: const Text("Viajar en carro"),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text("By plane"),
              subtitle: const Text("Viajar en avión"),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text("By Submarine"),
              subtitle: const Text("Viajar en submarino"),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
            RadioListTile(
              title: const Text("By boat"),
              subtitle: const Text("Viajar en bote"),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text("Desayuno"),
          subtitle: const Text("Desea reservar el desayuno?"),
          value: breakFast,
          onChanged: (value) {
            setState(() {
              breakFast = !breakFast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Almuerzo"),
          subtitle: const Text("Desea reservar el almuerzo?"),
          value: launch,
          onChanged: (value) {
            setState(() {
              launch = !launch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Cena"),
          subtitle: const Text("Desea reservar la cena?"),
          value: dinner,
          onChanged: (value) {
            setState(() {
              dinner = !dinner;
            });
          },
        ),
      ],
    );
  }
}
