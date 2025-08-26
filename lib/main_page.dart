import 'package:flutter/material.dart';
import 'login.dart';

class MainPage extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final bool isDark;

  const MainPage({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late bool _isDark;

  @override
  void initState() {
    super.initState();
    _isDark = widget.isDark;
  }

  static const List<String> _titles = [
    "Dashboard",
    "Products",
    "Orders",
    "Settings",
  ];

  static const List<Widget> _pages = <Widget>[
    Center(
      child: Text(
        "📊 Dashboard",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "📦 Products",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "🛒 Orders",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "⚙️ Settings",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LoginPage(onThemeChanged: widget.onThemeChanged, isDark: _isDark),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🌟 Flat AppBar with Logo Left + Menu Right
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/company_logo.webp", // 🔑 put company_logo.webp in assets folder
              height: 28,
            ),
            const SizedBox(width: 10),
            Text(
              _titles[_selectedIndex],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        elevation: 2,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),

      // 🌟 Right Side Drawer
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                _isDark ? Icons.light_mode : Icons.dark_mode,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                _isDark ? "Switch to Light Mode" : "Switch to Dark Mode",
              ),
              onTap: () {
                setState(() => _isDark = !_isDark);
                widget.onThemeChanged(_isDark);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: _logout,
            ),
          ],
        ),
      ),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),

      // ✅ Modern Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(
          context,
        ).colorScheme.onSurface.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
