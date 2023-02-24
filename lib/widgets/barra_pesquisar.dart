import 'package:flutter/material.dart';

class BarraPesquisar extends StatelessWidget {
  const BarraPesquisar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 100,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF3F3F3),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/search-normal.png',
                  color: const Color(0xFFE35571),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 30,),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black26,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/filter.png'),
          ),
        ),
      ],
    );
  }
}
