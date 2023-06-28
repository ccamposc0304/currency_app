import 'package:currency_app/common/appbars.dart';
import 'package:currency_app/models/currency_response.dart';
import 'package:currency_app/provider/exchage_provider.dart';
import 'package:currency_app/services/currency_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Activity1 extends StatelessWidget {
  const Activity1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar().generalAppBar('Tipo de cambio'),
      body: mainBody(context),
    );
  }

  Center mainBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            labelColones(context),
            const SizedBox(height: 25),
            exchangeButon(context),
            const SizedBox(height: 25),
            labelDolares(context),
          ],
        ),
      ),
    );
  }

  Container exchangeButon(BuildContext context) {
    final provider = Provider.of<ExchangeProvider>(context);
    return Container(
      child: IconButton(
        onPressed: () async {
          await getCurrencyFromApi().then((response) {
            if (response != null) {
              var rateUsd = double.parse(response.data!.rateUsd!);
              var refValue = double.parse(provider.colonesTxt.text);
              var conversion = refValue * rateUsd;

              provider.dolaresTxt.text = conversion.toString();
            }
          });

          ///TODO: consulta metodo de API para convertir la moneda
        },
        icon: const Icon(Icons.sync_alt_rounded),
        color: Colors.green.shade500,
        iconSize: 40,
      ),
    );
  }

  Row labelDolares(BuildContext context) {
    final provider = Provider.of<ExchangeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.green.shade400,
              border: Border.all(width: 2, color: Colors.transparent),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(25))),
          width: 75,
          height: 50,
          child: const Text('USD',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 2,
                color: Colors.green.shade400,
              ),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  topRight: Radius.circular(25))),
          width: 250,
          height: 50,
          child: TextField(
            onTap: () => copiaData(context),
            controller: provider.dolaresTxt,
            enabled: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15)),
          ),
        )
      ],
    );
  }

  Future<void> copiaData(BuildContext context) async {
    final provider = Provider.of<ExchangeProvider>(context, listen: false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Texto copiado'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
      ),
    );
    Clipboard.setData(ClipboardData(text: provider.dolaresTxt.text));
  }

  Row labelColones(BuildContext context) {
    final provider = Provider.of<ExchangeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.green.shade400,
              border: Border.all(width: 2, color: Colors.transparent),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(25))),
          width: 75,
          height: 50,
          child: const Text('CRC',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 2,
                color: Colors.green.shade400,
              ),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  topRight: Radius.circular(25))),
          width: 250,
          height: 50,
          child: TextField(
            controller: provider.colonesTxt,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15)),
          ),
        )
      ],
    );
  }

  Future<CurrencyResponse?> getCurrencyFromApi() async {
    var rs = await CurrencyApi().getCurrency();

    return rs;
  }
}
