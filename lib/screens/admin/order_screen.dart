import 'package:flutter/material.dart';
import 'package:food_mess_mobile_app/db/constants.dart';
import 'package:food_mess_mobile_app/util/date_util.dart';

import '../../api/order_api.dart';
import '../../models/order_model.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // 🔹 Define the Future variable that holds our database query stream
  late Future<List<OrderModel>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _refreshOrders(); // Run the initial fetch when the screen mounts
  }

  /// 🔹 Triggers the asynchronous database read pipeline
  void _refreshOrders() {
    setState(() {
      // Switches out based on user scope:
      // Use CustomerOrderApi.getAllOrders() for admin global view
      _ordersFuture = CustomerOrderApi.getAllOrders();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Orders",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          // ➕ CRUD: CREATE NEW ORDER BUTTON
          IconButton(
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: primaryColor,
              size: 28,
            ),
            onPressed: () => _handleCreateOrder(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          /* ==========================================================================
             TABLE HEADER BAR (No Gridlines, Modern Columns layout)
          ========================================================================== */
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "ORDER ID",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "CUSTOMER",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "STATUS",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                Expanded(flex: 2, child: TextAlignEndText(text: "PRICE(AED)")),
                SizedBox(width: 48),
                // Leaves space directly matching the trailing action options button
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Colors.white12),
          // Subtle accent baseline separator

          /* ==========================================================================
          FUTURE BUILDER ENGINE LAYER
          ========================================================================== */
          Expanded(
            child: FutureBuilder<List<OrderModel>>(
              future: _ordersFuture, // Passes down our asynchronous operation
              builder: (context, snapshot) {
            
                // ⏳ State 1: Network Pipeline is still processing data (Loading)
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
            
                // ❌ State 2: Request failed or server threw a processing exception
                else if (snapshot.hasError) {
                  return Center(
                    child: Text("Unable to sync data logs: ${snapshot.error}"),
                  );
                }
            
                // 📦 State 3: Data arrived but the document grid layout is completely empty
                else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("You haven't placed any culinary orders yet!"),
                  );
                }
            
                // ✅ State 4: Data loaded successfully. Extract the typed model list array.
                final List<OrderModel> orders = snapshot.data!;
            
                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return _buildModernOrderRow(context ,order, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /* ==========================================================================
     MODERN BORDERLESS ROW BUILDER
  ========================================================================== */
  Widget _buildModernOrderRow(
    BuildContext context,
    OrderModel order,
    int index,
  ) {
    // Striped row color effect for easier scanning without using gridlines
    final Color rowBgColor = index % 2 == 0
        ? backgroundColor2
        : backgroundColor2.withOpacity(0.65);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: rowBgColor,
      child: Row(
        children: [
          // Column 1: Order ID
          Expanded(
            flex: 2,
            child: Text(
              order.orderId,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

          // Column 2: Customer Name & Meal Title Stacked Cleanly
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.userId,
                  style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 13),
                ),
                const SizedBox(height: 2),
                Text(
                  order.mealName,
                  style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white38, fontSize: 11),
                ),
              ],
            ),
          ),

          // Column 3: Modern Status Badge
          Expanded(
            flex: 2,
            child: Text(
              DateUtilsHelper.formatDate(order.mealDate),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

          // Column 4: Price
          Expanded(
            flex: 2,
            child: Text(
              order.totalPrice.toStringAsFixed(2),
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 13),
            ),
          ),

          /* ==========================================
             CRUD: ACTIONS POPUP MENU (Edit / Delete)
          ========================================== */
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert_rounded, color: primaryColor),
            onSelected: (action) => _handleCrudAction(action, order),
            itemBuilder: (BuildContext context) => [
              // const PopupMenuItem(
              //   value: "edit",
              //   child: Row(
              //     children: [
              //       Icon(Icons.edit_outlined, color: Colors.lightGreen, size: 20),
              //       SizedBox(width: 10),
              //       Text("Edit Record",  style: TextStyle(color: Colors.lightGreen)),
              //     ],
              //   ),
              // ),
              const PopupMenuItem(
                value: "delete",
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text("Delete Order", style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /* ==========================================================================
     CRUD LOGIC CONTROLLERS
  ========================================================================== */
  void _handleCreateOrder() {
    print("CRUD ACTION: Open Create New Order View/Dialog");
    // TODO: Navigation or Dialog code for adding an order
  }

  void _handleCrudAction(String action, OrderModel order) {
    if (action == "edit") {
      print("CRUD ACTION: Edit order details for ${order.orderId}");
      // TODO: Open your edit views
    } else if (action == "delete") {
      print("CRUD ACTION: Delete target ledger ${order.orderId}");
      // TODO: Execute your delete endpoint requests
    }
  }
}

// Simple internal helper utility to keep text alignments neat
class TextAlignEndText extends StatelessWidget {
  final String text;

  const TextAlignEndText({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
    ],
  );
}
