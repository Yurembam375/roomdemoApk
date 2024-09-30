import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:roomdemo/controller/controller.dart';
import 'package:roomdemo/screen/leadDetailsScreen.dart';

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  @override
  Widget build(BuildContext context) {
    // Initialize the GetxTapController using Get.put
    GetxTapController controller = Get.put(GetxTapController());

    return DefaultTabController(
      length: 4, // Number of tabs
      initialIndex:
          1, // Set "New" tab as the default index (index starts from 0)
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: const Text(
            "Leads",
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
                      // showSearch(context: context, delegate: MySearchDelegate());
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
                        borderRadius: BorderRadius.circular(4)),
                    badgeContent: const Text(
                      "99",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications)),
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
              Tab(text: 'All'),
              Tab(text: 'New'), // Second tab, with index 1
              Tab(text: 'Follow-up'),
              Tab(text: 'Booked'),
            ],
          ),
        ),
        body: GetBuilder<GetxTapController>(builder: (_) {
          return Obx(() => controller.isDataLoading.value
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                  children: [
                    _buildLeadsList(controller, 'all'), // All leads
                    _buildLeadsList(
                        controller, 'new'), // New leads (default tab)
                    _buildLeadsList(controller, 'followup'), // Follow-up leads
                    _buildLeadsList(controller, 'booked'), // Booked leads
                  ],
                ));
        }),
      ),
    );
  }

  // Method to filter and display the leads based on type
  Widget _buildLeadsList(GetxTapController controller, String type) {
    // Filter leads based on the type
    List<dynamic> filteredLeads = controller.customerEstimateFlow.where((lead) {
      switch (type) {
        case 'all':
          return lead['status'] == 'all'; // Show all leads
        case 'new':
          return true; // New leads only
        case 'followup':
          return lead['status'] == 'Follow-up'; // Follow-up leads
        case 'booked':
          return lead['status'] == 'Booked'; // Booked leads
        default:
          return true;
      }
    }).toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: filteredLeads.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 300,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                // Expanded widget for Date Column to prevent overflow
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Aug",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "23",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 24),
                          ),
                          Text(
                            "23:45",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Expanded widget for Lead Details Column
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Banglore",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                filteredLeads[index]["estimate_id"] ?? 'N/A',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            filteredLeads[index]["moving_from"] ?? 'N/A',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey),
                            maxLines: 2,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.red,
                                  height: 30,
                                  width: 1,
                                ),
                                const Icon(
                                  Icons.arrow_downward_sharp,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.home,
                                  color: Colors.red,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                          controller.customerEstimateFlow[index]
                                              ["property_size"]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.add_box,
                                  color: Colors.red,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                          "${controller.customerEstimateFlow[index]["items"].length} items"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.gif_box_sharp,
                                  color: Colors.red,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text("20 boxes"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.map_outlined,
                                  color: Colors.red,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                          controller.customerEstimateFlow[index]
                                              ["distance"]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const Text(
                          "Banglore",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            filteredLeads[index]["moving_to"] ?? 'N/A',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey),
                            maxLines: 2,
                          ),
                        ),
                        // Additional details can go here
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.red)),
                                height: 35,
                                width: 140,
                                child: MaterialButton(
                                  animationDuration:
                                      const Duration(milliseconds: 3),
                                  onPressed: () {
                                    Get.to(
                                      () =>
                                          const LeadsDetailScreen(), // Navigate to the details screen
                                      arguments: controller
                                          .customerEstimateFlow[index]
                                              ["estimate_id"]
                                          .toString(), // Pass the selected lead data as an argument
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "View Details",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 35,
                                width: 140,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.red),
                                    side: const MaterialStatePropertyAll(
                                        BorderSide.none),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Submit Quote",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
