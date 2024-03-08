// ignore_for_file: unused_element, prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:healthy_pet_app/models/profileDoctorModel.dart';
import 'package:healthy_pet_app/models/serviceOptionModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const _greetings(),
            const SizedBox(
              height: 20,
            ),
            const _cardImage(),
            const SizedBox(
              height: 20,
            ),
            _searchBar(),
            const SizedBox(
              height: 20,
            ),
            serviceOption(),
            const SizedBox(
              height: 20,
            ),
            _cardDoctor()
          ],
        ),
      ),
    ));
  }

  // _searchbar
  Widget _searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFFF6F6F6)),
      child: TextFormField(
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            prefixIconColor: Color(0xFFADACAD),
            hintText: 'Find best vaccinate, treatment...',
            hintStyle: TextStyle(
                color: Color(0xFFCACACA),
                fontSize: 12,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                height: 150 / 100),
            border: InputBorder.none),
      ),
    );
  }
}

class _cardDoctor extends StatelessWidget {
  _cardDoctor({
    Key? key,
  }) : super(key: key);

  List<ProfileDoctorModel> doctorList = [
    ProfileDoctorModel(
        name: 'Dr.Stone',
        service: ['Vaccine', 'Surgery'],
        distance: 10,
        isAvailable: true,
        image: 'assets/images/profile2.jpg'),
    ProfileDoctorModel(
        name: 'Dr.Vanessa',
        service: ['Vaccine', 'Surgery'],
        distance: 10,
        isAvailable: true,
        image: 'assets/images/profile1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: doctorList.length,
        itemBuilder: ((context, index) {
          List<String> a = doctorList[index].service;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.inner,
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(1, 2), // changes position of shadow
                  )
                ]),
            child: Row(
              children: [
                Image.asset(
                  doctorList[index].image,
                  height: 103,
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        doctorList[index].name,
                        style: TextStyle(
                            color: Color(0xFF3F3E3F),
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            'Service :',
                            style: TextStyle(
                              color: Color(0xFF3F3E3F),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'i.toString()',
                            style: TextStyle(
                              color: Color(0xFF3F3E3F),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: Color(0xFFACA3A3),
                          ),
                          Text(
                            ' ${doctorList[index].distance}km',
                            style: TextStyle(
                              color: Color(0xFFACA3A3),
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        doctorList[index].isAvailable
                            ? 'Available'
                            : 'Not Available',
                        style: TextStyle(
                            color: doctorList[index].isAvailable
                                ? Color(0xFF50CC98)
                                : Color(0xFFEF6497),
                            fontSize: 12,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class serviceOption extends StatefulWidget {
  serviceOption({
    Key? key,
  }) : super(key: key);

  @override
  State<serviceOption> createState() => _serviceOptionState();
}

class _serviceOptionState extends State<serviceOption> {
  List<ServiceOption> serviceOptionButton = [
    ServiceOption(name: 'Vaccine', isSelected: true),
    ServiceOption(name: 'Surgery', isSelected: false),
    ServiceOption(name: 'SPA & Treatment', isSelected: false),
    ServiceOption(name: 'Consultation', isSelected: false)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: serviceOptionButton.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                serviceOptionButton.forEach((element) {
                  element.isSelected = false;
                });
                serviceOptionButton[index].isSelected = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: serviceOptionButton[index].isSelected
                    ? const Color(0xFF818AF9)
                    : const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                serviceOptionButton[index].name,
                style: TextStyle(
                    color: serviceOptionButton[index].isSelected
                        ? Colors.white
                        : const Color(0xFFCACACA),
                    fontSize: 12,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _greetings extends StatelessWidget {
  const _greetings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hello, Human!',
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w800),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_bag_outlined,
            size: 30,
          ),
          color: const Color(0xFF818AF9),
        )
      ],
    );
  }
}

class _cardImage extends StatelessWidget {
  const _cardImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF818AF9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Image.asset(
              'assets/images/cardImage.png',
              // width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5),
                      ),
                      TextSpan(
                        text: 'Catrine ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5),
                      ),
                      TextSpan(
                        text: 'will get \nvaccination ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5),
                      ),
                      TextSpan(
                        text: 'tommorow \nat 07.00 am!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'See details',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
