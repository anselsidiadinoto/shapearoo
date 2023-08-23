window.onload = grandTotalDisplay();

function grandTotalDisplay() {
    let itemSubtotals = document.getElementsByClassName('cart-order-details-item-total');
    let grandTotal = 0;

    for(i = 0; i<itemSubtotals.length; i++) {
        grandTotal += +itemSubtotals[i].innerHTML.trim();
    }

    document.getElementById('cart-order-items-all-total').innerHTML = '$' + grandTotal;
    document.getElementById('cart-order-grand-total').innerHTML = '$' + (grandTotal + 10.00);
}