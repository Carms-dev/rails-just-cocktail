
const loadModel = () => {
  document.getElementById('btn-modal').addEventListener('click', (event) => {
    event.preventDefault();
    document.querySelector('.bg-modal').style.display = 'flex';
  });

  document.querySelector('.closed').addEventListener('click', (event) => {
    document.querySelector('.bg-modal').style.display = 'none';
  });
};


export { loadModel };
