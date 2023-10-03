import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Offset> _bubblesPositions = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
      setState(() {});
    });

    _initializeBubblesPositions();
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializeBubblesPositions() {
    _bubblesPositions.add(const Offset(150, 100));
    _bubblesPositions.add(const Offset(150, 200));
    _bubblesPositions.add(const Offset(100, 150));
    _bubblesPositions.add(const Offset(170, 80));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildBlurredBackground(),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Go Premium",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Image(
                          image: AssetImage('Assets/img.png'),
                          height: 100,
                          width: 183,
                        ),
                      )
                    ],
                  ),
                  _buildFeatureRow(
                    icon: Icons.add_a_photo_outlined,
                    text: "Unlimited Storage for photos, videos",
                  ),

                  _buildFeatureRow(
                    icon: Icons.ad_units,
                    text: "Unlimited exports for medias",
                  ),
                  _buildFeatureRow(
                    icon: Icons.ads_click_rounded,
                    text: "Remove all the advertisements",
                  ),
                  _buildFeatureRow(
                    icon: Icons.delete_forever_outlined,
                    text: "Recover files you deleted from trash",
                  ),
                  const SizedBox(height: 30),
                  Container(
                    // width: 450,
                    child: Image.asset("Assets/button.png"),
                  ),


                  const Text("Restore the Purchase",style: TextStyle(fontWeight: FontWeight.bold),),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: const Row(
                        children: [
                          Text("Terms of Services",style: TextStyle(color:Colors.yellow,decoration: TextDecoration.underline),),
                          SizedBox(width: 5,),
                          Text("and"),
                          SizedBox(width: 5,),
                          Text("Privacy Policy",style: TextStyle(color:Colors.yellow,decoration: TextDecoration.underline)),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            _buildFloatingBubbles(),
          ],
        ),
      ),
    );
  }

  Widget _buildBlurredBackground() {
    return Container(
      color: Colors.black,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildFeatureRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.yellow,
          size: 25,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildFloatingBubbles() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topRight,
        child: Stack(
          children: _bubblesPositions.map((position) {
            return Positioned(
              left: position.dx + 30 * _animationController.value,
              top: position.dy + 50 * _animationController.value,
              // child: _buildBubble(Colors.orange.withOpacity(0.4)),
              child: Column(
                children: [
                  _buildBubble(Colors.orange.withOpacity(0.4)),

                  _buildBubble(Colors.blue.withOpacity(0.4)),
                  const SizedBox(height: 30,),
                  _buildBubble(Colors.pink.withOpacity(0.4)),
                  const SizedBox(height: 100,),
                  _buildBubble(Colors.green.withOpacity(0.4)),
                ],

              ),

            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBubble(Color color) {
    return ClipOval(
      child: Container(
        width: 40,
        height: 40,
        color: color,
      ),
    );
  }
}
