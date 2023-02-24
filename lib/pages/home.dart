import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_teste/constants/color.dart';
import '../model/empresa_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFundo,
      appBar: AppBar(
        backgroundColor: colorFundo,
        elevation: 0,
        leading: Image.asset('assets/images/menu.png'),
        actions: [Image.asset('assets/images/user.png'),
        SizedBox(width: 12,)],
      ),
      body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, empresaData) {
            if (empresaData.hasError) {
              return const Text('Error Data');
            } else if (empresaData.hasData) {
              var data = empresaData.data as List<EmpresasModel>;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/location.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Entrega em',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Av Prefeito guiomar lopes, 363, Cristo Rei',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: colorLocal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/bag.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          const SizedBox(width: 8,),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              filled: true,
                              fillColor: colorBox,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/search-normal.png',
                                  color: colorVerTodos,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: colorBox,
                              width: 2,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/filter.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Empresas",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: colorRoxo,
                          ),
                        ),
                        InkWell(
                          child: const Text(
                            "Ver todos",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorVerTodos,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: GridView.builder(
                        itemCount: data == null ? 0 : data.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        scrollDirection: Axis.vertical,
                        reverse: false,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {

                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorBox,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    'assets/images/enterprise-image.png',
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: colorRoxo,
                                      ),
                                    ),
                                    Text(
                                      data[index].description.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: colorLocal,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}

Future<List<EmpresasModel>> ReadJsonData() async {
  final jsonData = await rootBundle.loadString("assets/data/data.json");
  final list = json.decode(jsonData) as List<dynamic>;

  return list.map((e) => EmpresasModel.fromJson(e)).toList();
}