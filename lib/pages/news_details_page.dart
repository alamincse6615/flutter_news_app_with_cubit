import 'package:flutter/material.dart';
import 'package:flutter_cubit_with_api_demo/model/news_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel model;

  const NewsDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name ?? 'Details'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if ((model.icon ?? '').isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                model.icon!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 16),

          Text(
            model.name ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),

          if (model.description != null)
            Text(
              model.description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          const SizedBox(height: 16),

          if (model.url != null)
            Row(
              children: [
                const Icon(Icons.link),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    model.url!,
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),

          _buildChipSection("Categories", model.category),
          _buildChipSection("Languages", model.language),
          _buildChipSection("Countries", model.country),

          const SizedBox(height: 16),

          if (model.totalArticle != null)
            Text("Total Articles: ${model.totalArticle}"),

          if (model.lastFetch != null)
            Text("Last Fetched: ${model.lastFetch}"),
        ],
      ),
    );
  }

  Widget _buildChipSection(String title, List<String>? items) {
    if (items == null || items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: items.map((e) => Chip(label: Text(e))).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

