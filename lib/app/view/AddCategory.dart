import 'package:eagrimarket/app/providers/CommodityProvider.dart';
import 'package:eagrimarket/app/view/AddCommodity.dart';
import 'package:eagrimarket/app/widgets/CustomDropdown.dart';
import 'package:eagrimarket/app/widgets/Global.dart';
import 'package:eagrimarket/app/widgets/CustomAppBar.dart';
import 'package:eagrimarket/app/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    var cProvider = Provider.of<CommodityProvider>(context);
    return Scaffold(
        appBar: CustomAppBar(context),
        body: HorizontalSpacing(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomDropDown(
                items: cProvider.categories.map((category) {
                  return DropdownMenuItem(
                    child: Text(category,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black)),
                    value: category,
                  );
                }).toList(),
                value: cProvider.commodityCategory,
                onChangeHandler: (newValue) {
                  cProvider.commodityCategory = newValue;
                  cProvider.resetCommodityList();
                },
                hint: 'Categories',
              ),
              const SizedBox(
                height: 20,
              ),
              cProvider.commodityCategory == null
                  ? const Text('')
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.black26)),
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 16, 4),
                          child: MultiSelectDialogField(
                            items: cProvider.respectiveSubcategory
                                .map((e) => MultiSelectItem(e, e))
                                .toList(),
                            chipDisplay: MultiSelectChipDisplay.none(),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent)),
                            initialValue: const [],
                            searchable: true,
                            buttonIcon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black26,
                            ),
                            buttonText: Text(
                              "Sub Categories",
                              style: TextStyle(color: Colors.black26),
                            ),
                            title: Text("${cProvider.commodityCategory}"),
                            onConfirm: (res) {
                              cProvider.setCommodityList(res);
                            },
                          )
                          // DropdownButtonHideUnderline(
                          //   child: DropdownButton(
                          //     iconEnabledColor: Colors.black26,
                          //     isExpanded: true,
                          //     hint: const Text(
                          //       'Categories',
                          //       style: TextStyle(fontSize: 14, color: Colors.black26),
                          //     ), // Not necessary for Option 1
                          //     value: selectedCategory,
                          //     onChanged: (newValue) {
                          //       setState(() {
                          //         selectedCategory = newValue as String?;
                          //       });
                          //     },
                          //     items: categoryList.map((category) {
                          //       return DropdownMenuItem(
                          //         child: ListTile(
                          //           title: Text(category,
                          //               style: const TextStyle(
                          //                   fontSize: 14, color: Colors.black)),
                          //         ),
                          //         value: category,
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          ),
                    ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: cProvider
                    .getCommodityList()
                    .map<Widget>((e) => ChipWidget(text: e))
                    .toList(),
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          disabled: (cProvider.commodityCategory == null ||
              cProvider.commodityList.isEmpty),
          text: "Next",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddCommodity()));
          },
        )
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: MaterialButton(
        //     height: 50,
        //     color: Colors.green,
        //     disabledColor: Colors.green[100],
        //     onPressed: cProvider.commodityCategory == null ||
        //             cProvider.commodityList.isEmpty
        //         ? null
        //         : () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const AddCommodity()));
        //           },
        //     child: const Text(
        //       "Next",
        //       style: TextStyle(color: Colors.white, fontSize: 16),
        //     ),
        //   ),
        // ),
        );
  }
}

class ChipWidget extends StatelessWidget {
  String text;
  ChipWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
