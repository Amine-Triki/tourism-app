import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/database.dart';
import 'package:project1/distination_sreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIcon = 0;

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List listIcon = [
      FontAwesomeIcons.plane,
      FontAwesomeIcons.hotel,
      FontAwesomeIcons.taxi,
      FontAwesomeIcons.train,
      FontAwesomeIcons.motorcycle,
      FontAwesomeIcons.ship,
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza),
            label: 'Pizza',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const TellUs(),
            const SizedBox(
              height: 20,
            ),
            listofIcons(listIcon),
            const SizedBox(
              height: 20,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Destinations',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'All Data',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destination.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Destination(
                          dest: destination[index],
                        );
                      }));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 7,
                        right: 7,
                      ),
                      width: 210,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 5,
                            child: Container(
                              width: 200,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 40,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${destination[index]['activities'].length} activities',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      destination[index]['description'],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                  ),
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(-4, 4),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Hero(
                            tag: destination[index]['imageUrl'],
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      destination[index]['imageUrl'])),
                            ),
                          ),
                          Positioned(
                            top: 120,
                            left: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      destination[index]['city'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      destination[index]['country'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Exclusive hotels',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'All Data',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      left: 15,
                      right: 15,
                    ),
                    width: 210,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: 5,
                          child: Container(
                            width: 200,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 40,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${hotels[index]['name']} ',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    hotels[index]['address'],
                                    style: const TextStyle(color: Colors.grey),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    '\$${hotels[index]['price']} ',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 220,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(4, 4),
                                  blurRadius: 10,
                                ),
                                BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(-4, 4),
                                  blurRadius: 10,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                              width: 220,
                              height: 180,
                              fit: BoxFit.cover,
                              image: AssetImage(hotels[index]['imageUrl'])),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox listofIcons(List<dynamic> listIcon) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listIcon.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIcon = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 80,
              width: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: (_selectedIcon == index)
                    ? Theme.of(context).primaryColorLight 
                    : const Color(0xFF5C5C5C),
              ),
              child: FaIcon(
                listIcon[index],
                color: (_selectedIcon == index)
                    ? Theme.of(context).primaryColor
                    : const Color(0xFFBEBEBE),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TellUs extends StatelessWidget {
  const TellUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 40,
      ),
      child: Text(
        'Tell us about your destination in Egypt ?',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
