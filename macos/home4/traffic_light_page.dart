import 'dart:async';
import 'package:flutter/material.dart';

class TrafficLightPage extends StatefulWidget {
  const TrafficLightPage({super.key});

  @override
  State<TrafficLightPage> createState() => _TrafficLightPageState();
}

class _TrafficLightPageState extends State<TrafficLightPage> {
  int _currentLight = 0; 
  bool _isAutoMode = false; 
  Timer? _timer;
  int _countdown = 3; 

  void _changeLight() {
    setState(() {
      _currentLight = (_currentLight + 1) % 3;
      _resetCountdown(); 
    });
  }

  void _toggleAutoMode() {
    setState(() {
      _isAutoMode = !_isAutoMode;

      if (_isAutoMode) {
        _startAutoMode();
      } else {
        _timer?.cancel();
        _resetCountdown();
      }
    });
  }

  void _startAutoMode() {
    _timer?.cancel();
    _countdown = 3;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        _changeLight();
        _countdown = 3;
      }
    });
  }

  void _resetCountdown() {
    _countdown = 3;
  }

  double _getOpacity(int lightIndex) {
    return _currentLight == lightIndex ? 1.0 : 0.3;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Traffic Light Animation',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
        elevation: 5,
      ),
      body: Container(
        color: const Color.fromARGB(255, 122, 85, 154), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            children: [
              // ไฟจราจร
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLight(Colors.red, _getOpacity(0), _isAutoMode && _currentLight == 0 ? _countdown : null),
                    _buildLight(Colors.yellow, _getOpacity(1), _isAutoMode && _currentLight == 1 ? _countdown : null),
                    _buildLight(Colors.lightGreen, _getOpacity(2), _isAutoMode && _currentLight == 2 ? _countdown : null),
                  ],
                ),
              ),
              const SizedBox(height: 10), 
              ElevatedButton(
                onPressed: _changeLight,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: const Color.fromARGB(255, 139, 83, 142), 
                ),
                child: const Text(
                  'เปลี่ยนไฟ',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20, 
                    fontWeight: FontWeight.bold, 
                  ),
                ),
              ),
              const SizedBox(height: 10), 
              SwitchListTile(
                title: const Text(
                  'เปลี่ยนอัตโนมัติ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
                
                ),
                value: _isAutoMode,
                onChanged: (value) => _toggleAutoMode(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLight(Color color, double opacity, int? countdown) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: opacity,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
        ),
        child: countdown != null
            ? Center(
                child: Text(
                  '$countdown',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}