import 'package:flutter/material.dart';

void main() => runApp(const NikeApp());

class NikeApp extends StatelessWidget {
  const NikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Helvetica'),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isTextHovered = false;
  bool _isTextTapped = false;  // Add this

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEE500),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SINCE/1964',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: Image.asset(
                      'assets/skate.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            MouseRegion(
              onEnter: (_) => setState(() => _isTextHovered = true),
              onExit: (_) => setState(() => _isTextHovered = false),
              child: GestureDetector(  // Add this
                onTapDown: (_) => setState(() => _isTextTapped = true),
                onTapUp: (_) => setState(() => _isTextTapped = false),
                onTapCancel: () => setState(() => _isTextTapped = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.identity()..scale(_isTextHovered || _isTextTapped ? 1.1 : 1.0),
                  child: Text(
                    'NIKE\nJUST DO IT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: _isTextHovered || _isTextTapped ? 'BubbleGraffitiline' : 'BubbleGraffiti',
                      fontSize: 94,
                      fontWeight: FontWeight.w900,
                      height: 0.9,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Image.asset(
              'assets/logo jordan.jpeg',
              width: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShopScreen()),
                      );
                    },
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();}

class _ShopScreenState extends State<ShopScreen> {
  // Add hover state variables
  bool _isBackHovered = false;
  bool _isMenuHovered = false;
  
  // Add hover states map
  final Map<String, bool> _productHoverStates = {
    'TRAVIS SCOTT × NIKE\nAIR JORDANS': false,
    'NIKE OG × AIR JORDAN 1': false,
    'NIKE × SB DUNK LOW - DEAD BEAR': false,
    'NIKE × RETRO JORDAN 5': false,
  };

