import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/fragments/main_drawer.dart';

class RechargeHistory extends StatefulWidget {

	static const String routeName = 'recharge-history';

	RechargeHistoryState createState() {
		return RechargeHistoryState();
	}
}

class RechargeHistoryState extends State<RechargeHistory> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

	final List<Map<String, dynamic>> history = [
		{"status": "pending", "date": "Mon, Jul 29, 2019", "amount": 1200, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 700, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 8000, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 3200, "type": "water", "name": "Water Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 12000, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 1500, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 1200, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 700, "type": "power", "name": "My Lekki Meter"},
		{"status": "failed", "date": "Mon, Jul 29, 2019", "amount": 8000, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 3200, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 12000, "type": "power", "name": "My Lekki Meter"},
		{"status": "success", "date": "Mon, Jul 29, 2019", "amount": 3200, "type": "water", "name": "Water Meter"},
	];

	Widget build(BuildContext context) {

		return Scaffold(
      key: scaffoldKey,

			// drawer 
			drawer: MainDrawer(),

			// body
			body: SafeArea(
				child: Column(
					children: [

						// appbar
						Padding(
							padding: EdgeInsets.only(
								top: 16.0,
								left: 8.0, right: 8.0,
							),
							child: Row(
								crossAxisAlignment: CrossAxisAlignment.center,
								children: [
									IconButton(
										icon: Icon(
											Icons.arrow_back,
											size: 24.0,
										),
                		//onPressed: () => scaffoldKey.currentState.openDrawer(),
                		onPressed: () => Navigator.of(context).pop(),
									),

									Expanded(
										child: Text(
											"Recharge History",
											style: TextStyle(
												fontSize: 24.0
											),
										),
									),
								]
							),
						),

						Expanded(
							flex: 4,
							child: Padding(
								padding: EdgeInsets.only(
									bottom: 12.0,
								),
								child: ListView.builder(
									physics: BouncingScrollPhysics(),
									itemCount: history.length,
									itemBuilder: (context, index) {

										return Padding(		
											padding: EdgeInsets.only(
												top: 16.0,
												left: 16.0, right: 16.0
											),

											child: Container(
												padding: EdgeInsets.all(16.0),
												decoration: BoxDecoration(
													boxShadow: [
														BoxShadow(
															color: Color.fromRGBO(150,150,150, 0.5),
															offset: Offset(2.0, 2.0),
															blurRadius: 2.0,
														),
													],
													borderRadius: BorderRadius.circular(8.0),
													color: Colors.white,
												),

												child: Row(
													mainAxisSize: MainAxisSize.max,
													children: [

														(() {

															IconData icon = Icons.router;
															Color color = Colors.white;

															if (history[index]['type'] == 'power') {
																icon = Icons.power;
																color = Colors.red;
															}

															else if (history[index]['type'] == "water") {
																icon = Icons.opacity;
																color = Colors.blue;
															}

															return Container(
																padding: EdgeInsets.all(4.0),
																child: Icon(
																	icon, 
																	color: Colors.white,
																),
																decoration: BoxDecoration(
																	color: color,
																	borderRadius: BorderRadius.circular(32.0),
																),
															);

															})(),

														SizedBox(width: 14.0), 

														Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: <Widget>[
																Text(
																	"${history[index]['name']}",
																	style: TextStyle(
																		fontSize: 18.0,
																	),
																),

																Text(
																	"${history[index]['date']}",
																	style: TextStyle(
																		color: Color.fromRGBO(120,120,120,1),
																	),
																),
															]
														),
												
														SizedBox(width: 24.0), 

														Expanded(
															child: SizedBox.shrink(),
														),

														Text("\u20A6 ${history[index]['amount']}"),
												
														SizedBox(width: 8.0), 

														Container(
															width: 6.0,
															height: 6.0,
															color: ((){

																if (history[index]['status'] == 'success') {
																	return  Colors.green;
																}
																else if (history[index]['status'] == 'pending') {
																	return  Colors.orange;
																}
														
																return  Colors.red;

															})(),
														),
													]
												)
											),
										);
									}
								),
							),
						),
					]
				),
			),
		);
	}
}