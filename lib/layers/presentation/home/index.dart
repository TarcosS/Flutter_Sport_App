
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart" as icons;
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CategoryCard extends StatelessWidget {
  final String title;
  final dynamic icon;
  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 66,
          height: 66,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromRGBO(125, 81, 254, .06)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(1)),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(36, 40, 52, 1)))
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String desc;
  final String photoPath;

  const WorkoutCard({
    super.key, 
    required this.title, 
    required this.desc,
    required this.photoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: const [
         BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          blurRadius: 8,
          offset: Offset(0, 4)
        ), 
        ]
      ),
      padding: const EdgeInsets.all(8),
      width: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image(image: AssetImage(photoPath), width: 210, height: 144, fit: BoxFit.cover),
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromRGBO(182, 255, 0, .4),
                ),
                child: const Text('Fitness', style: TextStyle(fontSize: 14),),
              ),
             const Row(
              children: [
                 Icon(icons.FeatherIcons.star, color: Color.fromRGBO(253, 225, 90, 1), size: 18),
                 Padding(padding: EdgeInsets.all(2)),
                 Text('4.8', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(36, 40, 52, .6)))
              ],
             ),
            ]
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 1))),
          Text(desc, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromRGBO(36, 40, 52, 0.6))),
          const Padding(padding: EdgeInsets.all(4)),
          const Text('18min', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromRGBO(125, 81, 254, 1))),
        ],
      ),
    );
  }
}


class _HomePageState extends State<HomePage> {
  String _location = 'New York, USA';

  void changeLocation(String? str) {
    if(str != null && _location != str) {
      setState(() {
        _location = str;
      });
    }
  }
  @override
  Widget build(BuildContext contxt) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 45, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Location', style: TextStyle(color: Color.fromRGBO(36, 40, 52, 0.6), fontWeight: FontWeight.w600)),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(icons.FeatherIcons.mapPin, color: Color.fromRGBO(36, 40, 52, 1), size: 20),
                        ),
                        DropdownButton(
                          alignment: AlignmentDirectional.center,
                          padding: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(8),
                          value: _location,
                          icon: const Icon(icons.FeatherIcons.chevronDown, color: Color.fromRGBO(36, 40, 52, 1),),
                          iconSize: 20,
                          style: const TextStyle(color: Color.fromRGBO(36, 40, 52, 1), fontWeight: FontWeight.w600),
                          onChanged: (String? newValue) {changeLocation(newValue);},
                          items: const [DropdownMenuItem(value: 'New York, USA', child: Text('New York, USA')), DropdownMenuItem(value: 'İzmir, TR', child: Text('İzmir, TR'))]
                        )
                      ],
                    )
                  ],
                ),
                IconButton(onPressed: () {}, iconSize: 24, icon: const Icon(icons.FeatherIcons.bell))
              ],
            ),
            const Padding(padding: EdgeInsets.all(8)),
            Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(8), right: Radius.circular(0)),
                          gapPadding: 0,
                        ),
                        prefixIcon: Icon(icons.FeatherIcons.search, color: Color.fromRGBO(125, 81, 254, 1), size: 20),
                        fillColor: Color.fromRGBO(125, 81, 254, .06),
                        hintText: 'Search Workout, Trainer',
                        filled: true,
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)
                      ),
                    ),
                  )
                ),
                IconButton.filled(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(125, 81, 254, 1)),
                    fixedSize: MaterialStateProperty.all(const Size(48, 48)),
                  ),
                  icon: const Icon(icons.FeatherIcons.filter, color: Colors.white, size: 20),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Categories', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(color: Color.fromRGBO(125, 81, 254, .6), fontSize: 16)))
                  ],
                ),
                const Padding(padding: EdgeInsets.all(4))
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryCard(title: 'Fitness', icon:  iconoir.Gym()),
                CategoryCard(title: 'Yoga', icon: iconoir.Yoga()),
                CategoryCard(title: 'Tone Up', icon: iconoir.Waist()),
                CategoryCard(title: 'HIT', icon: iconoir.Treadmill()),
              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Featured Workouts', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(color: Color.fromRGBO(125, 81, 254, .6), fontSize: 16)))
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(4)),
            const SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WorkoutCard(title: 'Stronger Legs', desc: 'Elevate Your Fitness to New Heights, Your Shortcut to Strength!', photoPath: 'assets/images/girl1.png'),
                  Padding(padding: EdgeInsets.all(20)),
                  WorkoutCard(title: 'Better Muscles', desc: 'Dynamic and empowering fitness routine designed to transform your!', photoPath: 'assets/images/girl2.png'),
                  Padding(padding: EdgeInsets.all(20)),
                  WorkoutCard(title: 'Stronger Legs', desc: 'Elevate Your Fitness to New Heights, Your Shortcut to Strength!', photoPath: 'assets/images/girl1.png'),
                  Padding(padding: EdgeInsets.all(20)),
                  WorkoutCard(title: 'Stronger Legs', desc: 'Dynamic and empowering fitness routine designed to transform your!', photoPath: 'assets/images/girl2.png'),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(12)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Routines', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(color: Color.fromRGBO(125, 81, 254, .6), fontSize: 16)))
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(4)),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WorkoutCard(title: 'Stronger Legs', desc: 'Elevate Your Fitness to New Heights, Your Shortcut to Strength!', photoPath: 'assets/images/girl1.png'),
                  Padding(padding: EdgeInsets.all(20)),
                  WorkoutCard(title: 'Stronger Legs', desc: 'Dynamic and empowering fitness routine designed to transform your!', photoPath: 'assets/images/girl2.png'),
                  Padding(padding: EdgeInsets.all(20)),
                  WorkoutCard(title: 'Stronger Legs', desc: 'Elevate Your Fitness to New Heights, Your Shortcut to Strength!', photoPath: 'assets/images/girl1.png'),
                  Padding(padding: EdgeInsets.all(20)),
                  WorkoutCard(title: 'Stronger Legs', desc: 'Dynamic and empowering fitness routine designed to transform your!', photoPath: 'assets/images/girl2.png'),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}