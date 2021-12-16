var frmElem = document.querySelector('#frm');
var submitBtnElem = document.querySelector('#submitBtn');

submitBtnElem.addEventListener('click', function (){
   if(frm.upw.value != null && frm.changedUpw.value != null && frm.changedUpw.value == frm.changedUpwConfirm.value && frm.upw.value.length >=5 && frm.changedUpw.value.length >=5 && frm.changedUpw.value != frm.upw.value){
       frmElem.submit();
   }else if(frm.upw.value == null){
       alert("비밀번호를 입력해주세요");
   }else if(frm.changedUpw.value == null){
       alert("변경할 비밀번호를 입력해주세요");
   }else if(frm.changedUpw.value != frm.changedUpwConfirm.value || frm.changedUpw.value == frm.upw.value){
       alert("변경할 비밀번호를 확인해주세요");
   }else if(frm.upw.value.length < 5 || frm.upw.value.length > 20 || frm.changedUpw.value.length <5 || frm.changedUpw.value.length>20) {
       alert('비밀번호를 5~20자 사이로 작성해 주세요.');
   }
});