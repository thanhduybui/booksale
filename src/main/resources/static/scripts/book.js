const categoryLink = document.querySelector(".category-item");

categoryLink.addEventListener("click", () => {
  categoryLink.classList.toggle("show-sub-items");
});
