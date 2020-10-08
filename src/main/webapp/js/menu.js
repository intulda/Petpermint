"use strict";
(($, exports) => {

    $.extend(true, window, {
        "Menu": Menu
    })

    function Menu() {

        const data = {
            list : [
                {name: '강아지 이야기', subMenu: [
                        { name: '강아지 백과', link: '', order: 1},
                        { name: '강아지 음식', link: '', order: 2},
                        { name: '강아지 훈련', link: '', order: 3},
                    ], order:1},
                {name: '고양이 이야기', subMenu: [
                        { name: '고양이 백과', link: '', order: 1},
                        { name: '고양이 음식', link: '', order: 2},
                        { name: '고양이 훈련', link: '', order: 3},
                    ], order:2},
                {name: '펫플레이스', subMenu: [
                        { name: '주변 동물병원', link: '', order: 1},
                        { name: '애견 카페', link: '', order: 2},
                        { name: '애견 펜션', link: '', order: 3},
                    ], order:3},
                {name: '구조했어요', subMenu: [
                        { name: '구조했어요', link: '/lostPet/lostPet', order: 1},
                        { name: '찾아주세요', link: '', order: 2},
                        { name: '입양공고', link: '', order: 3},
                    ], order:4},
                {name: '중고장터', subMenu: [
                        { name: '강아지 용품', link: '/market/market', order: 1},
                        { name: '고양이 용품', link: '', order: 2},
                        { name: '무료나눔', link: '', order: 3},
                    ], order:5},
                {name: '커뮤니티', subMenu: [
                        { name: '자유게시판', link: '', order: 1},
                    ], order:6},
            ]
        }

        const container = document.querySelector('.menu__container');
        const subContainer = document.querySelector('.menu__sub-menu-container');
        const menuList = document.querySelector('.menu__list');
        const subMenuList = document.querySelector('.menu__list-sub');
        const size = data.list.length;

        const init = () => {
            dataSort();
        }

        const dataSort = () => {
            data.list.sort((a, b) => {
                if(a.order > b.order) {
                    return 1;
                }
                if(a.order < b.order) {
                    return -1;
                }
                return 0;
            });

            render();
        }

        const subMenu = (subMenu) => {
            const parentLiElem = document.createElement('li');
            parentLiElem.classList.add('menu');
            parentLiElem.style.width = 100/Number(size) + '%';
            const ulElem = document.createElement('ul');
            for(let obj of subMenu) {
                const liElem = document.createElement('li');
                const aElem = document.createElement('a');
                aElem.setAttribute('href', obj.link);
                aElem.innerHTML = obj.name;
                liElem.classList.add('menu__sub-menu');
                liElem.appendChild(aElem);
                ulElem.appendChild(liElem);
            }
            parentLiElem.appendChild(ulElem);
            subMenuList.appendChild(parentLiElem);
        }

        const render = () => {
            for(let obj of data.list) {
                const liElem = document.createElement('li');
                liElem.classList.add('menu');
                liElem.innerHTML = obj.name;
                liElem.style.width = 100/Number(size) + '%';
                menuList.appendChild(liElem);
                if(obj.subMenu != null) {
                    subMenu(obj.subMenu);
                }
            }
            addEvent();
        }

        const addEvent = () => {
            container.addEventListener('mouseover', (e) => {
                e.stopPropagation();
                if(e.target.parentElement === menuList) {
                    $(e.target).addClass('menu__list-hover');
                    $(e.target).siblings().removeClass('menu__list-hover');

                    subContainer.classList.remove('menu__disappear');
                    subContainer.classList.add('menu__appear');
                }
            });
            container.addEventListener('mouseleave', (e) => {
                e.stopPropagation();
                if (subContainer.classList.contains('menu__appear')) {
                    subContainer.classList.add('menu__disappear');
                    subContainer.classList.remove('menu__appear')
                }
                $(menuList).children().removeClass('menu__list-hover');
            });
        }

        $.extend(this, {
            init: init
        })
    }

    const menu = new Menu();
    menu.init();

})(jQuery, window);

