import 'package:flutter/material.dart';

class CustomLoadingIndecetor extends StatelessWidget {
  const CustomLoadingIndecetor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
