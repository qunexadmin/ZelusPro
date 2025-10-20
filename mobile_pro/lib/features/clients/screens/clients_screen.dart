import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zelus_ui/zelus_ui.dart';

class ClientsScreen extends ConsumerStatefulWidget {
  const ClientsScreen({super.key});

  @override
  ConsumerState<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends ConsumerState<ClientsScreen> {
  String _searchQuery = '';

  // Mock client data
  final List<Map<String, dynamic>> _clients = [
    {
      'id': '1',
      'name': 'Sarah Wilson',
      'phone': '(555) 123-4567',
      'email': 'sarah@example.com',
      'lastVisit': DateTime.now().subtract(const Duration(days: 7)),
      'totalVisits': 12,
      'totalSpent': 960.0,
      'notes': 'Prefers natural looks',
    },
    {
      'id': '2',
      'name': 'Emily Chen',
      'phone': '(555) 234-5678',
      'email': 'emily@example.com',
      'lastVisit': DateTime.now().subtract(const Duration(days: 14)),
      'totalVisits': 8,
      'totalSpent': 720.0,
      'notes': 'Allergic to certain dyes',
    },
    {
      'id': '3',
      'name': 'Michael Brown',
      'phone': '(555) 345-6789',
      'email': 'michael@example.com',
      'lastVisit': DateTime.now().subtract(const Duration(days: 3)),
      'totalVisits': 25,
      'totalSpent': 1250.0,
      'notes': 'Regular monthly appointment',
    },
  ];

  List<Map<String, dynamic>> get _filteredClients {
    if (_searchQuery.isEmpty) return _clients;
    return _clients.where((client) {
      final name = client['name'].toString().toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZelusColors.background,
      appBar: AppBar(
        title: Text(
          'Clients',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search clients...',
                hintStyle: TextStyle(
                  color: ZelusColors.textTertiary,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: ZelusColors.textSecondary,
                  size: 22,
                ),
                filled: true,
                fillColor: ZelusColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: ZelusColors.border.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: ZelusColors.border.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      body: _filteredClients.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ZelusColors.primary.withOpacity(0.1),
                          ZelusColors.secondary.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.people_outline,
                      size: 40,
                      color: ZelusColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No clients found',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _searchQuery.isEmpty
                        ? 'Your client list is empty'
                        : 'No clients match your search',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ZelusColors.textSecondary,
                        ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: _filteredClients.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final client = _filteredClients[index];
                return _ModernClientCard(
                  client: client,
                  onTap: () => _showClientDetails(client),
                );
              },
            ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: ZelusColors.primaryGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ZelusColors.primary.withOpacity(0.4),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            // TODO: Add new client
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Add client coming soon')),
            );
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          icon: const Icon(Icons.person_add, size: 20),
          label: const Text(
            'Add Client',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  void _showClientDetails(Map<String, dynamic> client) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(24),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: ZelusColors.gold.withOpacity(0.2),
                    child: Text(
                      client['name'][0],
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: ZelusColors.gold,
                          ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          client['name'],
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '${client['totalVisits']} visits',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: ZelusColors.textSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {
                      // TODO: Edit client
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _InfoSection(
                title: 'Contact',
                items: [
                  _InfoItem(Icons.phone, 'Phone', client['phone']),
                  _InfoItem(Icons.email, 'Email', client['email']),
                ],
              ),
              const SizedBox(height: 16),
              _InfoSection(
                title: 'Statistics',
                items: [
                  _InfoItem(Icons.event, 'Last Visit', _formatDate(client['lastVisit'])),
                  _InfoItem(Icons.attach_money, 'Total Spent', '\$${client['totalSpent']}'),
                ],
              ),
              const SizedBox(height: 16),
              _InfoSection(
                title: 'Notes',
                items: [
                  _InfoItem(Icons.note, 'Notes', client['notes']),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Message client
                      },
                      icon: const Icon(Icons.message),
                      label: const Text('Message'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Book appointment
                      },
                      icon: const Icon(Icons.event),
                      label: const Text('Book'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff < 7) return '$diff days ago';
    if (diff < 30) return '${diff ~/ 7} weeks ago';
    return '${diff ~/ 30} months ago';
  }
}

/// Modern client card widget
class _ModernClientCard extends StatelessWidget {
  final Map<String, dynamic> client;
  final VoidCallback onTap;

  const _ModernClientCard({required this.client, required this.onTap});

  Color _getAvatarColor(int index) {
    final colors = [
      ZelusColors.primary,
      ZelusColors.secondary,
      ZelusColors.accent,
      ZelusColors.success,
      ZelusColors.warning,
    ];
    return colors[client['name'].hashCode % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final avatarColor = _getAvatarColor(0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ZelusColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ZelusColors.border.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: ZelusColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: avatarColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  client['name'][0],
                  style: TextStyle(
                    color: avatarColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    client['name'],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: ZelusColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.event_available,
                              size: 12,
                              color: ZelusColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${client['totalVisits']} visits',
                              style: TextStyle(
                                color: ZelusColors.primary,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: ZelusColors.success.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 12,
                              color: ZelusColors.success,
                            ),
                            Text(
                              '${client['totalSpent']}',
                              style: TextStyle(
                                color: ZelusColors.success,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: avatarColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: avatarColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _InfoSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 12),
        ...items,
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: ZelusColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZelusColors.textSecondary,
                      ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

