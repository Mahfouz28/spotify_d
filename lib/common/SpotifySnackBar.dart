import 'dart:ui';
import 'package:flutter/material.dart';

class SpotifySnackBar extends StatefulWidget {
  final String message;
  final Duration duration;

  const SpotifySnackBar({
    super.key,
    required this.message,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<SpotifySnackBar> createState() => _SpotifySnackBarState();
}

class _SpotifySnackBarState extends State<SpotifySnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.2), // start off screen
      end: const Offset(0, 0), // slide into view
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack, // smooth bounce-like entrance
      ),
    );

    _controller.forward();

    // auto dismiss after duration
    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) Navigator.of(context).pop();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _slideAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration:
                              TextDecoration.none, // 🚀 remove underline
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Helper function to show it easily
void showSpotifySnackBar(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent, // no dimmed background
    builder: (_) => SpotifySnackBar(message: message),
  );
}
