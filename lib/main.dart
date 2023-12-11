import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/arama_sayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/favori_sayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/sepete_ekle_sayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/urun_detay_sayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/anasayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/bottom_sayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/urun_detay_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SepetSayfaCubit(),),
        BlocProvider(create: (context) => AnasayfaCubit(),),
        BlocProvider(create: (context) => DetaySayfaCubit(),),
        BlocProvider(create: (context) => AramaSayfaCubit(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const BottomSayfa(),
      ),
    );
  }
}
