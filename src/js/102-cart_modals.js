window.onload = hideAddPrintDetails()

function hideAddPrintDetails() {
    const cartItems = document.getElementsByClassName('cart-order-details-item-id');
    for(i = 0; i < cartItems.length; i++) {
        let currentItemId = +cartItems[i].innerHTML.trim();
        let currentItemRemaining = 
            +document.getElementById(`items_remaining_id_${currentItemId}`)
                .innerHTML.trim();

        if(currentItemRemaining == 0) {
            document.getElementById(`cart_add_remining_item_id_${currentItemId}`)
                .style.display = 'none';
        }
    }
}

function checkInputValues() {
    const input_quantity = 
        document.getElementById('modal_item_material_quantity');
    const input_material = 
        document.getElementById('modal_item_material_type');
    const input_color = 
        document.getElementById('modal_item_material_color');

    const selected_quantity = input_quantity.selectedIndex;
    const selected_material = input_material.selectedIndex;
    const selected_color = input_color.selectedIndex;
    const button = document.getElementById('modal_item_material_add_update');

    console.log(input_quantity[selected_quantity].value);
    console.log(input_material[selected_material].value);
    console.log(input_color[selected_color].value);

    if(
        input_quantity[selected_quantity].value == '' ||
        input_material[selected_material].value == '' ||
        input_color[selected_color].value == ''
      ) {
        console.log('disabled');
        button.disabled = true;
        button.style.cursor = 'auto';
        button.style.borderColor = 'lightgrey';
    } else {
        console.log('enabled');
        button.disabled = false;
        button.style.cursor = 'pointer';
        button.style.borderColor = 'black';
    }
}


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

function modalItemMaterials(item_id) {
    document.getElementsByClassName('cart-modal-item-material')[0]
        .style.display = 'flex';
    document.getElementsByClassName('default-modal-background')[0]
        .style.display = 'flex';

    document.getElementById(`modal_item_material_img`)
        .src = 
    document.getElementById(`item_img_id_${item_id}`)
        .src;

    document.getElementById('modal_item_material_remaining')
        .innerHTML = 'Remaining: ' + 
    document.getElementById(`items_remaining_id_${item_id}`)
        .innerHTML;

    document.getElementById('modal_item_material_design_id')
        .value = item_id;
    
    document.getElementById('modal_item_material_item_name')
        .innerHTML = 
    document.getElementById(`item_design_name_id_${item_id}`)
        .innerHTML;   

    document.getElementById('form_modal_item_material')
        .action = '/cart/add_item_material';
    
    document.getElementById('modal_item_material_add_update')
        .innerHTML = 'Add';
    
    checkInputValues();

    materialQuantity(item_id);
    materialType(item_id);
    clearMaterialColor();
        
}

function materialQuantity(item_id) {
    document.getElementById('modal_item_material_quantity').innerHTML = 
    '<option disabled selected value></option>';

    let remaining_items = +document.getElementById(`items_remaining_id_${item_id}`)
    .innerHTML;

    for(i = 0; i < remaining_items; i++) {
        let remaining_option = document.createElement('option')
        remaining_option.value = i + 1;
        remaining_option.innerHTML = i + 1;
        document.getElementById('modal_item_material_quantity').appendChild(remaining_option);
    }
}

function clearMaterialColor() {
    document.getElementById('modal_item_material_color').innerHTML = 
    '<option disabled selected value></option>';
}

function materialType(item_id) {
    const shop_materials = document.getElementsByClassName('cart-order-details-shop-filament');

    document.getElementById('modal_item_material_type').innerHTML = 
    '<option disabled selected value></option>';

    document.getElementById('modal_item_material_type')
        .setAttribute(`onchange`, `materialColor(${item_id})`)

    let shop_materials_array = [];
    let shop_color_array = [];

    for(i = 0; i < shop_materials.length; i++) {
        let material = shop_materials[i].firstElementChild.innerHTML.trim();

        if(shop_materials_array.length == 0) {
            shop_materials_array.push(material)
        } else if(shop_materials_array[shop_materials_array.length - 1] != material) {
            shop_materials_array.push(material);
        }
    }

    for(i = 0; i < shop_materials_array.length; i++){
        let material_option = document.createElement('option')
        material_option.value = shop_materials_array[i];
        material_option.innerHTML = shop_materials_array[i];
        document.getElementById('modal_item_material_type').appendChild(material_option);
    }
}

