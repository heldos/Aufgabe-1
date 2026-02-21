import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'gen/temperature.pbgrpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConverterPage(),
    );
  }
}

class ConverterPage extends StatefulWidget {
  @override
  State<ConverterPage> createState() {
    return ConverterPageState();
  }
}

class ConverterPageState extends State<ConverterPage> {
  final TextEditingController controller =
      TextEditingController(text: '20');

  String result = '';
  bool loading = false;

  Future<void> convert() async {
    final value = double.tryParse(controller.text);
    if (value == null) {
      setState(() {
        result = 'Bitte Zahl eingeben';
      });
      return;
    }

    setState(() {
      loading = true;
      result = '';
    });

    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    final client = TemperatureServiceClient(channel);

    try {
      final request = CelsiusToKelvinRequest();
      request.celsius = value;

      final response = await client.celsiusToKelvin(request);

      setState(() {
        result =
            value.toStringAsFixed(2) +
            ' °C = ' +
            response.kelvin.toStringAsFixed(2) +
            ' K';
      });
    } catch (e) {
      setState(() {
        result = 'Fehler: ' + e.toString();
      });
    } finally {
      await channel.shutdown();
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Celsius → Kelvin')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Celsius',
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: loading ? null : convert,
              child: Text('Umrechnen'),
            ),
            SizedBox(height: 16),
            Text(result, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
