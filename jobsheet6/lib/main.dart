import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobsheet6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> mahasiswa = [
    {'nama': 'AFFAN NUR AFTO', 'nim': 'STI202102422'}, // Anda
    {
      'nama': 'FADHIL AL FIQRI',
      'nim': 'STI202102411'
    }, // Nomor absen tepat di atas
    {
      'nama': 'MOCH. NASRULLAH BIN TAUFIQ A.R',
      'nim': 'STI202102420'
    }, // Nomor absen tepat di atas
    {
      'nama': 'DENNY KUSUMA WARDANA',
      'nim': 'STI202102421'
    }, // Nomor absen tepat di bawah
    {'nama': 'SURIPTO', 'nim': 'STI202102425'}, // Nomor absen tepat di bawah
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % mahasiswa.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
      ),
      body: Center(
        child: Container(
          color: colors[currentIndex % colors.length],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mahasiswa[currentIndex]['nama']!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                mahasiswa[currentIndex]['nim']!,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
