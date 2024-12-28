# Shopify App

This project is a Flutter-based mobile application that showcases an e-commerce layout with products, hot offers, and a shopping cart feature.

## Features

1. **Product Showcase**
    
    - Displays a list of products in a scrollable grid.
    - Each product includes an image, a title, and an "Add to Cart" button.
2. **Image Catalog**
    
    - A `PageView` widget allows users to swipe through product images.
3. **Hot Offers Section**
    
    - A horizontally scrolling `ListView` displays hot offers.
4. **Shopping Cart Interaction**
    
    - Users can add items to the cart by tapping the "Add to Cart" button.
    - A `SnackBar` notification confirms the action.

## Code Overview

### Entry Point

```dart
void main() {
  runApp(const MainApp());
}
```

- The `MainApp` widget is the root of the application and sets up the `MaterialApp`.

### HomePage Widget

#### Description

The `HomePage` widget builds the main UI layout, including the app bar, product list, and hot offers section.

#### Key Components

- **AppBar**

```dart
appBar: AppBar(
  backgroundColor: Colors.blue,
  title: Text('Shopify App'),
),
```

Displays the title of the app.

- **Product List with GridView**

```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemCount: 2,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://picsum.photos/200',
              width: 100,
              height: 100,
            ),
          ),
          Text('Product \$index'),
          ElevatedButton.icon(
            onPressed: _addToCart,
            icon: Icon(Icons.add_shopping_cart),
            label: Text('add to cart'),
          )
        ],
      ),
    );
  },
),
```

- **Hot Offers with Horizontal ListView**

```dart
ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: 5,
  itemBuilder: (BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Image.network(
            'https://picsum.photos/200',
            width: 120,
          ),
          Expanded(flex: 2, child: Text('Offer \$index')),
        ],
      ),
    );
  },
),
```

- **Add to Cart Functionality**

```dart
void _addToCart() {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Item added to cart'),
      duration: Duration(seconds: 2),
    ),
  );
}
```

## Dependencies

This project uses the following Flutter framework components:

- `MaterialApp`
- `Scaffold`
- `AppBar`
- `ListView`
- `GridView`
- `PageView`
- `SnackBar`

## Screenshots

- **Main Page:** Displays the product list, image carousel, and hot offers.
![Output Screenshot](output.png)
- **SnackBar Notification:** Confirms when an item is added to the cart.
![Output Screenshot](output2.png)
## Getting Started

1. Clone the repository:
    
    ```bash
    git clone <repository-url>
    ```
    
2. Navigate to the project directory:
    
    ```bash
    cd simple_shopping_app
    ```
    
3. Install dependencies:
    
    ```bash
    flutter pub get
    ```
    
4. Run the app:
    
    ```bash
    flutter run
    ```