function materialColor(item_id) {
    checkInputValues();

    const shop_materials = document.getElementsByClassName('cart-order-details-shop-filament');
    const index = document.getElementById('modal_item_material_type').selectedIndex;
    const selected_material = document.getElementById('modal_item_material_type')[index].value;
    const current_material_colors =
        document.getElementsByClassName(`cart-print-item-id-${item_id}-${selected_material}-color`);

    const material_colors_set = new Set();
    for(i = 0; i < current_material_colors.length; i++) {
        material_colors_set.add(current_material_colors[i].innerHTML.trim())
    }

    let shop_color_array = [];
    for(i = 0; i < shop_materials.length; i++) {
        let material = shop_materials[i].firstElementChild.innerHTML.trim();
        let color = shop_materials[i].lastElementChild.innerHTML.trim()

        if (material == selected_material && !material_colors_set.has(color)) {
            shop_color_array.push(color);
        } 
    }
    
    document.getElementById('modal_item_material_color').innerHTML = 
    '<option disabled selected value></option>';

    for(i = 0; i < shop_color_array.length; i++) {
        let material_option = document.createElement('option')
        material_option.value = shop_color_array[i];
        material_option.innerHTML = shop_color_array[i];

        document.getElementById('modal_item_material_color').appendChild(material_option);
    }
}


function editItemMaterial(item_id, item_qtd, item_current_qtd,item_remaining_qtd, item_material, item_color) {

    document.getElementsByClassName('cart-modal-item-material')[0]
        .style.display = 'flex';
    document.getElementsByClassName('default-modal-background')[0]
        .style.display = 'flex';

    document.getElementById(`modal_item_material_img`)
        .src = 
    document.getElementById(`item_img_id_${item_id}`)
        .src;

    document.getElementById('modal_item_material_remaining')
        .innerHTML = 'Remaining: ' + 
    document.getElementById(`items_remaining_id_${item_id}`)
        .innerHTML;

    document.getElementById('modal_item_material_design_id')
        .value = item_id;

    document.getElementById('modal_item_material_item_name')
        .innerHTML = 
    document.getElementById(`item_design_name_id_${item_id}`)
        .innerHTML;        

    document.getElementById('modal_item_material_remove')
        .setAttribute(
            'onclick', 
            `redirect('/cart/remove_item_material/${item_id}/${item_material}/${item_color}')`
        );

    document.getElementById('form_modal_item_material')
        .action = `/cart/update_item_material`;
    
    document.getElementById('modal_item_material_add_update')
        .innerHTML = 'Update';
    
    editItemMaterialQtd(item_id, item_qtd, item_remaining_qtd, item_current_qtd);
    editItemMaterialType(item_id, item_material);
    editItemMaterialColor(item_id, item_color);
   
}

function editItemMaterialQtd(item_id, item_qtd, item_remaining_qtd, item_current_qtd) {

    document.getElementById('modal_item_material_quantity').innerHTML = '';

    console.log(item_qtd, item_remaining_qtd);

    for(i = 0; i < Math.max(item_remaining_qtd, item_qtd); i++) {
        let current_qtd_option = document.createElement('option')
        current_qtd_option.value = i + 1;
        current_qtd_option.innerHTML = i + 1;

        document.getElementById('modal_item_material_quantity').appendChild(current_qtd_option);

        if(current_qtd_option.value == item_current_qtd) {
            document.getElementById('modal_item_material_quantity').selectedIndex = i;
        }
    }
    

}

function editItemMaterialType(item_id, item_material) {
    document.getElementById('modal_item_material_type').innerHTML = '';

        let material_option = document.createElement('option')
        material_option.value = item_material;
        material_option.innerHTML = item_material;

        document.getElementById('modal_item_material_type')
        .appendChild(material_option);
        
        document.getElementById('modal_item_material_type').selectedIndex = 0;

}

function editItemMaterialColor(item_id, item_color) {
    document.getElementById('modal_item_material_color').innerHTML = '';


    const shop_materials = document.getElementsByClassName('cart-order-details-shop-filament');

    const index = document.getElementById('modal_item_material_type').selectedIndex;

    const selected_material = document.getElementById('modal_item_material_type')[index].value;


    let shop_color_array = [];

    for(i = 0; i < shop_materials.length; i++) {
        let material = shop_materials[i].firstElementChild.innerHTML.trim();
        let color = shop_materials[i].lastElementChild.innerHTML.trim()

        if (material == selected_material) {
            shop_color_array.push(color)
        }
    }

    for(i = 0; i < shop_color_array.length; i++) {
        let material_option = document.createElement('option')
        material_option.value = shop_color_array[i];
        material_option.innerHTML = shop_color_array[i];

        document.getElementById('modal_item_material_color').appendChild(material_option);

        if(material_option.value == item_color) {
            document.getElementById('modal_item_material_color').selectedIndex = i;
        }
    }

}




