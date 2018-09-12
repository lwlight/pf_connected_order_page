$(document).on('click', '.btn-add', function (event) {
    event.preventDefault();

    var field = $(this).closest('.form-row');
    var field_new = field.clone();

    $(this)
        .toggleClass('btn-success')
        .toggleClass('btn-add')
        .toggleClass('btn-danger')
        .toggleClass('btn-remove')
        .html('✖');

    field_new.find('input').val('');
    field_new.insertAfter(field);
});

$(document).on('click', '.btn-remove', function (event) {
    event.preventDefault();
    $(this).closest('.form-row').remove();
});

function concatFields() {

    var description = document.getElementById('description');
    var dishes = document.getElementsByName('dish');
    var quantities = document.getElementsByName('quantity');
    var combinedDescription = "";

    for (var i = 0; i < dishes.length; i++) {
        var dish = dishes.item(i);
        var quantity = quantities.item(i);
        combinedDescription = combinedDescription + dish.value + "---" + quantity.value + "\n";
    }

    description.value = combinedDescription;
    document.orderForm.submit();
}
