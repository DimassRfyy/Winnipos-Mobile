import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:winnipos/shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample data - replace with actual data from your backend
  final String userName = "John Doe";
  final String businessName = "Green Cafe & Restaurant";
  final int totalOrders = 156;
  final double totalExpenses = 2450.75;
  final double totalRevenue = 8750.50;

  // Sample monthly revenue data
  final List<MonthlyRevenue> monthlyRevenueData = [
    MonthlyRevenue('Jan', 5200),
    MonthlyRevenue('Feb', 6100),
    MonthlyRevenue('Mar', 5800),
    MonthlyRevenue('Apr', 7200),
    MonthlyRevenue('May', 6900),
    MonthlyRevenue('Jun', 8100),
    MonthlyRevenue('Jul', 7800),
    MonthlyRevenue('Aug', 8500),
    MonthlyRevenue('Sep', 7900),
    MonthlyRevenue('Oct', 8200),
    MonthlyRevenue('Nov', 8750),
    MonthlyRevenue('Dec', 9200),
  ];

  // Sample today's sold items data
  final List<SoldItem> todaysSoldItems = [
    SoldItem('Cappuccino', 25, 125.00),
    SoldItem('Chicken Burger', 18, 324.00),
    SoldItem('Caesar Salad', 12, 180.00),
    SoldItem('Iced Tea', 30, 90.00),
    SoldItem('Chocolate Cake', 8, 120.00),
    SoldItem('Fish & Chips', 15, 225.00),
    SoldItem('Green Smoothie', 22, 154.00),
    SoldItem('Pasta Carbonara', 10, 180.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(),
              const SizedBox(height: AppSpacing.lg),

              // Stats Cards
              _buildStatsCards(),
              const SizedBox(height: AppSpacing.lg),

              // Revenue Chart
              _buildRevenueChart(),
              const SizedBox(height: AppSpacing.lg),

              // Today's Sales Table
              _buildTodaysSalesTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: lightGreenColor,
              borderRadius: BorderRadius.circular(AppRadius.xl),
              border: Border.all(color: greenColor, width: 2),
            ),
            child: Icon(
              Icons.person,
              size: 30,
              color: greenColor,
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: bodySmallTextStyle.copyWith(color: greyColor),
                ),
                Text(
                  userName,
                  style: h3TextStyle,
                ),
                const SizedBox(height: AppSpacing.xs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: lightGreenColor,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    businessName,
                    style: bodySmallTextStyle.copyWith(
                      color: darkGreenColor,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Notification Icon
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: greyColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            'Total Orders',
            totalOrders.toString(),
            Icons.shopping_cart_outlined,
            infoColor,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _buildStatCard(
            'Total Expenses',
            '\$${totalExpenses.toStringAsFixed(2)}',
            Icons.trending_down,
            errorColor,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _buildStatCard(
            'Total Revenue',
            '\$${totalRevenue.toStringAsFixed(2)}',
            Icons.trending_up,
            successColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Icon(
                  Icons.arrow_upward,
                  color: color,
                  size: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: h3TextStyle.copyWith(color: color),
          ),
          Text(
            title,
            style: bodySmallTextStyle.copyWith(color: greyColor),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueChart() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Revenue',
            style: h4TextStyle,
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: 250,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 10000,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '\$${rod.toY.toStringAsFixed(0)}',
                        whiteTextStyle.copyWith(fontWeight: medium),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        if (value.toInt() < monthlyRevenueData.length) {
                          return Text(
                            monthlyRevenueData[value.toInt()].month,
                            style: captionTextStyle,
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Text(
                          '\$${(value / 1000).toStringAsFixed(0)}K',
                          style: captionTextStyle,
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: monthlyRevenueData.asMap().entries.map((entry) {
                  return BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value.revenue,
                        color: greenColor,
                        width: 16,
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysSalesTable() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today\'s Sales',
                style: h4TextStyle,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: lightGreenColor,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Text(
                  '${todaysSoldItems.length} items',
                  style: bodySmallTextStyle.copyWith(
                    color: darkGreenColor,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: Text(
                      'Item Name',
                      style: labelTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Qty',
                    style: labelTextStyle.copyWith(fontWeight: semiBold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Total',
                    style: labelTextStyle.copyWith(fontWeight: semiBold),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          
          // Table Rows
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todaysSoldItems.length,
            separatorBuilder: (context, index) => Divider(
              color: borderColor,
              height: 1,
            ),
            itemBuilder: (context, index) {
              final item = todaysSoldItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                        child: Text(
                          item.name,
                          style: bodyMediumTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        item.quantity.toString(),
                        style: bodyMediumTextStyle.copyWith(fontWeight: medium),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '\$${item.total.toStringAsFixed(2)}',
                        style: priceTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          
          const SizedBox(height: AppSpacing.md),
          Divider(color: borderColor, thickness: 2),
          const SizedBox(height: AppSpacing.sm),
          
          // Total Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Sales Today',
                style: h4TextStyle,
              ),
              Text(
                '\$${todaysSoldItems.fold(0.0, (sum, item) => sum + item.total).toStringAsFixed(2)}',
                style: largePriceTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Data Models
class MonthlyRevenue {
  final String month;
  final double revenue;

  MonthlyRevenue(this.month, this.revenue);
}

class SoldItem {
  final String name;
  final int quantity;
  final double total;

  SoldItem(this.name, this.quantity, this.total);
}