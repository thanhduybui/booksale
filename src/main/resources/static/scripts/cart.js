document.addEventListener("DOMContentLoaded", () => {
  const btnDecreases = document.querySelectorAll(".btn-decrease");
  const btnIncreases = document.querySelectorAll(".btn-increase");
  const btnDeleteItems = document.querySelectorAll(".btn-detele-item");
  console.log(btnDeleteItems)

  updateData = (id, quantity) => {
    const data = {
      id: id,
      quantity: quantity,
    };
    fetch("http://localhost:8080/booksale/cart/update-quantity", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    }).then((res) => {
      console.log(res);
    });
  };

  deleteData = (id) => {
    const data = {
          id: id,
          quantity: null,
        };
        fetch("http://localhost:8080/booksale/cart/delete", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(data),
        }).then((res) => {
          console.log(res);
        });
  }

  // Function to get the book ID
  function getBookId(element) {
  console.log(element);
    const hiddenInput = element.parentElement.querySelector(".book-id");
    return hiddenInput.value;
  }

  btnDeleteItems.forEach((btn) => {
    btn.addEventListener("click", (e) => {
        e.preventDefault();
        console.log("Inside delete function");
        const bookId = getBookId(e.target.parentElement);
        deleteData(bookId);

        // Reload the window after deleting
        window.location.reload();
    })
  })

  btnDecreases.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      const input = e.target.parentElement.querySelector(".quantity-box input");
      const currentValue = parseInt(input.value);
      if (currentValue > 1) {
        input.value = currentValue - 1;
      }

      const id = getBookId(e.target.parentElement);
      const quantity = input.value;
      updateData(id, quantity);
    });
  });

  btnIncreases.forEach((btn) => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      const input = e.target.parentElement.querySelector(".quantity-box input");
      const currentValue = parseInt(input.value);
      input.value = currentValue + 1;

      const id = getBookId(e.target.parentElement);
      const quantity = input.value;
      updateData(id, quantity);
    });
  });
});
