window.onload = shopDisplay();

function shopDisplay() {
    if (
        document.getElementsByClassName('cart-order-details-info')[0]
        .firstElementChild.id == 'shop_id_unassigned'
        ) {
        document.getElementsByClassName('cart-order-details-shop-image')[0]
            .style.display = 'none';
        document.getElementsByClassName('cart-order-details-shop-name')[0]
            .style.display = 'none';
        document.getElementsByClassName('cart-order-details-shop-address')[0]
            .style.display = 'none';
        document.getElementsByClassName('cart-order-details-shop-change')[0]
            .href = '/search/shop';
        document.getElementsByClassName('cart-order-details-shop-change')[0]
            .onclick = '';
    } else {
        document.getElementsByClassName('cart-order-details-info')[0]
            .firstElementChild.style.backgroundColor = 'white';
        document.getElementsByClassName('cart-order-details-shop-add-btn')[0]
            .style.display = 'none';
        document.getElementsByClassName('cart-order-details-shop-add-text')[0]
            .style.display = 'none';
        document.getElementsByClassName('cart-order-details-shop-change')[0]
            .innerHTML = 'edit print shop';
        document.getElementsByClassName('cart-order-details-info')[0]
            .firstElementChild.onclick = '';
    }
}
