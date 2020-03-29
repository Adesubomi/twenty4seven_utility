import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/recharge_history.dart';
import 'package:twenty4seven_utility/screens/dashboard.dart';
import 'package:twenty4seven_utility/screens/usage_stats.dart';

class MainDrawer extends StatelessWidget {

	Widget build(BuildContext context) {
		return Drawer(
      elevation: 0.0,
      child: SafeArea(
      	child: Padding(
      		padding: EdgeInsets.all(16.0),
      		child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
      			children: <Widget>[

      				Container(
      					padding: EdgeInsets.all(8.0),
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(8.0),
									gradient: LinearGradient(
							      begin: Alignment.topLeft,
							      end: Alignment.bottomRight,
							      colors: [
							      	Color.fromRGBO(200, 251, 244, 1),
							      	Color.fromRGBO(200, 235, 252, 1),
						      	],
							    ),
								),
								child: Row(
									children: <Widget>[
										Icon(
											Icons.person,
											size: 36.0
										),

										SizedBox(width: 8.0),

										Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												Text("Oniya Daniel A."),
												Text("daniel.prince84@gmail.com"),
											]
										),
									]
								),
							),

							SizedBox(
								width: double.infinity,
								child: RaisedButton(
									child: Text("sign out"),
								),
							),

							SizedBox(
								height: 24.0,
							),

							Expanded(
								child: SingleChildScrollView(
									physics: BouncingScrollPhysics(),
									child: Column(
										children: [
											DrawerItem(title: "Dashboard", icon: Icons.dashboard, onPressed: () {
													Navigator.of(context).pushNamed(Dashboard.routeName);
												}),
											DrawerItem(title: "Recharge History", icon: Icons.history, onPressed: () {
													Navigator.of(context).pushNamed(RechargeHistory.routeName);
												}),
											DrawerItem(title: "Usage Stats", icon: Icons.insert_chart, onPressed: () {
													Navigator.of(context).pushNamed(UsageStats.routeName);
												}),
											DrawerItem(title: "Scheduled Recharge", icon: Icons.timer),
											DrawerItem(title: "My Meters", icon: Icons.router),
											DrawerItem(title: "Energy Tips", icon: Icons.wb_sunny),
											DrawerItem(title: "Support", icon: Icons.live_help),
										]
									),
								),
							),

							Padding(
								padding: EdgeInsets.only(
									top: 16.0
								),
								child: SizedBox(
									child: RaisedButton(
										child: Row(
											children: <Widget>[
												Icon(Icons.add_shopping_cart), 
												SizedBox(width: 4.0),
												Text("Recharge"), 
											]
										),
										onPressed: () {}
									),
								),
							),
      			]
    			),
    		),
    	),
    );
	}
}


class DrawerItem extends StatelessWidget {

	final Function onPressed;
	final String title;
	final IconData icon;

	DrawerItem({@required this.title, @required this.icon, this.onPressed});

	Widget build(BuildContext context) {

		return Padding(
			padding: EdgeInsets.only(
				bottom: 8.0
			),

			child: FlatButton(
				child: Row(
					children: [
						Icon(
							icon,
							size: 20.0,
							color: Color.fromRGBO(120,120,120,0.7),
						),
						SizedBox(width: 8.0),
						Text(
							title,
							style: TextStyle(
								fontSize: 20.0
							),
						),
					]
				),
				onPressed: () {
					if ( onPressed != null) {
						Navigator.of(context).pop();
						onPressed();
					}
				},
			),
		);
	}
}