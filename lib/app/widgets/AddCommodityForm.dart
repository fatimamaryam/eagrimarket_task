import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/CommodityProvider.dart';
import 'CustomDropdown.dart';

class AddCommodityForm extends StatefulWidget {
  int index;

  AddCommodityForm({Key? key, required this.index}) : super(key: key);

  @override
  _AddCommodityFormState createState() => _AddCommodityFormState();
}

class _AddCommodityFormState extends State<AddCommodityForm> {
  @override
  Widget build(BuildContext context) {
    var cProvider = Provider.of<CommodityProvider>(context);

    return Column(
      children: [
        CustomDropDown(
          hint: "Commodity Category",
          onChangeHandler: (newValue) {
            cProvider.setCommoditiesData(widget.index, 'category', newValue);
            // cProvider.commodityCategory = newValue;
          },
          value: cProvider.commodities[widget.index]['category'],
          items: cProvider.categories.map((category) {
            return DropdownMenuItem(
              child: Text(category,
                  style: const TextStyle(fontSize: 14, color: Colors.black)),
              value: category,
            );
          }).toList(),
        ),
        CustomDropDown(
          value: cProvider.commodities[widget.index]['name'],
          hint: "Commodity",
          onChangeHandler: (newValue) {
            cProvider.setCommoditiesData(widget.index, 'name', newValue);
          },
          items: cProvider
              .getCommoditiesData(widget.index, 'category')
              .map<DropdownMenuItem<Object>>((e) {
            return DropdownMenuItem(
              child: Text(e,
                  style: const TextStyle(fontSize: 14, color: Colors.black)),
              value: e,
            );
          }).toList(),
        ),
        CustomDropDown(
          value: cProvider.commodities[widget.index]['fresh'],
          onChangeHandler: (newValue) {
            cProvider.setCommoditiesData(widget.index, 'fresh', newValue);
          },
          hint: "Store/Fresh",
          items: cProvider.storefresh.map((e) {
            return DropdownMenuItem(
              child: Text(e,
                  style: const TextStyle(fontSize: 14, color: Colors.black)),
              value: e,
            );
          }).toList(),
        ),
        CustomDropDown(
            value: cProvider.commodities[widget.index]['unit'],
            onChangeHandler: (newValue) {
              cProvider.setCommoditiesData(widget.index, 'unit', newValue);
            },
            hint: "Unit of Measurement",
            items: cProvider.units.map((e) {
              return DropdownMenuItem(
                child: Text(e,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
                value: e,
              );
            }).toList()),
        CustomDropDown(
            value: cProvider.commodities[widget.index]['origin'],
            onChangeHandler: (newValue) {
              cProvider.setCommoditiesData(widget.index, 'origin', newValue);
            },
            hint: "Origin",
            items: cProvider.origins.map((e) {
              return DropdownMenuItem(
                child: Text(e,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
                value: e,
              );
            }).toList()),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black26)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (newValue) {
                  cProvider.setCommoditiesData(widget.index, 'price', newValue);
                },
                decoration: InputDecoration(
                    hintText: "Price", border: InputBorder.none),
              ),
            ))
      ],
    );
  }
}
