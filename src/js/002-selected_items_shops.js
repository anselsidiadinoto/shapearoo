
window.onload = checkDesignCart();


function checkDesignCart() {
    const currentItemsSet = new Set();
    const currentItems = document.getElementsByClassName('current-cart-item-id');
    for(i = 0; i < currentItems.length; i++) {
        currentItemsSet.add(+currentItems[i].innerHTML.trim());
    }

    changeItemBtn(currentItemsSet);
    changeItemDetailsBtn(currentItemsSet);
}

function changeItemDetailsBtn(currentItemsSet) {
    let itemId = document.getElementById('browse-item-details-id'); 

    if(itemId != null) {
        itemId = +itemId.innerHTML.trim()
    } else {
        itemId = -1;
    }

    if (currentItemsSet.has(itemId)) {
        document.getElementById('browse-item-details-btn-id')
            .innerHTML = 'remove from cart';
        document.getElementById('browse-item-details-btn-id')
            .setAttribute('onclick', `redirect('/cart/remove_item/${itemId}')`)
    }
}

function changeItemBtn(currentItemsSet) {
    const designItems = document.getElementsByClassName('browse-items-id');
    for(i = 0; i < designItems.length; i++) {
        let itemId = +designItems[i].innerHTML.trim()

        if (currentItemsSet.has(itemId)) {
            document.getElementById(`browse-items-btn-${itemId}`)
                .innerHTML = '-';
            document.getElementById(`browse-items-btn-${itemId}`)
                .style.backgroundColor = '#c7d7ff';
            document.getElementById(`browse-items-btn-${itemId}`)
                .style.color = 'white';
            document.getElementById(`browse-items-btn-${itemId}`)
                .setAttribute('onclick', `redirect('/cart/remove_item/${itemId}')`)
            // '#4579fc'
        }
    }
}