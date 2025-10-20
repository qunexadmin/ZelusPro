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
      appBar: AppBar(
        title: const Text('Clients'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search clients...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: ZelusColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
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
          ? EmptyState(
              icon: Icons.people_outline,
              title: 'No clients found',
              message: _searchQuery.isEmpty
                  ? 'Your client list is empty'
                  : 'No clients match your search',
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredClients.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final client = _filteredClients[index];
                return _ClientCard(
                  client: client,
                  onTap: () => _showClientDetails(client),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Add new client
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add client coming soon')),
          );
        },
        icon: const Icon(Icons.person_add),
        label: const Text('Add Client'),
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

class _ClientCard extends StatelessWidget {
  final Map<String, dynamic> client;
  final VoidCallback onTap;

  const _ClientCard({required this.client, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ZelusColors.gold.withOpacity(0.2),
                child: Text(
                  client['name'][0],
                  style: const TextStyle(
                    color: ZelusColors.gold,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client['name'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      '${client['totalVisits']} visits • \$${client['totalSpent']}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: ZelusColors.textSecondary),
            ],
          ),
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

