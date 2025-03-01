import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnectionDialog extends StatefulWidget {
  final Widget child;

  const NetworkConnectionDialog({
    super.key,
    required this.child,
  });

  @override
  State<NetworkConnectionDialog> createState() => _NetworkConnectionDialogState();
}

class _NetworkConnectionDialogState extends State<NetworkConnectionDialog> {
  bool _showDialog = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final connectivity = Connectivity();
    
    try {
      // Check initial connection state
      final result = await connectivity.checkConnectivity();
      _updateConnectionStatus(result as ConnectivityResult);

      // Listen for connectivity changes
      await connectivity.onConnectivityChanged.listen((result) {
        _updateConnectionStatus(result as ConnectivityResult);
      }).asFuture();
    } catch (e) {
      debugPrint('Error checking connectivity: $e');
    }
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    final hasConnection = result != ConnectivityResult.none;
    
    if (mounted) {
      setState(() {
        if (!hasConnection && !_showDialog) {
          _showDialog = true;
          _showNoConnectionDialog();
        } else if (hasConnection && _showDialog) {
          _showDialog = false;
          Navigator.of(context, rootNavigator: true).pop();
        }
      });
    }
  }

  Future<void> _showNoConnectionDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(
            title: Row(
              children: [
                Icon(Icons.signal_wifi_off, color: Colors.red),
                SizedBox(width: 8),
                Text('No Internet Connection'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Please check your internet connection and try again.'),
                SizedBox(height: 16),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
