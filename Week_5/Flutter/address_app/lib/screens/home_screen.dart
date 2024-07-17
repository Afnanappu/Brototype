import 'package:address_app/db/db_functions.dart';
import 'package:address_app/screens/add_student_screen.dart';
import 'package:address_app/screens/modules/messages.dart';
import 'package:address_app/screens/page_view/student_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// final searchText = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _pageViewController = PageController();
  bool _isFloatButtonVisible = true;
  bool _isSearchButtonClicked = false;
  // bool isStudentEmpty = false;

  @override
  Widget build(BuildContext context) {
    getAllStudentFromDB();
    notifySearch();
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onLongPress: () {
            ShowAlertMessage("Delete all students", "Are you sure?", context,
                deleteAllStudentFromDB);
          },
          child: const Text(
            "Student",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.black26),
        backgroundColor: Colors.teal,
        actions: [
          //Search button and its functions
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    if (_isSearchButtonClicked == false) {
                      _isSearchButtonClicked = true;
                    } else {
                      _isSearchButtonClicked = false;
                    }
                  });
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          //Search box
          Visibility(
            visible: _isSearchButtonClicked,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //This code will remove the focus if the user tap outside the textFormField
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();

                  //making the floating button visible
                  setState(() {
                    _isFloatButtonVisible = true;
                  });
                },

                //making the floating button invisible
                onTap: () {
                  setState(() {
                    _isFloatButtonVisible = false;
                  });
                },
                // controller: searchText,
                onChanged: (value) {
                  //This will filter the students who name match the text value
                  // findSearch(value);
                  searchFromDB(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                ),
              ),
            ),
          ),

          //List view or Grid view
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              children: const [
                MyListView(),
                MyGridView(),
              ],
            ),
          )
        ],
      ),

      //Bottom navigation part
      //floating action button in between two bottom navigation icon
      floatingActionButton: Visibility(
        visible: _isFloatButtonVisible,
        child: SizedBox(
          height: 70,
          width: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    //todo: maybe you want to remove the const
                    builder: (ctx) => const StudentAddScreen(),
                  ),
                );
              },
              backgroundColor: Theme.of(context).primaryColor,
              enableFeedback: true,
              tooltip: "Add Student",
              child: const Icon(
                Icons.person_add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

      //Positioning to bottom center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //bottom navigation bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Colors.white,
          width: 5,
        ))),
        child: BottomNavigationBar(
          enableFeedback: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "List", tooltip: "List view"),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: "Grid",
                tooltip: "Grid view")
          ],
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(
              () {
                //changing the selected index value on click
                _selectedIndex = value;
              },
            );

            _pageViewController.jumpToPage(_selectedIndex);
          },
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(
            size: 30,
          ),
        ),
      ),
    );
  }
}
