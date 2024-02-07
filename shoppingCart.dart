// You are implementing a shopping cart feature for an e-commerce application.
// Design a class ShoppingCart to manage the items added by users.
// Implement methods to add items to the cart, remove items, calculate the total price, and apply discounts based
// on the quantity and type of items using Dart data types such as lists, sets, and maps.

class ShoppingCart {
  Map<String, int> items = {};

  // add items to the cart
  void addItem(String itemName, int quantity) {
    if (items.containsKey(itemName)) {
      items[itemName] = (items[itemName] ?? 0) + quantity;
    } else {
      items[itemName] = quantity;
    }
  }

  // remove items from the cart
  void removeItem(String itemName, int quantity) {
    if (items.containsKey(itemName)) {
      items[itemName] = (items[itemName] ?? 0) - quantity;
      if (items[itemName]! <= 0) {
        items.remove(itemName);
      }
    }
  }

  // calculate the total price
  double calculateTotalPrice(Map<String, double> itemPrices) {
    double totalPrice = 0;
    items.forEach((itemName, quantity) {
      if (itemPrices.containsKey(itemName)) {
        totalPrice += (itemPrices[itemName] ?? 0) * quantity;
      }
    });
    return totalPrice;
  }

  // apply discounts based on quantity and type of items
  void applyDiscounts(Map<String, double> itemDiscounts) {
    items.forEach((itemName, quantity) {
      if (itemDiscounts.containsKey(itemName)) {
        double discount = itemDiscounts[itemName] ?? 0;
        items[itemName] = (items[itemName] ?? 0) - (quantity * discount).toInt();
        if (items[itemName]! <= 0) {
          items.remove(itemName);
        }
      }
    });
  }
}

void main() {
  ShoppingCart cart = ShoppingCart();

  // Add items to the cart
  cart.addItem('Shirt', 2);
  cart.addItem('Pants', 1);
  cart.addItem('Shoes', 1);

  // Remove items from the cart
  cart.removeItem('Shirt', 1);

  // Calculating total price
  Map<String, double> itemPrices = {
    'Shirt': 20.0,
    'Pants': 30.0,
    'Shoes': 50.0,
  };
  double totalPrice = cart.calculateTotalPrice(itemPrices);
  print('Total Price: \$${totalPrice.toStringAsFixed(2)}');

  // Apply discounts
  Map<String, double> itemDiscounts = {
    'Shirt': 0.1,
  };
  cart.applyDiscounts(itemDiscounts);

  // Recalculating total price after discounts
  totalPrice = cart.calculateTotalPrice(itemPrices);
  print('Total Price after Discounts: \$${totalPrice.toStringAsFixed(2)}');
}