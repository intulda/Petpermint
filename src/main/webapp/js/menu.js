"use strict";
(($, exports) => {

    $.extend(true, window, {
        "Menu": Menu
    })

    function Menu() {

        const data = {
            list : [
                {name: '강아지 이야기', link:'/info/dogPage', subMenu: [
  						{ name: '강아지 백과', link: '/info/dogPage', order: 1},
                        { name: '강아지 음식', link: '/info/dogListPageView?Type=음식', order: 2},
                        { name: '강아지 훈련', link: '/info/dogListPageView?Type=훈련', order: 3},
                    ], order:1},
                {name: '고양이 이야기', link:'', subMenu: [
                        { name: '고양이 백과', link: '', order: 1},
                        { name: '고양이 음식', link: '', order: 2},
                        { name: '고양이 훈련', link: '', order: 3},
                    ], order:2},
                {name: '펫플레이스',link:'/placeBoard/placeBoardList', subMenu: [
                        { name: '펫플레이스', link: '/placeBoard/placeBoardList', order: 1},
                    ], order:3},

                {name: '구조했어요', link:'', subMenu: [
                        { name: '구조했어요', link: '/lostPet/lostPet', order: 1},
                    ], order:4},
                {name: '커뮤니티', link:'', subMenu: [
                        { name: '자유게시판', link: '', order: 1},
                    ], order:5},
            ]
        }

        const container = document.querySelector('.menu__container');
        const subContainer = document.querySelector('.menu__sub-menu-container');
        const menuList = document.querySelector('.menu__list');
        const hamburgerMenuList = document.querySelector('.header__hamburger-menu-list');
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
                const liElem2 = document.createElement('li');
                const aElem = document.createElement('a');
                const aElem2 = document.createElement('a');
                aElem.setAttribute('href', obj.link);
                aElem2.setAttribute('href', obj.link);
                aElem.innerHTML = obj.name;
                aElem2.innerHTML = obj.name;
                liElem.classList.add('menu');
                liElem.style.width = 100/Number(size) + '%';
                liElem.appendChild(aElem);
                liElem2.classList.add('menu');
                liElem2.style.width = 100/Number(size) + '%';
                liElem2.appendChild(aElem2);

                hamburgerMenuList.appendChild(liElem2);
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
