function hideModal(modal) {
    document.getElementsByClassName(modal)[0]
        .style.display = 'none';
    document.getElementsByClassName('default-modal-background')[0]
        .style.display = 'none';
}

function modalShopSelection() {
    document.getElementsByClassName('cart-modal-shop-selection')[0]
        .style.display = 'flex';
    document.getElementsByClassName('default-modal-background')[0]
        .style.display = 'flex';
}

function modalItemQuantity(item_id) {
    document.getElementsByClassName('cart-modal-item-quantity')[0]
        .style.display = 'flex';
    document.getElementsByClassName('default-modal-background')[0]
        .style.display = 'flex';

    document.getElementById(`modal_item_img`)
        .src = 
    document.getElementById(`item_img_id_${item_id}`)
        .src;
    
    document.getElementById(`modal_item_design_name`)
        .innerHTML = 
    document.getElementById(`item_design_name_id_${item_id}`)
        .innerHTML;

    document.getElementById(`modal_item_designer_name`)
        .innerHTML = 
    document.getElementById(`item_designer_name_id_${item_id}`)
        .innerHTML;

    document.getElementById(`modal_design_id`)
        .value = item_id;
    
    const currentQuantity = 
        document.getElementById(`item_quantity_id_${item_id}`)
        .innerHTML.trim();
    const quantityOptions = 
        document.getElementById(`modal_item_quantity`)
        .options;

    for(i = 0; i< quantityOptions.length; i++) {
        if(currentQuantity === quantityOptions[i].value) {
            document.getElementById(`modal_item_quantity`)
                .options.selectedIndex = i;
            break;
        }
    }

    document.getElementById(`modal_item_remove`)
        .setAttribute('onclick', `redirect('/cart/remove_item/${item_id}')`);
    
}
