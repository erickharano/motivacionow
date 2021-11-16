import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:motivacionow/app/modules/personage/domain/entities/personage.dart';

import '../../../../utils_widget.dart';

class PersonageListItem extends StatelessWidget {
  final Personage personage;

  const PersonageListItem({
    Key? key,
    required this.personage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Colors.grey.shade200,
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 220,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                const Image(
                  image: NetworkImage(
                      "https://static3.tcdn.com.br/img/img_prod/460977/pre_venda_busto_homem_de_ferro_iron_man_marvel_mark_iii_life_size_sideshow_43864_1_20201211173537.jpg"),
                  // image: AssetImage("images/image-1.png"),
                  height: 220,
                  width: 180,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          personage.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          personage.description ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "More info",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return ListTile(
    //   leading: const Image(
    //     // image: NetworkImage(imageUri),
    //     image: AssetImage("images/image-1.png"),
    //     height: 150,
    //     width: 100,
    //   ),
    //   title: Text(
    //     personage.name,
    //     style: const TextStyle(
    //       fontSize: 22,
    //       fontWeight: FontWeight.bold,
    //       color: AppTheme.cBlack,
    //     ),
    //   ),
    //   subtitle: Text(
    //     personage.author ?? "",
    //     style: const TextStyle(
    //       fontSize: 18,
    //       color: AppTheme.cBlack,
    //     ),
    //   ),
    //   trailing: const Icon(Icons.keyboard_arrow_right_outlined),
    // );
  }
}
