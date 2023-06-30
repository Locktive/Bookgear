function pagsw(x) {
    var pag1 = document.querySelector('.pag1')
    var pag2 = document.querySelector('.pag2')
    var pag3 = document.querySelector('.pag3')

    switch (x) {

        case 1:
            pag1.style.display = 'contents';
            pag2.style.display = 'none';
            pag3.style.display = 'none';
            break;

        case 2:
            pag2.style.display = 'contents';
            pag1.style.display = 'none';
            pag3.style.display = 'none';
            break;

        case 3:
            pag3.style.display = 'contents';
            pag2.style.display = 'none';
            pag1.style.display = 'none';
            break;
    }

}
