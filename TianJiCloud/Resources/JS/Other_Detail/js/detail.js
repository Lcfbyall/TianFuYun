$(function(){
	$('#follow').click(function(){
		var open = $(this).attr('data-open');
		if(open == 0) {
			$(this).addClass('grayFollow');
			$(this).attr('data-open','1');
			$(this).text('已关注');
		}else if(open == 1) {
			$(this).removeClass('grayFollow');
			$(this).attr('data-open','0');
			$(this).text('关注');
		}
	});

	$('#like-span').click(function(){
		var addNum = $(this).attr('data-add');
		var text = parseInt($(this).text());
		if(addNum == 0){
			$(this).text(++text);
			$(this).attr('data-add',1);
			$(this).addClass('add-like-span');
		}else if(addNum == 1){
			$(this).text(--text);
			$(this).attr('data-add',0);
			$(this).removeClass('add-like-span');
		}
	});

	
	$('#unlike-span').click(function(){
		var addNum = $(this).attr('data-add');
		if(addNum == 0){
			$(this).text(1);
			$(this).attr('data-add',1);
			$(this).addClass('add-unlike-span');
		}else if(addNum == 1){
			$(this).text('不喜欢');
			$(this).attr('data-add',0);
			$(this).removeClass('add-unlike-span');
		}
	});

	$('#comment-ul').delegate('.commont-like','click',function(){
		var dataFlag = $(this).attr('data-open');
		var nowNumber = parseInt($(this).text());
		console.log(dataFlag);
		if(dataFlag == 0){
			$(this).text(++nowNumber);
			$(this).attr('data-open','1');
			$(this).addClass('commont-liked');
		}else if(dataFlag == 1){
			$(this).text(--nowNumber);
			$(this).attr('data-open','0');
			$(this).removeClass('commont-liked');
		}
	});

	$('#publish-click').click(function(){
		var contentText = $('#inputComment').val();
		if(contentText.length <= 0){
			return false;
		}
		var strAppend = new StringBuffer();
		var dateNow = new Date();
		var hour = dateNow.getHours();
		var min = dateNow.getMinutes();
		strAppend.append('<li>');
		strAppend.append('<div class="float-left comment-img">');
		strAppend.append('<img src="" alt="头像"/>');
		strAppend.append('</div>');
		strAppend.append('<div class="float-left comment-content">');
		strAppend.append('<div class="comment-author">');
		strAppend.append('<span>匿名游客</span>');
		strAppend.append('<div class="float-right commont-like" data-open="0">0</div>');
		strAppend.append('</div>');
		strAppend.append('<p class="font-30">'+contentText+'</p>');
		strAppend.append('<div class="reply-time font-24">');
		strAppend.append('今天'+hour+":"+min+' · 0条回复');
		strAppend.append('</div>');
		strAppend.append('</div>');
		strAppend.append('<div class="clear"></div>');
		strAppend.append('</li>');
		$('#comment-ul').prepend(strAppend.toString());
	});
});


function StringBuffer() {
    this.__strings__ = new Array();
}
StringBuffer.prototype.append = function (str) {
    this.__strings__.push(str);
    return this;    //鏂逛究閾惧紡鎿嶄綔
}
StringBuffer.prototype.toString = function () {
    return this.__strings__.join("");
}