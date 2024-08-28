import 'package:flutter/material.dart';

class Avaliacao extends StatefulWidget {
  @override
  _AvaliacaoState createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Avaliação'),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductReviewScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Avaliação de Produto'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SellerReviewScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Avaliação de Perfil de Vendedor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  _ProductReviewScreenState createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  List<Map<String, String>> _reviews = [];

  void _saveReview() {
    final product = _productController.text;
    final review = _reviewController.text;
    final rating = _ratingController.text;
    final imageUrl = _imageController.text;

    setState(() {
      _reviews.add({
        'product': product,
        'review': review,
        'rating': rating,
        'imageUrl': imageUrl,
      });
    });

    _productController.clear();
    _reviewController.clear();
    _ratingController.clear();
    _imageController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Avaliação Salva'),
          content: Text('Produto: $product\nAvaliação: $review\nNota: $rating'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Avaliação de Produto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _productController,
              decoration: InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_bag, color: Colors.blue[700]),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                labelText: 'Comentário',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.comment, color: Colors.blue[700]),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(
                labelText: 'Nota (0-5)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.star, color: Colors.blue[700]),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem do Produto',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.image, color: Colors.blue[700]),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Salvar Avaliação'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Avaliações Anteriores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  final review = _reviews[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        review['imageUrl'] ?? '',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image, color: Colors.blue),
                      ),
                      title: Text('Produto: ${review['product']}'),
                      subtitle: Text(
                          'Comentário: ${review['review']}\nNota: ${review['rating']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SellerReviewScreen extends StatefulWidget {
  const SellerReviewScreen({super.key});

  @override
  _SellerReviewScreenState createState() => _SellerReviewScreenState();
}

class _SellerReviewScreenState extends State<SellerReviewScreen> {
  final TextEditingController _sellerNameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  List<Map<String, String>> _reviews = [];

  void _saveReview() {
    final sellerName = _sellerNameController.text;
    final review = _reviewController.text;
    final rating = _ratingController.text;
    final service = _serviceController.text;
    final imageUrl = _imageController.text;

    setState(() {
      _reviews.add({
        'sellerName': sellerName,
        'review': review,
        'rating': rating,
        'service': service,
        'imageUrl': imageUrl,
      });
    });

    _sellerNameController.clear();
    _reviewController.clear();
    _ratingController.clear();
    _serviceController.clear();
    _imageController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Avaliação Salva'),
          content: Text(
              'Vendedor: $sellerName\nComentário: $review\nNota: $rating\nServiço: $service'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text('Avaliação de Perfil de Vendedor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _sellerNameController,
              decoration: InputDecoration(
                labelText: 'Nome do Vendedor',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Colors.blue[700]),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                labelText: 'Comentário',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.comment, color: Colors.blue[700]),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ratingController,
              decoration: InputDecoration(
                labelText: 'Nota (0-5)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.star, color: Colors.blue[700]),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _serviceController,
              decoration: InputDecoration(
                labelText: 'Serviço Prestado',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.handshake, color: Colors.blue[700]),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem do Vendedor',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.image, color: Colors.blue[700]),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Salvar Avaliação'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Avaliações Anteriores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  final review = _reviews[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        review['imageUrl'] ?? '',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image, color: Colors.blue),
                      ),
                      title: Text('Vendedor: ${review['sellerName']}'),
                      subtitle: Text(
                          'Comentário: ${review['review']}\nNota: ${review['rating']}\nServiço: ${review['service']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
