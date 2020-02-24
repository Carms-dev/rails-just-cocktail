import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Fun, Yum, Drun............k"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
