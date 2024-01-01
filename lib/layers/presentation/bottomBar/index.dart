import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart" as icons;

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    required this.active,
    required this.onPressed
  });
  
  final Color color;
  final IconData icon;
  final String label;
  final bool active;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(253, 253, 253, 255),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        shadowColor: Colors.transparent,
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width / 4)
      ),
      onPressed: () => {onPressed()}, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: active ? color : const Color.fromRGBO(36, 40, 52, 0.6)),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: active ? color : const Color.fromRGBO(36, 40, 52, 0.6),
              ),
            ),
          ),
        ]
      )
    );
  }
}

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({super.key, required this.changeRoute, required this.routeIndex});
  final Function changeRoute;
  final int routeIndex;
  @override
  State<BottomBarNavigation> createState() => _BottomBarNavigationState();
}


class _BottomBarNavigationState extends State<BottomBarNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.routeIndex,
      showUnselectedLabels: true,
      selectedItemColor: const Color.fromRGBO(125, 81, 254, 1),
      unselectedItemColor: const Color.fromRGBO(36, 40, 52, 0.6),
      selectedFontSize: 12,
      onTap: (value) => {
        widget.changeRoute(value)
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(icons.FeatherIcons.home, color: Color.fromRGBO(36, 40, 52, 0.6)),
          activeIcon: Icon(icons.FeatherIcons.home, color: Color.fromRGBO(125, 81, 254, 1)),  
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(icons.FeatherIcons.navigation, color: Color.fromRGBO(36, 40, 52, 0.6)),
          activeIcon: Icon(icons.FeatherIcons.navigation, color: Color.fromRGBO(125, 81, 254, 1)),  
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(icons.FeatherIcons.heart, color: Color.fromRGBO(36, 40, 52, 0.6)),
          activeIcon: Icon(icons.FeatherIcons.heart, color: Color.fromRGBO(125, 81, 254, 1)),  
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(icons.FeatherIcons.user, color: Color.fromRGBO(36, 40, 52, 0.6)),
          activeIcon: Icon(icons.FeatherIcons.user, color: Color.fromRGBO(125, 81, 254, 1)),  
          label: 'Porfile',
        )
      ],
    );
  }
}