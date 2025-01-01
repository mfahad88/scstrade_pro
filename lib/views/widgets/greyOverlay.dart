import 'package:flutter/material.dart';

class GreyOverlay {
  final OverlayEntry _overlayEntry;

  GreyOverlay() : _overlayEntry = OverlayEntry(builder: (context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.4), // Semi-transparent grey overlay
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  });

  void show(BuildContext context) {
    Overlay.of(context)?.insert(_overlayEntry);
  }

  void remove() {

    _overlayEntry.remove();
    _overlayEntry.dispose();

  }
}
