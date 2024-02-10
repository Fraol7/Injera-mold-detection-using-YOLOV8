import 'package:flutter/material.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackArrow;

  const AppBarDesign({super.key, required this.showBackArrow});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF907F7F),
      leading: showBackArrow
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Pop current route and go back to the previous route (home page).
              },
            )
          : null,
      title: const Center(
        child: Text('Injera mold detection'),
      ),
    );
  }
}
