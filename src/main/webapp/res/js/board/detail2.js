var cmtListContainerElem = document.querySelector('#cmtListContainer');

var cmtModContainerElem = document.querySelector('.cmtModContainer');

var btnCancelElem = cmtModContainerElem.querySelector('#btnCancel');
btnCancelElem.addEventListener('click', function() {
    cmtModContainerElem.style.display = 'none';
    var selectedTrElem = document.querySelector('.cmt_selected');
    selectedTrElem.classList.remove('cmt_selected');
});
var cmtModFrmElem = cmtModContainerElem.querySelector('#cmtModFrm');
var submitBtnElem = cmtModFrmElem.querySelector('input[type=submit]');
submitBtnElem.addEventListener('click', function (e){
    e.preventDefault();
    var url = '/board/cmt?proc=upd';
    var param = {
        'icmt': cmtModFrmElem.icmt.value,
        'ctnt': cmtModFrmElem.ctnt.value
    };
    fetch(url, {
        'method' : 'POST',
        'headers': {'Content-Type': 'application/json'},
        'body': JSON.stringify(param)
    }).then(function (res){
        return res.json();
    }).then(function (data){
        console.log(data.result);
        switch(data.result){
            case 0 : //수정 실패
                alert('댓글 수정을 할 수 없습니다.');
                break;
            case 1:
                modCtnt(param.ctnt);
                var e = new Event('click');
                btnCancelElem.dispatchEvent(e);
                break;
        }
    }).catch(function (err){
        console.log(err);
    });
});

function modCtnt(ctnt){
    var selectedTrElem = document.querySelector('.cmt_selected');
    var tdCtntElem = selectedTrElem.children[0];
    tdCtntElem.innerText = ctnt;

}
if(cmtListContainerElem) {
    function openModForm(icmt, ctnt) { //구조 분해 할당
        cmtModContainerElem.style.display = 'flex';
        var cmtModFrmElem = cmtModContainerElem.querySelector('#cmtModFrm');
        cmtModFrmElem.icmt.value = icmt;
        cmtModFrmElem.ctnt.value = ctnt;
    }
    function getList() {
        var iboard = cmtListContainerElem.dataset.iboard;
        var url = '/board/cmt?iboard=' + iboard;

        fetch(url).then(function(res) {
            return res.json();
        }).then(function(data) {
            console.log(data);
            displayCmt2(data);
        }).catch(function (err) {
            console.log(err);
        })
    }
    function displayCmt2(data) {
        var tableElem = document.createElement('table');
        tableElem.innerHTML = `
            <tr>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>비고</th>
            </tr>
        `; //템플릿 리터널
        cmtListContainerElem.appendChild(tableElem);

        var loginUserPk = cmtListContainerElem.dataset.loginuserpk === ''? 0 : Number(cmtListContainerElem.dataset.loginuserpk);



        data.forEach(function(item) {
            var tr = document.createElement('tr');
            var ctnt = item.ctnt.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
            tr.innerHTML = `
                <td>${ctnt}</td>
                <td>${item.writerNm}</td>
                <td>${item.rdt}</td>
            `;
            tableElem.appendChild(tr);

            var lastTd = document.createElement('td');
            var btnMod = document.createElement('button');
            btnMod.innerText = '수정';
            btnMod.addEventListener('click', function (){
                tr.classList.add('cmt_selected');
                var ctnt = tr.children[0].innerText;
                openModForm(item.icmt, ctnt);
            });
            var btnDel = document.createElement('button');
            btnDel.innerText = '삭제';
            if(loginUserPk === item.writer) {
                lastTd.appendChild(btnMod);
                lastTd.appendChild(btnDel);
            }
            tr.appendChild(lastTd);
        });
    }

    function displayCmt(data) {
        var tableElem = document.createElement('table');

        var tr = document.createElement('tr');
        var th1 = document.createElement('th');
        th1.innerText = '내용';
        var th2 = document.createElement('th');
        th2.innerText = '작성자';
        var th3 = document.createElement('th');
        th3.innerText = '작성일';
        var th4 = document.createElement('th');
        th4.innerText = '비고';
        tr.appendChild(th1);
        tr.appendChild(th2);
        tr.appendChild(th3);
        tr.appendChild(th4);

        tableElem.appendChild(tr);
        cmtListContainerElem.appendChild(tableElem);
    }
    getList();
}