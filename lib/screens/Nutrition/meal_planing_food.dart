import 'package:diet_application/screens/Nutrition/plan_loading_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constents.dart';
import '../../main.dart';

class MealPlaningFood extends StatefulWidget {
  const MealPlaningFood({super.key});

  @override
  State<MealPlaningFood> createState() => _MealPlaningFoodState();
}

class _MealPlaningFoodState extends State<MealPlaningFood>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConst.background1,
          title: Text(
            "Meal Plans",
            style: TextStyle(color: ColorConst.nameText),
          ),
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_left,
              size: height * 0.06,
              color: ColorConst.subHead,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: ColorConst.nameText),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, color: ColorConst.nameText),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: ColorConst.nameText),
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.transparent, // Remove default indicator
              ),
              labelPadding: EdgeInsets.zero, // Remove default padding
              indicatorPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              tabs: [
                _buildTab("Breakfast", 0),
                _buildTab("Lunch", 1),
                _buildTab("Dinner", 2),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  BreakFastTab(tabController: _tabController), // Pass tabController
                  LunchTab(tabController: _tabController),
                  DinnerTab(tabController: _tabController)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Function to build each tab dynamically with different color when selected
  Widget _buildTab(String text, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: _selectedIndex == index ? ColorConst.subHead : ColorConst.text1, // Change color on selection
        borderRadius: BorderRadius.circular(width * 1),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color:_selectedIndex == index ? ColorConst.text : ColorConst.nameText, fontSize: 16),
        ),
      ),
    );
  }
}

// beak fast
class BreakFastTab extends StatefulWidget {
  final TabController tabController;
  const BreakFastTab({required this.tabController});

  @override
  _BreakFastTabState createState() => _BreakFastTabState();
}

class _BreakFastTabState extends State<BreakFastTab> {
  final List<Map<String, dynamic>> breakfastItems = [
    {'name': 'Pancakes', 'selected': false},
    {'name': 'Omelette', 'selected': false},
    {'name': 'Toast', 'selected': false},
    {'name': 'Cereal', 'selected': false},
    {'name': 'Fruit Salad', 'selected': false},
  ];

  void _toggleSelection(int index) {
    setState(() {
      breakfastItems[index]['selected'] = !breakfastItems[index]['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Text(
            "Select your Breakfast",
            style: TextStyle(
              color: ColorConst.subHead,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.045,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: breakfastItems.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(
                  breakfastItems[index]['name'],
                  style: TextStyle(color: ColorConst.text1),
                ),
                value: breakfastItems[index]['selected'],
                activeColor: ColorConst.subHead,
                onChanged: (bool? value) {
                  _toggleSelection(index);
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.subHead,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              List selectedItems = breakfastItems
                  .where((item) => item['selected'] == true)
                  .map((item) => item['name'])
                  .toList();

              print("Selected Breakfast Items: $selectedItems");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Selected: ${selectedItems.join(', ')}"),
                  duration: Duration(seconds: 2),
                ),
              );

              // Move to the next tab (Lunch)
              widget.tabController.animateTo(1);
            },
            child: Text("Confirm & Next",style: TextStyle(
              color: ColorConst.text,
              fontWeight: FontWeight.w600,
              fontSize: width*0.035
            ),),
          ),
        ),
      ],
    );
  }
}


//lunch
class LunchTab extends StatefulWidget {
  final TabController tabController;
  const LunchTab({required this.tabController});

  @override
  State<LunchTab> createState() => _LunchTabState();
}

class _LunchTabState extends State<LunchTab> {

  final List<Map<String, dynamic>> lunchItems = [
    {'name': 'Grilled Chicken Salad', 'selected': false},
    {'name': 'Vegetable Stir Fry', 'selected': false},
    {'name': 'Pasta with Marinara Sauce', 'selected': false},
    {'name': 'Chicken Biryani', 'selected': false},
    {'name': 'Quinoa and Avocado Bowl', 'selected': false},
    {'name': 'Fish Curry with Rice', 'selected': false},
    {'name': 'Lentil Soup with Bread', 'selected': false},
    {'name': 'Paneer Butter Masala with Naan', 'selected': false},
    {'name': 'Sushi Rolls', 'selected': false},
    {'name': 'Caesar Salad', 'selected': false},
  ];

  void _toggleSelection(int index) {
    setState(() {
      lunchItems[index]['selected'] = !lunchItems[index]['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Text(
            "Select your Lunch",
            style: TextStyle(
              color: ColorConst.subHead,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.045,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: lunchItems.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(
                  lunchItems[index]['name'],
                  style: TextStyle(color: ColorConst.text1),
                ),
                value: lunchItems[index]['selected'],
                activeColor: ColorConst.subHead,
                onChanged: (bool? value) {
                  _toggleSelection(index);
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.subHead,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              List selectedItems = lunchItems
                  .where((item) => item['selected'] == true)
                  .map((item) => item['name'])
                  .toList();

              print("Selected Breakfast Items: $selectedItems");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Selected: ${selectedItems.join(', ')}"),
                  duration: Duration(seconds: 2),
                ),
              );

              // Move to the next tab (Lunch)
              widget.tabController.animateTo(2);
            },
            child: Text("Confirm & Next",style: TextStyle(
                color: ColorConst.text,
                fontWeight: FontWeight.w600,
                fontSize: width*0.035
            ),),
          ),
        ),
      ],
    );
  }
}


//dinner
class DinnerTab extends StatefulWidget {
  final TabController tabController;
  const DinnerTab({required this.tabController});

  @override
  State<DinnerTab> createState() => _DinnerTabState();
}

class _DinnerTabState extends State<DinnerTab> {

  List<Map<String, dynamic>> dinnerItems = [
    {'name': 'Grilled Chicken with Vegetables', 'selected': false},
    {'name': 'Spaghetti Bolognese', 'selected': false},
    {'name': 'Vegetable Stir Fry', 'selected': false},
    {'name': 'Beef Steak with Mashed Potatoes', 'selected': false},
    {'name': 'Salmon with Quinoa', 'selected': false},
    {'name': 'Mushroom Risotto', 'selected': false},
    {'name': 'Paneer Butter Masala with Naan', 'selected': false},
    {'name': 'Chicken Caesar Salad', 'selected': false},
    {'name': 'Tandoori Fish with Rice', 'selected': false},
    {'name': 'Lentil Soup with Bread', 'selected': false},
  ];

  void _toggleSelection(int index) {
    setState(() {
      dinnerItems[index]['selected'] = !dinnerItems[index]['selected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: Text(
            "Select your Lunch",
            style: TextStyle(
              color: ColorConst.subHead,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.045,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dinnerItems.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(
                  dinnerItems[index]['name'],
                  style: TextStyle(color: ColorConst.text1),
                ),
                value: dinnerItems[index]['selected'],
                activeColor: ColorConst.subHead,
                onChanged: (bool? value) {
                  _toggleSelection(index);
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.subHead,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              List selectedItems = dinnerItems
                  .where((item) => item['selected'] == true)
                  .map((item) => item['name'])
                  .toList();

              print("Selected Breakfast Items: $selectedItems");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Selected: ${selectedItems.join(', ')}"),
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) => PlanLoadingScreen(),));
            },
            child: Text("Generate Plan",style: TextStyle(
                color: ColorConst.text,
                fontWeight: FontWeight.w600,
                fontSize: width*0.035
            ),),
          ),
        ),
      ],
    );;
  }
}
