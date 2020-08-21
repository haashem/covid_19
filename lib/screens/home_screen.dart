import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/info_card.dart';
import '../constants.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(runSpacing: 20, spacing: 20, children: [
                InfoCard(
                  title: 'Confirmed Cases',
                  effectedNum: 1062,
                  iconColor: Color(0xFFFF9C00),
                  onPress: () => Navigator.of(context).pushNamed(DetailsScreen.routeName),
                ),
                InfoCard(
                  title: 'Total Deaths',
                  effectedNum: 75,
                  iconColor: Color(0xFFFF2D55),
                  onPress: () => Navigator.of(context).pushNamed(DetailsScreen.routeName),
                ),
                InfoCard(
                  title: 'Total Recovered',
                  effectedNum: 1062,
                  iconColor: Color(0xFF50E3C2),
                  onPress: () => Navigator.of(context).pushNamed(DetailsScreen.routeName),
                ),
                InfoCard(
                  title: 'New Cases',
                  effectedNum: 1062,
                  iconColor: Color(0xFF5856D6),
                  onPress: () => Navigator.of(context).pushNamed(DetailsScreen.routeName),
                )
              ]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    'Preventations',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  buildPreventation(),
                  SizedBox(height: 40),
                  buildHelpCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildPreventation() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PreventationCard(
                    title: 'Wash Hands',
                    svgSource: 'assets/icons/hand_wash.svg',
                  ),
                  PreventationCard(
                    title: 'Use Masks',
                    svgSource: 'assets/icons/use_mask.svg',
                  ),
                  PreventationCard(
                    title: 'Clean Disinfect',
                    svgSource: 'assets/icons/Clean_Disinfect.svg',
                  ),
                ],
              );
  }

  Widget buildHelpCard(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.4,
            right: 20,
            top: 20,
          ),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF60BE93),
              Color(0xFF1B8D59),
            ]),
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Dial 999 for \nMedical Help\n',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
              TextSpan(
                text: 'if any symptom appear',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                ),
              )
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SvgPicture.asset('assets/icons/nurse.svg'),
        ),
        Positioned(child: SvgPicture.asset('assets/icons/virus.svg'), top: 30, right: 10,)
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor.withOpacity(0.03),
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          onPressed: () {},
        )
      ],
    );
  }
}

class PreventationCard extends StatelessWidget {
  final String svgSource;
  final String title;
  const PreventationCard({Key key, this.svgSource, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(svgSource),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
