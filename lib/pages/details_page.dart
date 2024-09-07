import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {super.key, required this.imgUrls, required this.title});
  final String imgUrls, title;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    bool? isChecked = false;

    String selectedItem = '1';
    List<String> dropdownItems = ['1', '2', '3', '4', '5', '6'];

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/images/bg_image.jpeg',
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: height * 0.3, // Height of the collapsible area
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/img_rectangle_16.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: GlossyContainer(
                  height: height * 0.7,
                  width: width,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.03),
                    child: Column(
                      children: [
                        // Title and Rating Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '4.9 ⭐ (458)',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey,
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/veg_symbol.png',
                                        height: height * 0.03,
                                        width: width * 0.04,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Dropdown Menu
                            Container(
                              height: height * 0.075,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DropdownButton<String>(
                                    value: selectedItem,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedItem = newValue!;
                                      });
                                    },
                                    items: dropdownItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Description Text
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Caffè latte is a milk coffee that is made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.',
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.white54),
                          ),
                        ),
                        // Cup Filling Section
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Choice of Cup Filling',
                            style: TextStyle(
                                fontFamily: GoogleFonts.inter().fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white54),
                          ),
                        ),
                        // Cup Filling Options
                        Container(
                          margin: EdgeInsets.only(top: height * 0.015),
                          child: Row(
                            children: [
                              _buildCupFillingOption(
                                  'Full', Colors.green, width, height),
                              _buildCupFillingOption(
                                  '1/2 Full', Colors.grey.shade100, width, height),
                              _buildCupFillingOption(
                                  '3/4 Full', Colors.grey.shade100, width, height),
                              _buildCupFillingOption(
                                  '1/4 Full', Colors.grey.shade100, width, height),
                            ],
                          ),
                        ),
                        // Choice of Milk Section
                        _buildChoiceSection('Choice of Milk', width),
                        _buildMilkChoices(),
                        // Choice of Sugar Section
                        _buildChoiceSection('Choice of Sugar', width),
                        _buildSugarChoices(),
                        // Submit Button and High Priority Checkbox
                        _buildSubmitSection(width, height, isChecked),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCupFillingOption(String label, Color color, double width, double height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.015),
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 3),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(3)),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: color == Colors.green ? Colors.white54 : Colors.black,
        ),
      ),
    );
  }

  Widget _buildChoiceSection(String title, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontFamily: GoogleFonts.inter().fontFamily,
            fontWeight: FontWeight.w700,
            color: Colors.white54),
      ),
    );
  }

  Widget _buildMilkChoices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CustomColumn(title1: 'Skim Milk', url1: 'assets/images/switch_1.png'),
            CustomColumn(title1: 'Almond Milk', url1: 'assets/images/switch_1.png'),
            CustomColumn(title1: 'Soy Milk', url1: 'assets/images/switch_1.png'),
            CustomColumn(title1: 'Lactose Milk', url1: 'assets/images/switch_1.png'),
          ],
        ),
        Column(
          children: [
            CustomColumn(title1: 'Skim Milk', url1: 'assets/images/switch_2.png'),
            CustomColumn(title1: 'Almond Milk', url1: 'assets/images/switch_1.png'),
            CustomColumn(title1: 'Soy Milk', url1: 'assets/images/switch_1.png'),
            CustomColumn(title1: 'Lactose Milk', url1: 'assets/images/switch_1.png'),
          ],
        )
      ],
    );
  }

  Widget _buildSugarChoices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CustomColumn(title1: 'Sugar X1', url1: 'assets/images/switch_1.png'),
            CustomColumn(title1: 'Sugar X2', url1: 'assets/images/switch_1.png'),
          ],
        ),
        Column(
          children: [
            CustomColumn(title1: '½ Sugar', url1: 'assets/images/switch_2.png'),
            CustomColumn(title1: 'No Sugar', url1: 'assets/images/switch_1.png'),
          ],
        )
      ],
    );
  }

  Widget _buildSubmitSection(double width, double height, bool? isChecked) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      child: GlossyContainer(
        height: height * 0.08,
        width: width * 0.9,
        borderRadius: BorderRadius.circular(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.15,
              child: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
            ),
            Container(
              width: width * 0.65,
              child: Text(
                'High Priority',
                style: TextStyle(
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors.black),
              ),
            ),
            Container(
              height: height * 0.06,
              width: width * 0.1,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomColumn extends StatelessWidget {
  final String title1;
  final String url1;

  const CustomColumn({super.key, required this.title1, required this.url1});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.4,
      height: height * 0.03,
      child: Row(
        children: [
          Image.asset(
            url1,
            height: height * 0.02,
            width: width * 0.05,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.04),
            child: Text(
              title1,
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.grey.shade200,
              ),
            ),
          )
        ],
      ),
    );
  }
}