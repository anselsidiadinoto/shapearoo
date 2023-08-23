window.onload = shopDisplay();
window.onload = materialDisplay();

function shopDisplay() {
    if (
        document.getElementsByClassName('cart-order-details-info')[0]
        .firstElementChild.id == 'shop_id_-1'
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

function materialDisplay() {
    const itemMaterials = document.getElementsByClassName('cart-order-details-print-item')
    for(i = 0; i < itemMaterials.length; i++) {
        try { 
            if (
                document.getElementsByClassName('cart-order-details-print-item')[i]
                .firstElementChild.innerHTML.trim() == '(unassigned)'
                ) {
                document.getElementsByClassName('cart-order-details-print-item')[i]
                .style.display = 'none';
            }
        } catch (error) {
            // catches uncaught type error when there is no designs added yet
        }
    }
}
