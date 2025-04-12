import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:lottie/lottie.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results.isNotEmpty ? results.first : ConnectivityResult.none);
    });
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result.isNotEmpty ? result.first : ConnectivityResult.none);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isConnected) {
      return const NoInternetScreen();
    }
    return widget.child;
  }

}

class InternetConnectionListener {
  static Future<void> startListening(BuildContext context) async {
    final result = await Connectivity().checkConnectivity();
    if (result.first == ConnectivityResult.none){
      ConnectivityResult connectivityResult = ConnectivityResult.none;
      if (connectivityResult == ConnectivityResult.none) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Connection Failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Center(child: Lottie.asset('assets/lottie/disconnect.json', height: 300)),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(context.translate('connectionFailed'),
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'IRsans'),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text(
                    context.translate("internetConnectionIsNotAvailable"),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Visibility(
              visible: !kIsWeb,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (!kIsWeb) {
                      Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.translate("tryAgain"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'IRsans',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}