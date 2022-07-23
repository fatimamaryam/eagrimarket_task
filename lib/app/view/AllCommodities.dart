import 'package:eagrimarket/app/providers/CommodityProvider.dart';
import 'package:eagrimarket/app/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/commodityTile.dart';

class AllCommodities extends StatelessWidget {
  const AllCommodities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cProvider = Provider.of<CommodityProvider>(context);
    var data = cProvider.getFormattedCommoditiesList();
    return Scaffold(
      appBar: CustomAppBar(context, allowBack: true),
      body: data == null || data.isEmpty
          ? const Center(child: Text("Nothing to show"))
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return CommodityTile(
                    commodity: data[index],
                    onDelete: cProvider.deleteCommodity(index));
              },
            ),
    );
  }
}
