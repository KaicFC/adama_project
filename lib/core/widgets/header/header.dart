import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  const Header({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: const Color.fromRGBO(93, 80, 75, 1),
      title: Row(
        children: [
          Image.asset(
            'images/adama_logo_2.png',
            width: 30,
            height: 34,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            'images/adama_logo_1.png',
            width: 96,
            height: 20,
          ),
        ],
      ),
      actions: [
        Center(
            child: Row(
          children: [
            Text(
              username,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: 40,
              height: 40,
            ),
            TextButton(
              onPressed: () {},
              child: const SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
