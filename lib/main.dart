import 'package:currency_app/provider/exchage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/activity_1.dart';

void main() => runApp(const CurrencyApp());

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ExchangeProvider>(create: (context) => ExchangeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tipo de cambio',
        routes: {
          '/' :(context) => const Activity1()
        },
        
      ),
    );
  }
}
