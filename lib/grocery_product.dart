class GroceryProduct {
  const GroceryProduct({
    required this.price,
    required this.name,
    required this.description,
    required this.image,
    required this.weight,
  });
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
      price: 11.5,
      name: 'Carrots',
      description:
          'The carrot is one of the most cultivated vegetables in the world. Its consumption has spreaded widely, since at present it is available all the year round.',
      image: 'lib/images/Carrots.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.5,
      name: 'Oranges',
      description:
          'Round orange fruit, consumed mainly in winter. Its flesh is also orange and is formed by small bags full of juice.',
      image: 'lib/images/oranges.png',
      weight: '1000g'),
  GroceryProduct(
      price: 11.5,
      name: 'Watermelon',
      description:
          'The watermelon is a large fruit of a more or less spherical shape. It is usually eaten raw as table dessert.',
      image: 'lib/images/watermelon.png',
      weight: '1000g'),
  GroceryProduct(
      price: 11.5,
      name: 'Broccoli',
      description:
          'The broccoli is a vegetable that belongs the cabbage family. Its consumption increases constantly, since it is a healthy food with multiple culinary uses.',
      image: 'lib/images/Broccoli.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.5,
      name: 'Strawberries',
      description:
          'The strawberry is a succulent and fragrant fruit of bright red colour, obtained from the plant with the same name. In the West it is considered as the "queen of the fruit".',
      image: 'lib/images/strawberries.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.5,
      name: 'Tomatoes',
      description:
          'The tomato is the most important vegetable in the world. It is consumed in multiple ways, both raw as processed for the industry, rich in fiber and low in calories, supplying vitamins and minerals.',
      image: 'lib/images/tomatoes.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.5,
      name: 'Avocado',
      description:
          'The avocado is a fleshy exotic fruit obtained from the tropical tree of the same name. The oily pulp of cream to greenish-yellow color has a very similar taste to nuts.',
      image: 'lib/images/avocado.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.5,
      name: 'Banana',
      description:
          'The banana is a lengthy yellow fruit, found in the market in groups of three to twenty fruits, similar to a triangular cucumber, oblong and normally yellow. Its flavour is more or less sweet, depending on the variety.',
      image: 'lib/images/Bannana.png',
      weight: '500g'),
];
