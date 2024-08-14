import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://img.freepik.com/premium-photo/medium-shot-woman-living-farmhouse_23-2150621719.jpg?w=996",
      "https://img.freepik.com/free-photo/young-boy-learning-how-ride-horse_23-2150460633.jpg?t=st=1723640688~exp=1723644288~hmac=e8f1282a9fcb44d171df25e08641bcad471bda7b8cb2f15cb3965ef5e4a1fbe7&w=996",
      "https://img.freepik.com/free-vector/hand-drawn-abstract-doodle-pattern-design_23-2149258828.jpg?t=st=1723640728~exp=1723644328~hmac=0cf25496344ded0b62ff09f6d78ff3ffc0e5b7263c0c8d13894097233a9d6324&w=996"
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .8),
          child: CarouselView(
            itemExtent: MediaQuery.sizeOf(context).width * .85,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            children: List.generate(
              images.length,
              (index) => Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
