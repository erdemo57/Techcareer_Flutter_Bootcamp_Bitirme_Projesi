import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SepetOnaySayfa extends StatefulWidget {
  const SepetOnaySayfa({super.key});

  @override
  State<SepetOnaySayfa> createState() => _SepetOnaySayfaState();
}

class _SepetOnaySayfaState extends State<SepetOnaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network("https://lottie.host/bcd3418c-0311-4840-a8b5-f0fd373480cb/GDfb7uLYyl.json"),
      
    );
  }
}
