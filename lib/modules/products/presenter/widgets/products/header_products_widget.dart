import 'package:flutter/material.dart';

class HeaderProductsWidget extends StatelessWidget {
  const HeaderProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.fromLTRB(40, 20, 20, 20),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'Produtos',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: 300,
              height: 60,
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Buscar',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/products-create');
              },
              style: TextButton.styleFrom(
                fixedSize: const Size(240, 60),
                backgroundColor: const Color.fromRGBO(23, 162, 85, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(image: AssetImage('assets/images/plus_icon.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cadastrar Produto',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
