const openCloseSimpleModal = () => {
  if (document.querySelector('.simple-modal-btn')) {
    const simpleModalButtons = document.querySelectorAll('.simple-modal-btn');
    const simpleModal = document.querySelector('.simple-modal-background');

    // OPEN
    simpleModalButtons.forEach(button => {

      button.addEventListener('click', (event) => {

        if (simpleModal.classList.contains('modal-hidden-first')) {
          simpleModal.classList.remove('modal-hidden-first')
          simpleModal.classList.toggle('modal-visible');
        } else {
          simpleModal.classList.toggle('modal-hidden');
          simpleModal.classList.toggle('modal-visible');
        }

      });
    }) // End of OPEN

    // CLOSE
    document.querySelector('.close-simple-modal-btn').addEventListener('click', (event) => {
      simpleModal.classList.toggle('modal-hidden');
      simpleModal.classList.toggle('modal-visible');
    });

    document.addEventListener('keydown', (event) => {
      if (event.key === 'Escape' && simpleModal.classList.contains('modal-visible')) {
        simpleModal.classList.toggle('modal-hidden');
        simpleModal.classList.toggle('modal-visible');
      }
    });

    document.addEventListener('click', (event) => {
      if (event.target.classList.contains('close-simple-modal-btn') || event.target.classList.contains('close-simple-modal-btn-i') || event.target.classList.contains('close-simple-modal-container') || event.target.classList.contains('simple-modal-background')) {
        const openedAddModal = document.querySelector('.simple-modal-background.modal-visible');
        openedAddModal.classList.toggle('modal-hidden');
        openedAddModal.classList.toggle('modal-visible');
      }
    });
  }
};

export { openCloseSimpleModal };
