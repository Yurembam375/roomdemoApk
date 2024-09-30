import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomdemo/controller/controller.dart';
import 'package:badges/badges.dart' as badges;

class LeadsDetailScreen extends StatelessWidget {
  const LeadsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetxTapController controller = Get.put(GetxTapController());

    // Retrieve the passed estimate_id from the previous screen
    final String estimateId = Get.arguments;

    // Filter the customerEstimateFlow to find the lead matching the estimateId
    final leadDetails = controller.customerEstimateFlow.firstWhere(
      (lead) => lead["estimate_id"] == estimateId,
      orElse: () => null,
    );

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: const Text(
            "New Leads",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Add search functionality here
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 3, end: 7),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.red,
                      elevation: 0,
                      padding: const EdgeInsets.all(5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    badgeContent: const Text(
                      "99",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            tabs: [
              Tab(text: 'Items'),
              Tab(text: 'Floor Info'),
              Tab(text: 'Send Quote'),
            ],
          ),
        ),
        body: leadDetails != null
            ? TabBarView(
                children: [
                  // Items Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      // itemCount: leadDetails["items"]["inventory"].length,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        final item = leadDetails["items"]["inventory"][index];
                        List tittle = [
                          "Living Room",
                          "Bed Room",
                          "Custom item"
                        ];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          color: Colors.grey[300],
                          child: ExpansionTile(
                            iconColor: Colors.black,
                            title: Text(
                              tittle[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.red,
                              ),
                            ),
                            children: <Widget>[
                              // Wrap content in SingleChildScrollView
                              SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["displayName"],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),

                                      // for(var i =0; i<=item["category"].length; i++{
                                      //   Text(item["category"][i]["displayName"]);
                                      // }),
                                      for (var i = 0;
                                          i < item["category"].length;
                                          i++)
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.add_box),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                        item["category"][i][
                                                                "displayName"] ??
                                                            "No Name",
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15)),
                                                    const Text(
                                                      "Small|Leather",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // const SizedBox(width:,),
                                            Text(
                                              item["category"][i]["displayName"]
                                                  .length
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Floor Info Tab (Placeholder for now)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            height: 27,
                            width: double.infinity,
                            color: Colors.grey.shade500.withOpacity(0.5),
                            child: const Text(
                              "Existing house details",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Floor No",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["old_floor_no"].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Elevator Available",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["old_elevator_availability"]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Parking Required",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["old_elevator_availability"]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Distance form door to truck",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["old_parking_distance"].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Additonal Information",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dog is avilable so pls call once you call",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            height: 27,
                            width: double.infinity,
                            color: Colors.grey.shade500.withOpacity(0.5),
                            child: const Text(
                              "New House Details",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Floor No",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["new_floor_no"].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Elevator Available",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["new_elevator_availability"]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Parking Required",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["new_elevator_availability"]
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Distance form door to truck",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              leadDetails["new_parking_distance"].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Additonal Information",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dog is avilable so pls call once you call",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Send Quote Tab (Placeholder for now)
                  const Center(child: Text('Send Quote Placeholder')),
                ],
              )
            : const Center(
                child: Text("No details found for this estimate ID."),
              ),
      ),
    );
  }
}
