import 'package:flutter/material.dart';
import 'camera_view.dart';

void main() {
  runApp(const WeAIrablesApp());
}

class WeAIrablesApp extends StatelessWidget {
  const WeAIrablesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weAIrables',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("weAIrables Assistant")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "What's in front of me?",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CameraView()),
  );
},
                icon: const Icon(Icons.camera_alt),
                label: const Text("Capture & Describe"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
