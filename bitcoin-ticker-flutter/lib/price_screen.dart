import 'dart:io' show Platform;

import 'package:bitcoin_ticker/API.dart';
import 'package:bitcoin_ticker/CoinAPIResponse.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinAPI api = CoinAPI();
  String currency = 'USD';
  CoinAPIResponse coinData;
  double exchangeRate = 0;

  List<DropdownMenuItem<String>> getDropDownItems() {
    return currenciesList.map((item) {
      return DropdownMenuItem<String>(
        child: Text(item),
        value: item,
      );
    }).toList();
  }
  void updateUI(CoinAPIResponse coinData){
    print(coinData);
    setState(() {
      exchangeRate = coinData.rate;

    });
  }

  void getCoindData() async{
    coinData =  await api.getExchangeRate('BTC', currency);
    updateUI(coinData);
  }

  @override
  void initState()  {
    // TODO: implement initState
    getCoindData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buildCryptoCards() + [ Container(
          height: 150.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 30.0),
          color: Colors.lightBlue,
          child: getPlatformSpecificDropDown(),
        ),],
      ),
    );
  }

  Widget getPlatformSpecificDropDown() {
    if (Platform.isIOS) {
      return buildIOSPicker();
    } else  {
      return buildDropdownButton();
    }

  }

  CupertinoPicker buildIOSPicker() {
    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32,
        onSelectedItemChanged: (index) async{
          var val = currenciesList[index];
          var coinData = await api.getExchangeRate('BTC', val);
          setState(() {
            currency = val;
            updateUI(coinData);
          });
        },
        children: currenciesList.map((item) {
          return Text(
            item,
            style: TextStyle(color: Colors.white),
          );
        }).toList());
  }

  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
        items: getDropDownItems(),
        onChanged: (val) async{
          print(val);
          var coinData = await api.getExchangeRate('BTC', val);
          setState(() {
            currency = val;
            updateUI(coinData);
          });
        },
        value: currency);
  }

 buildCryptoCards(){
    return cryptoList.map((crypto){
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
              child: Text(
                '1 $crypto = ${exchangeRate.toStringAsFixed(2)} $currency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
//  Padding(
//            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
//            child: Card(
//              color: Colors.lightBlueAccent,
//              elevation: 5.0,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(10.0),
//              ),
//              child: Padding(
//                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//                child: Text(
//                  '1 BTC = ${exchangeRate.toStringAsFixed(2)} $currency',
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                    fontSize: 20.0,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//            ),
//          ),