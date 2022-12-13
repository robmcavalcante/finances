const cards_select = document.getElementById("transaction_card_id");
const invoices_select = document.getElementById("transaction_invoice_id");

function clearInvoices() {
  if (invoices_select.childElementCount > 1)
    invoices_select.lastChild.remove();
}

cards_select.addEventListener("change", async function() {
  clearInvoices();
  id = cards_select.value;
  url = `http://localhost:3000/card/${id}/invoices`

  invoices = await (await fetch(url)).json();

  invoice_select = document.querySelector("#transaction_invoice_id");

  invoices.forEach(function(i) {
    var invoice = document.createElement("option");
    invoice.text = `${i.reference}`
    invoice.value = `${i.id}`

    invoice_select.appendChild(invoice);
  });
});