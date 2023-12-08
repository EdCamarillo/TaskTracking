
const moreMenu = document.querySelector('.MoreMenu');

moreMenu.style.display = 'none';

function displayMore(){
    if (moreMenu.style.display === 'none') {
        moreMenu.style.display = 'block';
    } else {
        moreMenu.style.display = 'none';
    }
}