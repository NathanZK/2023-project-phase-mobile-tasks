import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 65,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xFFEE6F57),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            size: 40.0,
          ),
          color: Colors.black,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