  // Add tap states
  final Map<String, bool> _productTapStates = {
    'TRAVIS SCOTT × NIKE\nAIR JORDANS': false,
    'NIKE OG × AIR JORDAN 1': false,
    'NIKE × SB DUNK LOW - DEAD BEAR': false,
    'NIKE × RETRO JORDAN 5': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF444444),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: MouseRegion(
          onEnter: (_) => setState(() => _isBackHovered = true),
          onExit: (_) => setState(() => _isBackHovered = false),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()..scale(_isBackHovered ? 1.1 : 1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: _isBackHovered ? const Color(0xFFFEE500) : Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'BACK',
                      style: TextStyle(
                        color: _isBackHovered ? const Color(0xFFFEE500) : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: [
          MouseRegion(
            onEnter: (_) => setState(() => _isMenuHovered = true),
            onExit: (_) => setState(() => _isMenuHovered = false),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()..scale(_isMenuHovered ? 1.1 : 1.0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: _isMenuHovered ? const Color(0xFFFEE500) : Colors.white,
                  ),
                  onPressed: () {
                    // Add navigation to MenuScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuScreen()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(  // Using Stack instead of Row for overlapping elements
              children: [
                const Text(
                  'SHOP\nNOW',
                  style: TextStyle(
                    fontFamily: 'BubbleGraffitiline',
                    color: Color(0xFFFEE500),
                    fontSize: 94,
                    fontWeight: FontWeight.bold,
                    height: 0.85,
                  ),
                ),
                Positioned(  // Position the 2022 tag
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      '2022',
                      style: TextStyle(
                        color: Color(0xFFFEE500),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildProductItem(
              'TRAVIS SCOTT × NIKE\nAIR JORDANS',
              true,
            ),
            _buildProductItem('NIKE OG × AIR JORDAN 1'),
            _buildProductItem('NIKE × SB DUNK LOW - DEAD BEAR'),
            _buildProductItem('NIKE × RETRO JORDAN 5'),

            // ... rest of the existing build method code ...
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(String text, [bool showDescription = false]) {
    bool isTravisScott = text == 'TRAVIS SCOTT × NIKE\nAIR JORDANS';
    bool isJordan1 = text == 'NIKE OG × AIR JORDAN 1';
    bool isDeadBear = text == 'NIKE × SB DUNK LOW - DEAD BEAR';
    bool isJordan5 = text == 'NIKE × RETRO JORDAN 5';
    
    return MouseRegion(
      onEnter: (_) => setState(() => _productHoverStates[text] = true),
      onExit: (_) => setState(() => _productHoverStates[text] = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _productTapStates[text] = true),
        onTapUp: (_) => setState(() => _productTapStates[text] = false),
        onTapCancel: () => setState(() => _productTapStates[text] = false),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.identity()..scale(_productHoverStates[text]! || _productTapStates[text]! ? 1.1 : 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: TextStyle(
                            color: _productHoverStates[text]! || _productTapStates[text]! 
                                ? const Color(0xFFFEE500) 
                                : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: _productHoverStates[text]! || _productTapStates[text]! 
                            ? const Color(0xFFFEE500) 
                            : Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                if (showDescription || (isJordan1 && _productHoverStates[text]!) || 
                    (isDeadBear && _productHoverStates[text]!) ||
                    (isJordan5 && _productHoverStates[text]!)) ...[
                  const SizedBox(height: 8),
                  Text(
                    isJordan1 
                        ? 'Step into greatness with the AJ1. This special edition is made from quality leather, infused with comfortable Nike Air cushioning and decked out with signature Jordan details to give you an icon of style'
                        : isDeadBear
                            ? 'Embrace the vibrant spirit of the Nike SB Dunk Low Grateful Dead Bears Opti Yellow sneakers. Inspired by the iconic Grateful Dead band, these eye-catching kicks feature a playful colorway with bold Opti Yellow LIMITED EDITION'
                            : isJordan5
                                ? 'Get your piece of Jordan history and heritage with the Air Jordan 5 Retro. Based on the classic game shoe from 1990, it has all the iconic details, including the bump-out collar, lace toggle and fighter plane-inspired design lines with Vibrant Yellow Edition'
                                : 'Last on his list is rapper and singer Travis Scott. The shoe toaster company has collaborated with him on several sneakers, and the collab has led to the rise...',
                    style: TextStyle(
                      color: _productHoverStates[text]! || _productTapStates[text]! 
                          ? const Color(0xFFFEE500) 
                          : Colors.white.withAlpha(179),
                      fontSize: 14,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
              ],
            ),
            if (_productHoverStates[text]! || _productTapStates[text]!)
              Positioned(
                right: 40,
                top: -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _productHoverStates[text]! || _productTapStates[text]! ? 1.0 : 0.0,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          isJordan1 
                              ? 'assets/high jordan.jpeg' 
                              : isDeadBear
                                  ? 'assets/NIKE SB DUNK LOW _Grateful Dead - Yellow Bear_.jpeg'
                                  : isJordan5
                                      ? 'assets/jordan retro 5.jpeg'
                                      : 'assets/low.nike.jpeg'
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Make the maps final
  final Map<String, bool> _menuItemHoverStates = {
    'HOME': false,
    'COLLABS': false,
    'ABOUT': false,
    'BLOG': false,
    'STORE': false,
  };

  final Map<IconData, bool> _socialIconHoverStates = {
    Icons.facebook: false,
    Icons.alternate_email: false,
    Icons.camera_alt: false,
  };

  // Add tap states
  final Map<String, bool> _menuItemTapStates = {
    'HOME': false,
    'COLLABS': false,
    'ABOUT': false,
    'BLOG': false,
    'STORE': false,
  };

  final Map<IconData, bool> _socialIconTapStates = {
    Icons.facebook: false,
    Icons.alternate_email: false,
    Icons.camera_alt: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Changed to white
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'NIKE',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 4),
            Image.asset(
              'assets/nike logo.jpeg',
              height: 24,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            SizedBox(
              width: 300, // Fixed width for menu items
              child: _buildMenuItems(),
            ),
            const Spacer(flex: 1),
            _buildSocialIcons(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch items to container width
      children: [
        _menuItem('HOME'),
        _buildDivider(),
        _menuItem('COLLABS', isNew: true),
        _buildDivider(),
        _menuItem('ABOUT'),
        _buildDivider(),
        _menuItem('BLOG'),
        _buildDivider(),
        _menuItem('STORE'),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.white.withAlpha(77), // Replace withOpacity(0.3)
      margin: const EdgeInsets.symmetric(vertical: 15),
    );
  }

  Widget _menuItem(String text, {bool isNew = false}) {
    return MouseRegion(
      onEnter: (_) => setState(() => _menuItemHoverStates[text] = true),
      onExit: (_) => setState(() => _menuItemHoverStates[text] = false),
      child: GestureDetector(  // Add this
        onTapDown: (_) => setState(() => _menuItemTapStates[text] = true),
        onTapUp: (_) => setState(() => _menuItemTapStates[text] = false),
        onTapCancel: () => setState(() => _menuItemTapStates[text] = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(_menuItemHoverStates[text]! || _menuItemTapStates[text]! ? 1.1 : 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  // Swap the font families - BubbleGraffitiline as default
                  fontFamily: _menuItemHoverStates[text]! || _menuItemTapStates[text]! 
                      ? 'BubbleGraffiti' 
                      : 'BubbleGraffitiline',
                  color: _menuItemHoverStates[text]! || _menuItemTapStates[text]! 
                      ? const Color(0xFFFEE500) 
                      : Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isNew) ...[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEE500),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialIcon(Icons.facebook),
        const SizedBox(width: 24),
        _socialIcon(Icons.alternate_email), // Used as a placeholder for Twitter
        const SizedBox(width: 24),
        _socialIcon(Icons.camera_alt), // Used as a placeholder for Instagram
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return MouseRegion(
      onEnter: (_) => setState(() => _socialIconHoverStates[icon] = true),
      onExit: (_) => setState(() => _socialIconHoverStates[icon] = false),
      child: GestureDetector(  // Add this
        onTapDown: (_) => setState(() => _socialIconTapStates[icon] = true),
        onTapUp: (_) => setState(() => _socialIconTapStates[icon] = false),
        onTapCancel: () => setState(() => _socialIconTapStates[icon] = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(_socialIconHoverStates[icon]! || _socialIconTapStates[icon]! ? 1.1 : 1.0),
          child: Icon(
            icon,
            color: _socialIconHoverStates[icon]! || _socialIconTapStates[icon]! 
                ? const Color(0xFFFEE500) 
                : Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
