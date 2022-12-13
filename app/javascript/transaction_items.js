btn_add_invoice_input = document.querySelector("#invoice-input-action");

btn_add_invoice_input.addEventListener("click", 
  function InsertInvoiveInput(){
    a = document.querySelector("#transaction_invoice_id");
    a.outerHTML =  "";

    target = document.querySelector("#invoice-input-action");

    element = document.createElement("input");
    element.setAttribute("type", "text");
    element.setAttribute("name", "transaction[invoice]");
    element.setAttribute("class", "form-control invoice");
    element.setAttribute("placeholder", "MM/YYYY");

    target.parentNode.insertBefore(element, target);

    target.outerHTML = "";
  }
);

add_item = document.querySelector("#add-item");

add_item.addEventListener("click", 
  function AddItem(){
    let item = document.querySelector("#transaction-item");

    let clone = item.cloneNode(true);

    const index = document.querySelector("#transaction-items").childElementCount;

    clone.querySelector("#item-description").setAttribute("name", `transaction[transaction_items_attributes][${index}][description]`);
    clone.querySelector("#item-description").value = "";

    clone.querySelector("#item-value").setAttribute("name", `transaction[transaction_items_attributes][${index}][value]`);
    clone.querySelector("#item-value").value = "";

    let items = document.querySelector("#transaction-items");

    items.appendChild(clone);
  }
);

remove_item = document.querySelector("#remove-item");

remove_item.addEventListener("click", 
  function RemoveItem(){
    items = document.querySelector("#transaction-items");

    n_elements = items.childElementCount;

    if (n_elements >= 2)
      items.lastChild.remove();
  }
);