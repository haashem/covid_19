import 'package:covid_19/constants.dart';
import 'package:covid_19/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details_screen';
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 21),
                    blurRadius: 53,
                    color: Colors.black.withOpacity(0.05),
                  )
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextWithMoreIcon(),
                    SizedBox(height: 15),
                    buildCaseNumber(context),
                    SizedBox(height: 15),
                    Text(
                      'From Health Center',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                          color: kTextMediumColor),
                    ),
                    SizedBox(height: 15),
                    WeeklyChart(),
                    SizedBox(height: 15),
                    Row(children: [
                      buildInfoTextWithPercentage(
                          title: 'From Last Week', percentage: '6.43'),
                      buildInfoTextWithPercentage(
                          title: 'Recovery Rate', percentage: '9.31'),
                    ],),
                    ],),
            ),

                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 21),
                            blurRadius: 54,
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Global Map', style: TextStyle(fontSize: 15),), SvgPicture.asset('assets/icons/more.svg'),
                          ],
                        ),
                        SizedBox(height: 10),
                        SvgPicture.asset('assets/icons/map.svg')
                      ]),
                    ),
                  
          ],
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String title, String percentage}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: '$percentage% \n',
        style: TextStyle(color: kPrimaryColor, fontSize: 20),
      ),
      TextSpan(
        text: title,
        style: TextStyle(color: kTextMediumColor, height: 1.5),
      )
    ]));
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(children: [
      Text(
        '547 ',
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(color: kPrimaryColor, height: 1.2),
      ),
      Text(
        '5.9%',
        style: TextStyle(color: kPrimaryColor),
      ),
      SvgPicture.asset('assets/icons/increase.svg'),
    ]);
  }

  Row buildTextWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'New Cases',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: kTextMediumColor),
        ),
        SvgPicture.asset('assets/icons/more.svg')
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: kPrimaryColor,
        onPressed: () => Navigator.of(context).pop(),
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
