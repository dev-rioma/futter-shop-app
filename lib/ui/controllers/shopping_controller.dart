import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
    entries.add(Product(2, "Usb", 15));
  }

  void calcularTotal() {
    int newTotal = 0;
    // TODO
    // calcular el valor total de los elementos en el carro de compras
    for (var producto in entries) {
      newTotal += producto.price * producto.quantity;
    }
    print(newTotal);
    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // TODO
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    Product findElement = entries.firstWhere((producto) => producto.id == id);

    findElement.quantity += 1;
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    int positionProduct = entries.indexOf(findElement);

    // después hacer el incremento en la cantidad

    // finalmente actualizar entries usando el indice y el elemento actualizado
    entries[positionProduct] = findElement;

    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // TODO
    // similar a agregarProducto
    Product findElement = entries.firstWhere((producto) => producto.id == id);
    int positionProduct = entries.indexOf(findElement);

    if (findElement.quantity == 0) {
      entries[positionProduct] = findElement;
    } else {
      findElement.quantity -= 1;
      entries[positionProduct] = findElement;
    }
    // validar cuando la cantidad es igual a cero

    calcularTotal();
  }
}
