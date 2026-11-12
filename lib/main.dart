import 'package:flutter/material.dart';

void main() {
  runApp(const CornerRadiusApp());
}

class CornerRadiusApp extends StatelessWidget {
  const CornerRadiusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 07 - Variant 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const RadiusConfiguratorScreen(),
    );
  }
}

class RadiusConfiguratorScreen extends StatefulWidget {
  const RadiusConfiguratorScreen({super.key});

  @override
  State<RadiusConfiguratorScreen> createState() =>
      _RadiusConfiguratorScreenState();
}

class _RadiusConfiguratorScreenState extends State<RadiusConfiguratorScreen> {
  double _topLeft = 25.0;
  double _topRight = 50.0;
  double _bottomLeft = 50.0;
  double _bottomRight = 10.0;

  void _resetCorners() {
    setState(() {
      _topLeft = 0.0;
      _topRight = 0.0;
      _bottomLeft = 0.0;
      _bottomRight = 0.0;
    });
  }

  void _makeCircle() {
    setState(() {
      _topLeft = 75.0;
      _topRight = 75.0;
      _bottomLeft = 75.0;
      _bottomRight = 75.0;
    });
  }

  Widget _buildSliderCard({
    required String title,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.indigo.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo.shade900,
                ),
              ),
              Text(
                value.toStringAsFixed(1),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          Slider(
            value: value,
            min: 0.0,
            max: 75.0,
            activeColor: Colors.indigo,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text('Лабораторна №7 — Варіант 2'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_topLeft),
                  topRight: Radius.circular(_topRight),
                  bottomLeft: Radius.circular(_bottomLeft),
                  bottomRight: Radius.circular(_bottomRight),
                ),
              ),
            ),

            // Блок керування кутами 2x2
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildSliderCard(
                        title: 'TL',
                        value: _topLeft,
                        onChanged: (v) => setState(() => _topLeft = v),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSliderCard(
                        title: 'TR',
                        value: _topRight,
                        onChanged: (v) => setState(() => _topRight = v),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildSliderCard(
                        title: 'BL',
                        value: _bottomLeft,
                        onChanged: (v) => setState(() => _bottomLeft = v),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSliderCard(
                        title: 'BR',
                        value: _bottomRight,
                        onChanged: (v) => setState(() => _bottomRight = v),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: _resetCorners,
                  icon: const Icon(Icons.crop_square),
                  label: const Text('Квадрат'),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  onPressed: _makeCircle,
                  icon: const Icon(Icons.circle_outlined),
                  label: const Text('Коло'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}