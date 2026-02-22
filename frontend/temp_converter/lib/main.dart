import 'package:flutter/material.dart';

void main() => runApp(const TempApp());

class TempApp extends StatelessWidget {
  const TempApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TempConv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const TempHome(),
    );
  }
}

class TempHome extends StatefulWidget {
  const TempHome({super.key});

  @override
  State<TempHome> createState() => _TempHomeState();
}

class _TempHomeState extends State<TempHome> {
  final _celsiusCtrl = TextEditingController(text: '20');
  final _kelvinCtrl = TextEditingController();
  String _info = '';

  @override
  void initState() {
    super.initState();
    // Wichtig: KEINE automatische Berechnung beim Tippen!
    _kelvinCtrl.text = '';
  }

  @override
  void dispose() {
    _celsiusCtrl.dispose();
    _kelvinCtrl.dispose();
    super.dispose();
  }

  void _onConvertPressed() {
    final raw = _celsiusCtrl.text.trim().replaceAll(',', '.');
    final c = double.tryParse(raw);

    setState(() {
      _info = 'Wird im Backend berechnet.';
    });

    if (c == null) {
      _kelvinCtrl.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bitte eine gültige Zahl bei Celsius eingeben.')),
      );
      return;
    }

    // Lokal berechnen (Backend NICHT verwenden)
    final k = c + 273.15;
    _kelvinCtrl.text = k.toStringAsFixed(2);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Wird im Backend berechnet.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Theme.of(context).dividerColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Celsius → Kelvin',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 16),

                    LayoutBuilder(
                      builder: (context, c) {
                        final twoCols = c.maxWidth >= 700;
                        final fields = [
                          TextField(
                            controller: _celsiusCtrl,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                            decoration: const InputDecoration(
                              labelText: 'Celsius',
                              hintText: 'z.B. 20',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          TextField(
                            controller: _kelvinCtrl,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Kelvin',
                              hintText: 'Ergebnis',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ];

                        if (twoCols) {
                          return Row(
                            children: [
                              Expanded(child: fields[0]),
                              const SizedBox(width: 16),
                              Expanded(child: fields[1]),
                            ],
                          );
                        }

                        return Column(
                          children: [
                            fields[0],
                            const SizedBox(height: 12),
                            fields[1],
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 14),
                    Row(
                      children: [
                        FilledButton.icon(
                          onPressed: _onConvertPressed,
                          icon: const Icon(Icons.calculate),
                          label: const Text('Berechnen'),
                        ),
                      ],
                    ),

                    if (_info.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        _info,
                        style: TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
