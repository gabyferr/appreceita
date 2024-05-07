import 'package:appreceitas/models/settings.dart';
import 'package:flutter/material.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      thumbColor: const MaterialStatePropertyAll(Color(0xFFFFFFFF),),
      inactiveTrackColor: const Color(0xFFFF0000),
      isThreeLine: true,     
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações', style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: const Color(0xFFF44336),
      ),
      drawer: const MainDrawer(),
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glúten!',
                    settings!.isGlutenFree,
                    (value) => setState(() => settings!.isGlutenFree = value),
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose!',
                    settings!.isLactoseFree,
                    (value) => setState(() => settings!.isLactoseFree = value),
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições veganas!',
                    settings!.isVegan,
                    (value) => setState(() => settings!.isVegan = value),
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vegetarianas!',
                    settings!.isVegetarian,
                    (value) => setState(() => settings!.isVegetarian = value),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
