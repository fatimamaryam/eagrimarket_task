import 'package:eagrimarket/app/models/CommodityModel.dart';
import 'package:eagrimarket/app/providers/CommodityProvider.dart';
import 'package:eagrimarket/app/view/AllCommodities.dart';
import 'package:eagrimarket/app/widgets/AddCommodityForm.dart';
import 'package:eagrimarket/app/widgets/Global.dart';
import 'package:eagrimarket/app/widgets/CustomAppBar.dart';
import 'package:eagrimarket/app/widgets/CustomButton.dart';
import 'package:eagrimarket/app/widgets/CustomDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCommodity extends StatefulWidget {
  const AddCommodity({Key? key}) : super(key: key);

  @override
  State<AddCommodity> createState() => _AddCommodityState();
}

class _AddCommodityState extends State<AddCommodity> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      as();
    });
  }

  as() {
    var cProvider = Provider.of<CommodityProvider>(context, listen: false);
    cProvider.addCommodity({"category": cProvider.commodityCategory});
  }

  @override
  Widget build(BuildContext context) {
    var cProvider = Provider.of<CommodityProvider>(context);
    return Scaffold(
        appBar: CustomAppBar(context, allowBack: true),
        body: HorizontalSpacing(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Commodity",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemCount: cProvider.commodities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Commodity ${index + 1}',
                            style: const TextStyle(color: Colors.orange)),
                        const SizedBox(
                          height: 20,
                        ),
                        AddCommodityForm(index: index),
                      ],
                    );
                  },
                ),
              ),
              InkWell(
                  onTap: () {
                    cProvider.addCommodity({});
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                      Text(
                        "Add more",
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ))
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          text: "Next",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllCommodities()));
          },
        ));
  }
}
