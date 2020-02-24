// const initUpdateNavbarOnScroll = () => {
//   const navbar = document.querySelector('.navbar-lewagon');
//   if (navbar) {
//     window.addEventListener('scroll', () => {
//       if (window.scrollY >= window.innerHeight) {
//         navbar.classList.add('navbar-lewagon-white');
//       } else {
//         navbar.classList.remove('navbar-lewagon-white');
//       }
//     });
//   }
// }

// export { initUpdateNavbarOnScroll };

changeStarColor = (event) => {

  let element = document.getElementById(event.target.id);

  let starId = parseInt(element.id);
  let strId = "";

  let i = 1
  while (i <= starId) {
    strId = i.toString();
    let gold = document.getElementById(strId);
    gold.style.color = "gold";
    i++;
  }
  while(i <= 5) {
    strId = i.toString();
    let white = document.getElementById(strId);
    white.style.color = "white";
    i++;
  }
  this.countYellowStars();
}

countYellowStars = () => {
  let arr = [];
  let stars = document.getElementByClassName("star");
  for (let i = 0; i < stars.length; i++) {
    arr.push(stars[i].style.color);
  };
  this.setState({
    rating: arr.length
  });

}
