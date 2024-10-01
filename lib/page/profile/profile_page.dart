import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ThemeProvider>().changeCurrentTheme();
      },
      child: Container(
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
