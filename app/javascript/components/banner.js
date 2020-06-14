import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Do you have an idea?", "Developers close to you"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };