const initAnimacaoScroll = () => {
  const sections = document.querySelectorAll('.js-scroll');
  if (sections.length) {
    const windowMetade = window.innerHeight * 0.6; //Pega a 60% da altura da tela
    const sectionScrool = () => {
      sections.forEach((section) => {
        const sectionTop = section.getBoundingClientRect().top;
        const isSectionVisible = (sectionTop - windowMetade) < 0;
        if (isSectionVisible) {
          section.classList.add('active');
        }
      })
    }
    sectionScrool();
    window.addEventListener('scroll', sectionScrool);
  }
}

export { initAnimacaoScroll };