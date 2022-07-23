import 'package:eagrimarket/app/models/CommodityModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommodityTile extends StatelessWidget {
  CommodityModel commodity;
  Function() onDelete;
  CommodityTile({Key? key, required this.commodity, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${commodity.name}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${commodity.category}"),
                    const SizedBox(
                        width: 5,
                        child: Text(
                          "|",
                          textAlign: TextAlign.center,
                        )),
                    Text("${commodity.origin}"),
                    const SizedBox(
                        width: 5,
                        child: Text(
                          "|",
                          textAlign: TextAlign.center,
                        )),
                    Text("${commodity.fresh}"),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  "${commodity.unit}",
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: '',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: '${commodity.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      const TextSpan(text: ' PKR'),
                    ],
                  ),
                ),
                // IconButton(
                //     onPressed: onDelete,
                //     icon: const Icon(
                //       CupertinoIcons.delete_simple,
                //       color: Colors.red,
                //     ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
