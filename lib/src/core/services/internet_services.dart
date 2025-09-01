import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class InternetService {
  static final Connectivity _connectivity = Connectivity();
  static StreamSubscription<ConnectivityResult>? _subscription;

  // Method to get the current connectivity status
  static Future<bool> checkConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return _isConnected(connectivityResult);
  }

  // Method to check if connected to the internet
  static bool _isConnected(List<ConnectivityResult> result) {
    for (ConnectivityResult connection in result) {
      if (connection == ConnectivityResult.mobile ||
          connection == ConnectivityResult.wifi) {
        return true;
      }
    }
    return false;
  }

  // Method to listen to connectivity changes
  static void onConnectionChange(Function(bool) callback) {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      // Received changes in available connectivity types!
      callback(_isConnected(result));
    });
  }

  // Method to cancel the subscription
  static void cancelSubscription() {
    _subscription?.cancel();
  }
}

/*

bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
    _listenToConnectionChanges();
  }

  @override
  void dispose() {
    InternetService.cancelSubscription();
    super.dispose();
  }

  Future<void> _checkInternetConnection() async {
    bool isConnected = await InternetService.checkConnection();
    setState(() {
      _isConnected = isConnected;
    });
  }

  void _listenToConnectionChanges() {
    InternetService.onConnectionChange((isConnected) {
      setState(() {
        _isConnected = isConnected;
      });
    });
  }
*/
